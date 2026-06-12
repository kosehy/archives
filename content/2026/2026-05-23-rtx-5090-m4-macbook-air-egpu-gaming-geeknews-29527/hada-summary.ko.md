# RTX 5090과 M4 MacBook Air: 게임이 가능할까?

- GeekNews URL: https://news.hada.io/topic?id=29527
- Original source URL: https://scottjg.com/posts/2026-05-05-egpu-mac-gaming/
- Submitted URL: https://share.google/o9Z1nS6Laq82pI8KB

## GeekNews 본문 보존

- M4 MacBook Air에 **RTX 5090 eGPU**를 붙여 Linux VM에서 게임을 실행했고, macOS 드라이버 부재와 Thunderbolt 제약을 우회해야 했음

- 구현에는 **apple-dma-pci** 가상 PCI 장치, DART 매핑 우회, kprobes 기반 NVIDIA 드라이버 패치, QEMU/HVF 수정이 필요했음

- Cyberpunk 2077은 M4 Air + eGPU에서 **4K RT Ultra 27fps**, DLSS 프레임 생성 사용 시 111fps까지 올라 플레이 가능해짐

- 같은 RTX 5090을 일반 PCIe PC에 꽂으면 게임에 따라 **2~4배** 빠르며, FEX·Proton·VM·Thunderbolt 오버헤드가 크게 남음

- 더 큰 성과는 **AI 추론**으로, M4 Air의 Qwen prefill이 약 100배 줄고 단일 스트림 생성이 약 22 tok/s에서 155 tok/s로 증가함

## Thunderbolt eGPU와 Apple Silicon Mac의 제약

- Thunderbolt eGPU 구조 **RTX 5090** 같은 데스크톱 GPU를 Thunderbolt dock에 꽂고, dock이 PCIe를 Thunderbolt로 변환해 M4 MacBook Air의 USB-C 포트에 연결하는 방식임 Thunderbolt는 USB-C 케이블 위로 **PCIe를 터널링**하므로, 컴퓨터 입장에서는 Thunderbolt 장치가 USB 장치가 아니라 PCIe 장치로 보임 Thunderbolt 4는 최대 40Gbps의 4개 PCIe lane을 제공하며, 터널링으로 인한 작은 성능 손실이 있음 일반적으로 Linux와 Windows에서는 eGPU가 약간 느린 PCIe 장치처럼 인식되어 기존 드라이버로 거의 바로 동작함 첫 번째 장애물은 **Apple Silicon macOS**가 NVIDIA나 AMD GPU 드라이버를 기본 제공하지 않는다는 점임

- Linux VM을 통한 우회 [Apple Silicon Mac에서 Linux 실행은 가능](https://asahilinux.org)하지만, 현재 Linux kernel은 Apple Silicon에서 Thunderbolt를 지원하지 않고 내부 장치와 USB3만 지원함 macOS host 위에서 64비트 ARM Linux VM을 실행하면, macOS는 Thunderbolt 장치를 처리하고 Linux는 NVIDIA GPU를 처리하는 조합이 가능함 ARM64 Windows용 NVIDIA 카드 드라이버가 없어 Linux를 사용함 [tinygrad의 macOS eGPU 드라이버](https://x.com/__tinygrad__/status/2039213719155310736)는 tinygrad 스택 안에서만 사용할 수 있어, AI 추론이나 게임 실행용 범용 드라이버로는 맞지 않았음

## macOS에서 PCI 패스스루 구현

- PCI BAR와 DMA VM이 PCI device와 통신하려면 **PCI BAR(Base Address Registers)** 와 DMA가 동작해야 함 PCI BAR는 PCI device가 컴퓨터와 읽고 쓰기 위해 사용하는 메모리 영역이며, PCI 패스스루가 동작하려면 이 영역을 VM 안에 mirror해야 함 **DMA(Direct Memory Access)** 는 device가 CPU 복사 없이 컴퓨터 메모리를 직접 읽고 쓰는 방식임

- Hypervisor.framework와 BAR 매핑 QEMU는 VM을 시작할 때 `Hypervisor.framework`의 `hv_vm_map()`을 호출해 guest memory layout을 설정함 host PCIDriverKit driver에 연결해 `IOConnectMapMemory64()`로 PCI device memory를 process에 매핑하면 BAR0 memory를 읽을 수 있음 `BAR0[0]`을 읽으면 RTX 5090을 가리키는 device-specific constant인 `0x1b2000a1`이 출력됨 QEMU가 device memory를 guest에 직접 매핑하면 guest가 GPU와 직접 통신할 수 있지만, 처음에는 VM이 PCI BAR memory를 건드리는 순간 host kernel이 crash함 원인은 QEMU가 RAM-device/MMIO mapping에도 `HV_MEMORY_EXEC`를 붙인다는 점이었고, device/MMIO mapping에서는 `EXEC`를 제거하는 workaround로 host panic을 피함 이 방식은 trapping every access보다 약 **30배 빠르지만**, `hv_vm_map()`이 ARM device memory subtype을 지정할 수 없어 BAR 쓰기는 정상적인 경우보다 약 **10배 느림**

## DMA와 DART 제약 우회

- Apple Silicon의 DART 한계 Apple Silicon에는 IOMMU와 비슷한 **DART** hardware unit이 있으며, device가 임의의 host memory에 접근하지 못하게 하는 보안 경계로도 동작함 PCIDriverKit을 통한 Thunderbolt device 사용에서는 세 가지 제약이 컸음 약 **1.5GB mapping limit** 때문에 CUDA와 현대 게임에 필요한 8–16GB급 메모리 매핑을 그대로 둘 수 없음 약 **64k mapping cap** 때문에 작은 DMA buffer가 많으면 mapping table이 가득 참 주소와 alignment를 직접 고를 수 없어 guest가 DMA address를 정하는 virtual IOMMU 방식이 맞지 않음 [`restricted-dma-pool`](https://lwn.net/Articles/841916/)로 DMA를 pre-allocated region에 강제하는 방식은 단순한 device에는 동작했지만 GPU driver에는 맞지 않았음

- `apple-dma-pci` 가상 PCI 장치 QEMU에 **`apple-dma-pci`** 라는 virtual PCI device를 추가해 passed-through GPU와 함께 VM에 삽입함 guest kernel driver가 NVIDIA driver의 DMA mapping call을 가로채고, DMA request마다 on-demand mapping을 만들며 buffer가 해제되면 mapping도 해제함 이 구조에서는 guest RAM 전체가 아니라 그 순간 live DMA buffer working set만 1.5GB limit 안에 들어가면 됨 guest driver는 NVIDIA driver가 GPU를 사용하기 전 custom DMA ops로 교체되고, `map_page`, `unmap_page`, `map_sg`, `unmap_sg`, `alloc`, `free`를 얇은 wrapper로 처리함 host 쪽 QEMU는 request를 PCIDriverKit driver로 넘기고, 이 driver가 실제 DART mapping을 수행한 뒤 DMA address를 guest memory에 다시 기록함

- NVIDIA alignment 문제와 kprobes 패치 CUDA workload 실행 중 `NV_ERR_INVALID_OFFSET`과 `RM_PAGE_SIZE_HUGE` alignment 관련 kernel log가 발생함 문제 allocation은 `UVM_RM_MEM_TYPE_SYS` 타입의 **16MB allocation**이었고, NVIDIA driver가 2MB page size를 사용하면서 alignment 제약과 충돌함 driver에는 `NV_ERR_NO_MEMORY` 실패 시 default page size로 재시도하는 workaround가 있었지만, `NV_ERR_INVALID_OFFSET`은 처리하지 않았음 Linux kernel의 [kprobes](https://www.kernel.org/doc/html/latest/trace/kprobes.html)를 사용해 `nvUvmInterfaceMemoryAllocSys()` 호출에서 `pageSize`를 `UVM_PAGE_SIZE_DEFAULT`로 강제함 NVIDIA driver 자체를 수정하지 않고도 작은 page size를 요청하게 만들어 simple workload가 동작함

- Mapping coalescing으로 64k cap 회피 게임 설정을 높이면 tiny mapping이 많이 생겨 약 **64k mapping count limit**을 넘음 mapping log에서는 **90% 이상**의 mapping이 4kB였고, contiguous하지는 않지만 cluster 형태로 나타남 guest memory를 256kB 같은 fixed-size region으로 나누고, 4kB buffer가 mapping될 때 해당 cluster 전체를 mapping해 이후 같은 cluster의 allocation이 기존 mapping을 재사용하도록 함 이 방식은 실제 live buffer보다 약간 더 많은 memory를 mapping하지만, 테스트 workload에서는 약 1.5GB mapping ceiling 아래에 머물렀음 live mapping 수가 대략 **4배 감소**해 demanding game을 highest settings로 실행할 headroom이 생김

## VM 성능 개선

- vCPU scheduling benchmark score가 무작위로 크게 흔들리고 종종 **50% 느리게** 나오는 문제가 있었음 QEMU가 vCPU thread에 priority를 설정하지 않아 scheduler가 VM에 충분한 실행 시간을 주지 않는 상황으로 보였음 `pthread_set_qos_class_self_np(QOS_CLASS_USER_INTERACTIVE, 0)`와 `pthread_setschedparam(..., SCHED_RR, ...)`를 QEMU vCPU start 경로에 patch해 높은 priority를 부여함

- Total Store Ordering과 FEX-Emu VM은 arm64 Linux지만 대부분의 shipping game은 x86-64 Windows binary라 [Proton](https://en.wikipedia.org/wiki/Proton_(software))과 [FEX-Emu](https://fex-emu.com)를 함께 사용함 x86은 store가 program order대로 다른 core에 보이는 **Total Store Ordering(TSO)** 을 사용하지만, ARM은 더 약한 memory ordering model을 사용함 Apple Silicon에는 per-thread hardware **TSO mode**가 있으며, macOS 15+의 `Hypervisor.framework`에서 이를 노출함 [UTM](https://mac.getutm.app)의 patch를 가져와 vCPU에서 `ACTLR_EL1` bit 1을 켜고, FEX-Emu의 software TSO emulation을 끔 hardware bit 없이 software TSO emulation을 끄면 Geekbench 6가 중간에 crash함 FEX와 CPU TSO를 사용한 guest performance는 native host performance보다 약 **50% 낮음**

## 게임 성능

- Cyberpunk 2077 Cyberpunk 2077은 M4 Air 네이티브 macOS, M4 Air + eGPU, 2020 Intel MacBook Pro + eGPU, M5 Max 네이티브 macOS, M5 Max + eGPU, i5-12600K gaming PC + RTX 5090에서 테스트됨 `+ Framegen`은 eGPU/네이티브 PCIe 구성에서는 [DLSS](https://en.wikipedia.org/wiki/Deep_Learning_Super_Sampling) 4x를, 네이티브 macOS 구성에서는 FSR 2x를 사용함 720p Low에서는 GPU 부하가 작아 **CPU와 에뮬레이션/가상화 오버헤드**가 지배적이었고, M4 Air 네이티브 61fps가 M4 Air + eGPU 49fps보다 빨랐음 1080p High에서는 M5 Max 네이티브 macOS가 131fps로 M5 Max + eGPU 68fps보다 빨랐고, 통합 GPU가 충분한 조건에서는 오버헤드가 더 크게 작용함 M4 Air 네이티브 macOS는 1080p RT Ultra에서 **7fps**에 그쳤지만, M4 Air + eGPU는 **30fps**, 프레임 생성 사용 시 **119fps**를 기록함 4K에서는 GPU 병목이 중심이 되며, M4 Air + eGPU는 RT Ultra **27fps**, DLSS 프레임 생성 사용 시 **111fps**를 기록해 플레이 가능한 수준으로 올라감 네이티브 PCIe gaming PC는 4K RT Ultra **100fps**, DLSS 프레임 생성 사용 시 **282fps**로 가장 빨랐음 M5 Max + eGPU는 4K RT Ultra **47fps**, 프레임 생성 사용 시 **145fps**였고, M4 Air + eGPU보다 대략 **30~70%** 빨랐음

- 다른 게임과 벤치마크 GravityMark에서는 동일 GPU를 PCIe 슬롯 대신 Thunderbolt로 연결하면 성능이 약 **20%** 줄었고, M4 Air + eGPU는 네이티브 PCIe 연결보다 약 **31%** 느렸음 Shadow of the Tomb Raider에서 eGPU는 M4 Air를 4K 네이티브 **8fps**에서 **40fps**로 올렸고, 1080p도 네이티브 **26fps**에서 eGPU **42fps**로 개선함 Shadow of the Tomb Raider의 eGPU 성능은 1080p와 4K가 거의 같아, 병목이 GPU가 아니라 FEX 아래의 CPU에 있음을 드러냄 Horizon Zero Dawn Remastered는 가장 낮은 720p 설정에서도 한 번에 **1.5GB**보다 많은 DMA memory mapping을 요구해 벤치마크를 시작할 수 없었음 Doom (2016)은 eGPU 구성에서 동작했고, 성능 오버레이 기준 **49fps**가 나왔으며 항상 **30fps** 이상을 유지함 Crysis Remastered는 게이밍 PC보다 최대 약 **4배** 느렸지만, M4 MacBook Air에서도 플레이 가능한 프레임레이트로 실행됨

## AI 추론 성능

- Qwen 3.6 [Qwen](https://huggingface.co/Qwen) 35B MoE 모델을 4비트 양자화해 테스트했으며, 활성 파라미터는 **3B**임 NVIDIA GPU에서는 vLLM과 **NVFP4** 버전을 사용하고, Apple Silicon에서는 vllm-mlx와 4비트 MLX 양자화 모델을 사용함 벤치마크는 [`llama-benchy`](https://github.com/johnwlambert/llama-benchy)로 실행됨 Thunderbolt eGPU는 PCIe 대비 약 **9%** 성능을 잃었지만, 대부분의 처리가 카드에서 일어나 PCIe와 꽤 비슷했음 RTX 5090은 단일 스트림 생성에서 M4 Air보다 **6.5배**, M4 Max Mac Studio보다 **2.1배**, M5 Max MacBook Pro보다 **1.2배** 빨랐음 4K 토큰 프롬프트에서 M4 MacBook Air는 prefill에 **17초**가 걸렸지만, 같은 M4 Air에 eGPU를 붙이면 **150ms**로 줄어 **120배** 빨라짐 동시 요청을 1개에서 4개로 늘리면 RTX 5090 구성의 총 처리량이 약 **3배** 증가했고, Apple Silicon Mac은 이보다 낮은 확장성을 보였음

- Gemma 4 Gemma 4 31B는 희소 MoE가 아닌 **dense 31B 모델**이라 모든 토큰이 전체 파라미터를 지나야 함 M4 Air 통합 GPU는 테스트 중 **초당 2~3토큰**을 넘기지 못해 유용한 범위 밖으로 분류됨 vLLM 기반 RTX 5090 구성은 모두 **약 50 t/s**로 몇 퍼센트 이내에 모였고, M4 Max Mac Studio는 약 **22 t/s**, M5 Max MacBook Pro는 약 **27 t/s**를 기록함 prefill에서도 RTX 5090은 항상 **400ms 미만**이었지만, M4 Max는 4K 토큰 프롬프트 파싱에 최대 **21초**, M5 Max는 약 **7.5초**가 걸림 vLLM 구성은 4개 동시 요청에서 약 **3.5배** 처리량을 기록했고, Mac의 MLX 백엔드는 4개 요청에서 거의 더 늘지 않았음

## 직접 실행 가능 여부와 안정성

- 배포와 빌드 조건 현재 상태는 “다운로드하면 바로 실행”할 수 있는 수준이 아니며, Apple의 **특수 entitlement**가 필요함 entitlement를 요청했지만 아직 답을 받지 못했고, 대기 시간이 몇 달일 수 있음 그동안은 드라이버를 직접 빌드할 수 있으며, 서명 인증서 계정에 해당 Mac이 포함되어야 함 SIP를 비활성화하거나 reduced security mode를 사용할 필요는 없음 코드는 [qemu-vfio-apple](https://github.com/scottjg/qemu-vfio-apple)에서 받을 수 있음 포함된 런처는 특수 `apple_dma` 드라이버가 설치된 사전 빌드 Ubuntu 이미지를 자동 다운로드함

- 안정성 안정성은 아직 좋지 않음 FEX에는 현재 [Steam이 루프 형태로 자주 크래시하는 버그](https://github.com/FEX-Emu/FEX/issues/5336)가 있고, 이 구성에서는 문제가 더 심해 보임 특정 게임을 시작하는 데 몇 분이 걸릴 수 있음 DMA mapping 한도 때문에 시간이 지나며 mapping이 조각화될 수 있고, 새 게임을 실행할 공간이 부족해질 수 있음 이 경우 Linux VM을 중지하고 GPU를 뺐다 다시 꽂아 DMA mapping을 모두 지운 뒤 다시 시도해야 함 가장 안정적인 작업은 **AI**이며, 이 용도에서는 매우 잘 동작함 upstream QEMU와 패치 통합을 진행 중이며, 이상적으로는 [UTM](https://mac.getutm.app) 같은 QEMU 주류 배포판에 포함되어 바로 동작하는 형태가 목표임


## 관련 GeekNews 토픽

- [RTX 5090와 Raspberry Pi: 게임이 가능할까?](https://news.hada.io/topic?id=25741)
- [M4 24GB 메모리에서 로컬 모델 실행하기](https://news.hada.io/topic?id=29385)
- [M4 Pro Mac mini의 저장 용량을 반값에 업그레이드하기](https://news.hada.io/topic?id=21933)
- [Apple, M5 Pro/Max 탑재한 MacBook Pro 14/16 공개](https://news.hada.io/topic?id=27177)
- [antirez/ds4 - Metal용 DeepSeek V4 Flash 로컬 추론 엔진](https://news.hada.io/topic?id=29299)

## 댓글 보존

### 댓글 1
- Metadata: GN⁺ 8일전 [-]
Hacker News 의견들 몇 년 동안 VM 팀에 VM GPU 패스스루 를 요청해 왔음. Apple Silicon Mac Pro 작업을 했는데, 케이스 안에 들어가는 GPU를 Linux VM에 패스스루할 수 있었다면 훨씬 말이 됐을 것 같음 아쉽게도 요청은 받아들여지지 않았지만, 다른 사람들이 작동시킨 건 멋짐 여기서 패스스루 부분은 내가 보기엔 표준 DriverKit 인터페이스 로 구현된 것 같음. 즉 PCIe BAR는 macOS를 추가 수정하지 않아도 이미 사용자 공간에 매핑 가능함 결국 QEMU 같은 가상 머신 모니터가 Linux VFIO 같은 방식에 더해 이 인터페이스를 채택하면 되는 문제로 보임. Virtualization.framework를 말하는 거라면 그 자체가 일종의 가상 머신 모니터에 가깝고, macOS에 정확히 무엇이 빠져 있다고 보는지 궁금함 관련해서 반쯤 흥미로운 점이 두 가지 있음. 첫째, Virtualization.framework 는 호스트의 GPU 패스스루 비슷한 기능을 지원하는 듯함. eGPU는 아니고 내장 GPU용이며, 주된 용도는 macOS 게스트가 호스트와 GPU 시간을 공유하면서 가속을 받는 것 같음 최근 QEMU 메인라인에도 Hypervisor.framework 아래의 Linux 게스트에서 비슷한 기능을 지원하기 위해 virtio-gpu와 함께 "venus server"를 쓰는 패치가 들어갔음. 둘째, Apple 내부에는 Virtualization.framework용 PCI 패스스루 지원이 있는 듯함. 프레임워크 코드 자체는 고객에게 배포되지만, 일반 macOS에는 포함되지 않는 kext나 커널 구성요소에 의존하는 것 같음. 고객에게 공개할 의도가 있는지는 모르겠지만, Apple 안에서 누군가는 이 기능을 생각해 본 게 분명함 앞으로 Mac Pro 가 또 나올 가능성이 얼마나 될까? Apple이 언젠가 Siracusa를 만족시키는 컴퓨터를 만들 수 있을까, 그리고 "Believe" 셔츠는 갖고 있는지도 궁금함 이 글에서 문제의 절반은 QEMU와 VM 경계가 일으키는 메모리 접근 문제 를 다루는 것처럼 보임. 뭔가 멍청하게 놓친 게 있을 수도 있지만, Docker에서 Ubuntu를 띄우면 NVIDIA 드라이버는 여전히 로드되지 않을까? 그러면 메모리는 OSX가 계속 소유하니 Apple의 메모리 관리와 싸울 필요가 없을 것 같음 Mac Pro에서 NVIDIA GPU 지원 부재 는 기술 업계의 가장 큰 놓친 기회 중 하나로 남을 거라고 아직도 봄 어쨌든 Mac Pro는 이제 죽은 제품임. 오디오·비디오 전문가 판매만으로는 한계가 있음 훌륭한 글임. 게임 벤치마크도 재미있지만, 실용적으로는 LLM 성능 개선 이 정말 흥미로운 부분임 Apple 플랫폼은 RAM이 많아 로컬 모델을 돌리기 쉬운 접근성 좋은 환경이지만, 상대적으로 느린 프롬프트 처리 속도는 자주 간과됨. 글의 인용처럼 4K 토큰 프롬프트에서 M4 MacBook Air는 응답 생성을 시작하기 전 파싱에 17초가 걸리는데, eGPU를 붙이면 150ms면 끝나서 120배 빠름. 작은 채팅으로 LLM을 만질 때는 사전 채움(prefill) 문제가 잘 안 보이지만, 더 큰 작업에 쓰기 시작하면 연산 한계가 병목이 됨. 첫 토큰까지의 시간(TTFT) 차트도 나빠 보이지 않다가, Mac 플랫폼이 전체 GPU 연산보다 너무 느려서 로그 스케일로 그려야 했다는 점을 보면 의미가 달라짐 전문가가 아니라 궁금한데, 왜 Mac에서 TTFT 가 그렇게 훨씬 나쁜지 아는지 궁금함. 글에서는 이 단계가 연산에 묶인다고만 하는데, 정말 그렇게 단순한 건지 아니면 MLX 쪽 최적화가 덜 된 것도 있는지 궁금함 사소하게 들릴 수 있지만 실제로는 113배 빠른 것 임 저자가 결과를 이런 식으로 제시하면 편향돼 보이는 인상을 줄 수 있는데, 실제로 그렇지는 않을 거라고 믿음 oMLX 를 쓰면 됨. Qwen3.6에서 프롬프트 처리 300토큰/초, 토큰 생성 30토큰/초가 나옴 OpenGL이 macOS에서 더 이상 잘 지원되지 않아서 게임이 CrossOver로도 완전히 플레이 불가능하다는 부분은 맞는 것 같음 다만 Doom은 Vulkan 을 지원하는 듯하고, MoltenVK에 VK_NV_glsl_shader 를 추가하면 될 가능성이 있음. M4에 RTX 5090을 매다는 작업보다는 훨씬 적은 일일 것 같지만, 그래도 Scott에게 박수를 보냄. 로컬 AI 추론 속도도 꽤 멋지고, 정말 미친 프로젝트임 꽤 인상적임. 내 인상으로는 Apple Silicon에서는 eGPU가 그냥 안 되는 것 이었음 Apple도 같은 입장임. “eGPU를 사용하려면 Intel 프로세서가 탑재된 Mac이 필요합니다.” 게다가 공식 지원 eGPU도 전부 NVIDIA가 아니라 AMD였음. https://support.apple.com/en-us/102363 이건 macOS에서 eGPU를 쓰는 게 아님. 예를 들어 macOS의 Chrome이 이 eGPU의 가속을 받아 실행되는 식은 불가능함 여기서는 그 eGPU를 Linux VM으로 터널링 하는 구조임 처음에는 느린 tinygrad 드라이버로 VM을 돌리는 글일 줄 알았는데, 실제로는 훨씬 더 나은 접근이었음 Apple이 더 잘 지원하고 1.5GB 창 제한 을 완화해 주면 훨씬 쉬워질 텐데 아쉬움. Arm은 전반적으로 PCIe 장치와 관련된 특이점이 있지만, 적어도 Linux에서는 최신 드라이버 대부분이 arm64를 1급 시민으로 다루면서 훨씬 쉬워졌음 확실히는 모르지만, tinygrad 쪽이 느린 이유가 macOS 호스트 드라이버 자체 때문은 아닐 것 같음. 내가 하는 것과 매우 비슷하게 PCI BAR를 사용자 공간에 매핑한 뒤 Python 코드로 GPU를 구동하는 구조로 보임 추측이지만 tinygrad가 느린 큰 이유는 tinygrad 추론 엔진이 이런 공개 LLM 모델들에 아직 많이 최적화되지 않았기 때문일 가능성이 큼. 아마 대부분의 작업은 George의 자율주행 하드웨어 회사용 스택 최적화에 들어갔을 것 같음. 기존 CUDA 커널을 그 엔진에서 그대로 돌릴 수 없으니 엔지니어링 난도가 훨씬 올라감. 내 프로젝트가 그들과 macOS 호스트 드라이버를 공유할 수 있을지도 궁금함. 일부 변경은 필요하겠지만 겹치는 부분이 꽤 있어 보임 “요즘 대부분의 프로젝트 첫 단계는 인정하기 싫지만 AI에게 물어보는 것”이라는 대목은, 더 가능성 높게는 AI가 자기도 모르는 것 을 알려줄 거라는 뜻이 됨 어제 ChatGPT와 5070TI가 실제 그래픽 카드인지 논쟁했던 일이 떠오름. ChatGPT는 그런 5070TI 카드는 없으니 4070ti를 말한 게 틀림없다고 계속 정정하려 했음 실수를 인정하고 나서도 같은 실수 를 계속 반복하기도 함 Claude에게 PowerShell 7에 대한 HTML 페이지를 만들라고 했더니 7.4가 최신 LTS 릴리스라고 썼음. 7.6이 3월에 릴리스됐다는 링크를 주고 최신 정보로 다시 만들라고 했는데, 거의 같은 페이지를 만들면서 7.4가 최신 릴리스라는 같은 주장을 반복했음 LLM은 대체로 최전선 주제의 그럴듯함 에 대해 강한 판정을 내리기에는 위치가 좋지 않음 그래도 원 글에 대한 ChatGPT의 답변은 정확히 맞았음. “매우 깊고”, “거의 실용 불가능에 가깝고”, “연구 관점에서”라는 요약은 이 글 자체를 완벽하게 설명함 초강대국의 경제 전체와 온라인 문화 거의 전부가 Furby 에 열광하는 걸 보는 건 지금까지 본 것 중 가장 이상한 일 중 하나였음 그래서 나는 Grok expert mode 를 씀. 웹에서 정보를 공격적으로 찾아보니까, 1년 된 데이터에 의존하는 것보다 훨씬 나음 GPT-OSS 120B와 Cascade Lake Xeon 워크스테이션 CPU 부품에는 GPU가 없다고 논쟁한 적이 있음. 모델은 정반대로 강하게 주장했음 이건 정말 대단함. 남는 5090 이 있고 M4 Mini에서 claw-like를 돌리고 있는데, 안정성을 위해 3D 프린트 프레임 같은 것에 꽂고 TB 포트에 연결하면 로컬 추론용으로 꽤 쓸 만한 도구가 될 수도 있겠음 전원 공급 같은 걸 깔끔하게 보장하는 장치가 필요하긴 함. 문제는 max-num-seqs 와 max-model-len 이 서로 충돌한다는 점이고, 순수 단일 클라이언트 모드가 아니라면 말하자면 여러 슬롯이 필요함 Apple 승인만 통과할 수 있다면 AI 추론 에 꽤 유용해 보임. Mac Mini에서 NVIDIA GPU를 쓰고 싶었는데, 이 방식이면 CUDA를 직접 돌릴 수 있게 됨. 정말 멋짐

# Figure Notes

원문 ScottJG 글의 이미지 자산 11개를 로컬에 보존했다. Contact sheet를 시각 확인했으며, 벤치마크와 실행 스크린샷은 원문 저자의 실험 증거로 취급한다. 수치 검증용 원데이터는 별도 제공되지 않았으므로 재사용 시 "저자 실험 기준"이라고 표기한다.

## figure-01
- Status: recovered
- File: `figures/figure-01.jpg`
- Shows: Ubuntu/Linux VM 화면이 떠 있는 MacBook Air와 옆에 연결된 eGPU 장비.
- Why it matters: 전체 프로젝트의 실제 실험 환경을 보여주는 대표 사진이다. 성능 수치 증거보다는 구성 증거다.

## figure-02
- Status: recovered
- File: `figures/figure-02.png`
- Shows: ChatGPT가 "현재로서는 실용적이지 않고 매우 깊은 연구 프로젝트"라고 답하는 캡처.
- Why it matters: 불가능해 보이는 문제를 실제로 밀어붙였다는 글의 서사 장치다. 기술 증거는 아니다.

## figure-03
- Status: recovered
- File: `figures/figure-03.jpg`
- Shows: Thunderbolt dock, 외장 RTX GPU, MacBook, 외부 모니터 연결.
- Why it matters: Thunderbolt eGPU 물리 구성을 보여준다. 성능 증거보다는 구성 증거다.

## figure-04
- Status: recovered
- File: `figures/figure-04.png`
- Shows: tinygrad eGPU 경로와 Metal 경로의 llama.cpp/llama 계열 추론 비교 차트. 화면에는 tinygrad eGPU가 Metal보다 훨씬 느리다는 "10x faster" 비교가 보인다.
- Why it matters: tinygrad eGPU 드라이버가 범용 게임/추론 해법이 되기 어렵다는 배경 주장에 쓰인다. 정확한 수치는 원문이 인용한 영상/저자 해석 기준이다.

## figure-05
- Status: recovered
- File: `figures/figure-05.png`
- Shows: macOS host, QEMU, Linux VM, NVIDIA GPU driver, external monitor, GPU를 연결하는 PCI passthrough 구조도.
- Why it matters: 이 아카이브의 핵심 개념도다. Mac이 Thunderbolt와 Hypervisor.framework 쪽을 맡고, Linux VM이 NVIDIA 드라이버와 GPU 사용을 맡는 분할 구조를 설명한다.

## figure-06
- Status: recovered
- File: `figures/figure-06.png`
- Shows: macOS Problem Report 또는 커널 패닉/충돌 리포트 화면.
- Why it matters: PCI BAR/MMIO 매핑을 잘못 다루면 host kernel crash가 난다는 시행착오 증거다.

## figure-07
- Status: recovered
- File: `figures/figure-07.jpg`
- Shows: Cyberpunk 2077을 Linux VM/Steam 환경에서 실행하는 화면과 터미널/성능 모니터.
- Why it matters: 게임 실행 가능성의 대표 스크린샷이다. 자세한 fps 수치는 본문 벤치마크 문단을 우선한다.

## figure-08
- Status: recovered
- File: `figures/figure-08.jpg`
- Shows: Shadow of the Tomb Raider benchmark 또는 게임 화면.
- Why it matters: eGPU 경유 게임 실행의 두 번째 사례다. 원문은 4K native 8fps에서 eGPU 40fps, 1080p native 26fps에서 eGPU 42fps로 개선됐다고 설명한다.

## figure-09
- Status: recovered
- File: `figures/figure-09.jpg`
- Shows: Horizon Zero Dawn Remastered 오류 대화상자.
- Why it matters: DMA mapping limit 때문에 일부 게임이 시작조차 안 될 수 있다는 반례다. "가능하다"보다 "아직 불안정하고 제한적"이라는 결론에 중요하다.

## figure-10
- Status: recovered
- File: `figures/figure-10.jpg`
- Shows: Doom 2016 실행 화면, Steam/터미널/성능 모니터가 함께 보임.
- Why it matters: macOS에서 실행이 어려운 구형 OpenGL 계열 게임을 Linux VM + eGPU로 돌린 사례다. 원문은 대략 49fps, 30fps 이상 유지라고 설명한다.

## figure-11
- Status: recovered
- File: `figures/figure-11.jpg`
- Shows: Crysis Remastered 실행 화면과 성능 모니터.
- Why it matters: "Can it run Crysis?"라는 고전적 성능 밈에 대한 실험 증거다. 원문은 M4 Air도 playable framerate가 가능하지만 gaming PC가 거의 4x 빠르다고 설명한다.

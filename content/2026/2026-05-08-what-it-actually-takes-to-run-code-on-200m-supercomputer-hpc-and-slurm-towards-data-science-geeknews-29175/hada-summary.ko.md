# 2억 유로 슈퍼컴퓨터에서 코드를 실행하는 데 실제로 필요한 것

## GeekNews Metadata
- GeekNews URL: https://news.hada.io/topic?id=29175
- Shared URL: https://share.google/SHmosP4XMZFVvgm62
- Original source URL: https://towardsdatascience.com/what-it-actually-takes-to-run-code-on-200me-supercomputer/
- Preservation scope: GeekNews summary body, related links, and public comments visible at capture time.

## GeekNews Body
- 바르셀로나 카탈루냐 공대의 **MareNostrum V**는 세계 15대 슈퍼컴퓨터 중 하나로, 8,000개 노드에 걸쳐 분산 컴퓨팅을 수행하는 €2억 규모의 공공 연구 인프라
- 단일 고성능 컴퓨터가 아니라 수천 대의 독립 컴퓨터가 **InfiniBand NDR200 팻트리 토폴로지**로 연결된 분산 시스템이며, 어떤 노드든 동일한 최소 지연 시간으로 통신 가능
- 작업 제출은 **SLURM 워크로드 매니저**를 통해 이루어지며, 리소스 요청·시간 제한·프로젝트 예산을 명시한 배치 스크립트로 스케줄러에 작업을 큐잉
- 외부 인터넷 접속이 차단된 **에어갭 환경**에서 운영되므로, 필요한 라이브러리와 데이터셋을 사전에 준비해야 하며 컴퓨팅보다 결과 추출이 병목이 되기도 함
- 연구자에게 무료로 제공되는 공공 자원으로, 스페인 기관은 RES를 통해, 유럽 전역은 **EuroHPC 공동사업**의 정기 공모를 통해 접근 가능

## 아키텍처: 네트워크가 곧 컴퓨터

- HPC에서 가장 큰 오해는 하나의 초강력 컴퓨터를 빌리는 것이라는 인식이며, 실제로는 수천 대의 독립 컴퓨터에 작업을 **분산 제출**하는 구조
- 분산 컴퓨팅에서 GPU가 데이터 전송 대기로 유휴 상태가 되는 문제를 방지하기 위해, MareNostrum V는 **InfiniBand NDR200** 패브릭을 **팻트리(fat-tree) 토폴로지**로 구성
  - 일반 네트워크에서는 여러 컴퓨터가 같은 스위치를 공유할 때 대역폭 병목 발생
  - 팻트리 토폴로지는 네트워크 계층 상위로 갈수록 링크 대역폭을 증가시켜 **비차단(non-blocking) 대역폭** 보장
  - 8,000개 노드 중 어떤 노드든 동일한 최소 지연 시간으로 통신 가능

## 컴퓨팅 파티션 구성

- **범용 파티션(GPP)**: 고도 병렬 CPU 작업용으로 설계, 6,408개 노드에 각 112개 Intel Sapphire Rapids 코어 탑재, 합산 피크 성능 **45.9 PFlops**
- **가속 파티션(ACC)**: AI 훈련, 분자 동역학 등 특수 용도로 설계, 1,120개 노드에 각 4개 **NVIDIA H100 SXM GPU** 탑재, 피크 성능 **260 PFlops**
  - 단일 H100 소매가 약 25,000달러 기준, GPU 비용만 1억 1,000만 달러 초과
- **로그인 노드(Login Nodes)**: SSH 접속 시 최초 진입 지점으로, 파일 이동·코드 컴파일·작업 스크립트 제출 등 경량 작업 전용이며 컴퓨팅용이 아님

## 양자 인프라

- MareNostrum 5에는 스페인 최초의 **양자 컴퓨터**가 물리적·논리적으로 통합
  - 디지털 게이트 기반 양자 시스템과 초전도 큐비트 기반 양자 어닐러 **MareNostrum-Ona** 포함
- 양자 처리 장치(QPU)는 클래식 슈퍼컴퓨터를 대체하는 것이 아니라 **특화된 가속기** 역할
- H100 GPU로도 처리하기 어려운 최적화 문제나 양자 화학 시뮬레이션을 양자 하드웨어에 오프로드하여, **대규모 하이브리드 클래식-양자 컴퓨팅** 파워하우스 구현

## 에어갭, 쿼터, HPC 운영 현실

- **에어갭(Airgap)**: 외부에서 SSH로 접속 가능하지만, 컴퓨트 노드는 외부 인터넷 접속 불가
  - `pip install`, `wget`, 외부 HuggingFace 리포지토리 연결 등 불가능
  - 스크립트에 필요한 모든 것을 사전에 다운로드·컴파일하여 스토리지 디렉터리에 준비 필수
  - 관리자가 `module` 시스템을 통해 대부분의 라이브러리와 소프트웨어 제공
- **데이터 이동**: 로그인 노드를 통해 `scp` 또는 `rsync`로 데이터 입출력 수행
  - 실제 계산이 매우 빠르기 때문에, 완료된 결과를 로컬 머신으로 추출하는 과정이 **병목**이 되기도 함
- **제한 및 쿼터**: 프로젝트별로 특정 **CPU 시간 예산** 할당, 단일 사용자의 동시 실행·대기 작업 수에 하드 리밋 존재
  - 모든 작업에 엄격한 **wall-time 제한** 지정 필수
  - 요청 시간을 1초라도 초과하면 스케줄러가 프로세스를 즉시 종료
- **로깅**: 작업 제출 후 라이브 터미널 출력 없이, 모든 `stdout`과 `stderr`가 로그 파일(예: `sim_12345.out`, `sim_12345.err`)로 자동 리디렉션
  - 작업 완료 또는 크래시 후 텍스트 파일을 검토하여 결과 확인·디버깅 수행
  - `squeue` 또는 `tail -f`로 제출된 작업 상태 모니터링 가능

## SLURM 워크로드 매니저

- 연구 할당 승인 후 SSH 로그인하면 완전히 평범한 **Linux 터미널 프롬프트**가 나타남
- 수천 명의 연구자가 동시에 사용하므로, 터미널에서 직접 무거운 스크립트를 실행하면 로그인 노드가 다운되고 시스템 관리자로부터 경고 메일 수신
- **SLURM(Simple Linux Utility for Resource Management)**: 오픈소스 작업 스케줄링 소프트웨어로, 배시 스크립트에 필요한 하드웨어·소프트웨어 환경·실행 코드를 명시하면 큐에 넣고, 하드웨어 확보 시 실행 후 노드 해제
- 주요 `#SBATCH` 디렉티브:
  - `--nodes`: 필요한 물리 머신 수
  - `--ntasks`: 생성할 **MPI 프로세스**(태스크) 총 수, SLURM이 노드 간 분배 처리
  - `--time`: 엄격한 wall-clock 시간 제한, 초과 시 즉시 종료
  - `--account`: CPU 시간이 차감될 프로젝트 ID
  - `--qos`: Quality of Service 또는 특정 큐 지정(예: debug 큐는 빠른 접근 제공하되 짧은 런타임 제한)

## 실전 예시: OpenFOAM 스위프 오케스트레이션

- ML 서로게이트 모델로 공기역학적 다운포스를 예측하기 위해, 50개의 서로 다른 3D 메시에 대해 50건의 고정밀 **CFD(전산유체역학) 시뮬레이션** 수행 필요
- 범용 파티션에서 단일 OpenFOAM CFD 케이스에 대한 SLURM 작업 스크립트 예시:
  - `--nodes=1`, `--ntasks=6`, `--time=00:30:00` 등으로 리소스 지정
  - `module load OpenFOAM/11-foss-2023a`로 환경 로드
  - `srun --mpi=pmix`로 surfaceFeatureExtract, blockMesh, decomposePar, snappyHexMesh, potentialFoam, simpleFoam, reconstructPar 순차 실행
- 50건을 수동 제출하는 대신 **SLURM 의존성(dependency)** 을 사용해 각 작업을 이전 작업 뒤에 체이닝
  - `sbatch --dependency=afterany:$PREV_JOB_ID`로 50개 작업을 수초 내 큐에 등록
  - 다음 날 아침까지 50건의 공기역학 평가가 처리·로깅 완료, ML 훈련용 텐서 변환 준비 완료

## 병렬화 한계: Amdahl의 법칙

- 노드당 112코어가 있는데 CFD 시뮬레이션에 6태스크만 요청한 이유는 **Amdahl의 법칙** 때문
- 모든 프로그램에는 병렬화 불가능한 **직렬 부분(serial fraction)** 이 존재하며, 이론적 속도 향상은 이 직렬 비율에 의해 엄격히 제한
  - 수식: S = 1 / ((1−p) + p/N), S는 전체 속도 향상, p는 병렬화 가능 비율, N은 프로세서 코어 수
  - 코드의 5%만 직렬이라도 MareNostrum V의 모든 코어를 사용해도 최대 이론 속도 향상은 **20배**
- 너무 많은 코어에 태스크를 분할하면 InfiniBand 네트워크를 통한 **통신 오버헤드** 증가
  - 코어 간 경계 조건 전달에 실제 계산보다 많은 시간을 소비하면, 하드웨어 추가가 오히려 속도 저하 유발
- 소규모 시스템(N=100) 시뮬레이션 시 16스레드 이후 런타임 증가, 대규모(N=10k+)에서만 하드웨어가 완전히 생산적
- 슈퍼컴퓨터용 코드 작성은 **컴퓨트 대 통신 비율** 관리의 연습

## 접근 방법

- 하드웨어 비용에도 불구하고 MareNostrum V 접근은 연구자에게 **무료**이며, 컴퓨트 시간은 공공 자금 지원 과학 자원으로 취급
- 스페인 기관 소속 연구자는 **스페인 슈퍼컴퓨팅 네트워크(RES)** 를 통해 신청 가능
- 유럽 전역 연구자는 **EuroHPC 공동사업**의 정기 접근 공모를 통해 신청 가능
  - "Development Access" 트랙은 코드 포팅이나 ML 모델 벤치마킹 프로젝트를 위해 설계되어 데이터 사이언티스트에게 접근성 높음

## Related Links Visible on GeekNews
- [GPU를 이해하는 방법](https://news.hada.io/topic?id=22628)
- [SpaceX, Cursor와 600억 달러 규모 계약 체결](https://news.hada.io/topic?id=28766)
- [오늘날의 GPU 연산 API](https://news.hada.io/topic?id=3500)
- [Ask HN: ChatGPT가 7억 명을 서비스할 수 있는데, 나는 왜 GPT-4 하나도 로컬에서 못 돌릴까?](https://news.hada.io/topic?id=22424)
- [나는 클라우드를 만들고 있어요](https://news.hada.io/topic?id=28835)

## Comments
### Comment 1
- Metadata: byun1114 3일전 [-]
무료라니.. 개부럽...

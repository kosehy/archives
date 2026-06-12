# LLM API 호출에서 응답이 오기까지

- 원문: https://www.linkedin.com/posts/brijpandeyji_you-hit-send-on-an-llm-api-call-400-share-7443133741075521536-cdjK
- 저장일: 2026-03-29
- 번역 메모: LinkedIn 포스트를 읽기 좋은 한국어 문장으로 정리한 번역본.

당신이 LLM API 호출에서 “Send”를 누른 뒤 약 400밀리초 후 응답을 받았다고 하자. 그 사이에는 무엇이 일어날까?

이 포스트는 대형 AI API 제공자(OpenAI, Anthropic, Google 등)에서 공통적으로 거치는 인프라 흐름을 개략적으로 설명한다.

## 1단계: API Gateway (~5ms)

요청은 곧바로 모델로 가지 않는다.

- TLS 종료
- API 키 검증
- 분당 토큰 수 / 요청 수 기준의 rate limit 확인
- 요청 스키마 검증
- 과금 계측 시작

가끔 보는 429 에러는 이 지점에서 걸러진다는 설명이다.

## 2단계: Load Balancer (~2ms)

요청은 여러 GPU 클러스터 중 하나로 라우팅된다.

- 가장 가까운 데이터센터로의 지리적 라우팅
- least-connections 같은 방식으로 클러스터 선택
- 지속적인 health check 수행

같은 요청인데도 지연 시간이 조금씩 달라지는 이유 중 하나다.

## 3단계: Tokenization (~3ms)

텍스트는 숫자 토큰으로 바뀐다.

- 제공자에 따라 BPE, SentencePiece, WordPiece 같은 방식 사용
- 토큰은 대략 4글자 정도로 볼 수 있음
- 이 단계에서 컨텍스트 윈도우 한계도 확인

토큰 수는 비용과 직결되므로 과금 관점에서도 중요한 단계다.

## 4단계: Model Router (~1ms)

잘 드러나지 않지만 중요한 계층이다.

- 큰 모델 요청은 다중 GPU 클러스터로
- 작은 모델 요청은 최적화된 단일 GPU 클러스터로
- 임베딩 요청은 전용 클러스터로
- 피크 시간대 큐 관리 수행

여러 모델을 운영하는 제공자라면 이런 계층이 있다는 설명이다.

## 5단계: Inference (~300-800ms)

전체 대기 시간의 대부분이 여기서 발생한다. 포스트는 이를 두 단계로 나눈다.

### Prefill
- 입력 토큰을 병렬 처리
- Query와 Key 행렬을 바탕으로 attention score 계산
- KV Cache를 만들어 GPU HBM 메모리에 저장
- 긴 프롬프트일수록 첫 토큰이 늦어지는 이유가 됨

### Decode
- 한 번의 forward pass마다 한 토큰씩 생성
- KV Cache를 재사용해 이전 토큰을 다시 계산하지 않음
- temperature, top_p 같은 샘플링이 이 단계에서 적용됨
- 스트리밍이 켜져 있으면 생성되는 즉시 전송됨

즉, 스트리밍이 존재하는 근본 이유는 토큰이 한 번에 다 생성되는 게 아니라 순차적으로 생성되기 때문이라는 설명이다.

이 단계에서 동원되는 하드웨어 예시는 다음과 같다.
- A100 / H100 / H200 GPU
- tensor parallelism을 통한 다중 GPU 분산
- 다수 사용자 요청의 배치 처리
- Flash Attention, GQA 같은 메모리 효율 기법

## 6단계: Post-Processing (~5ms)

- 토큰 ID를 사람이 읽을 수 있는 텍스트로 변환
- 출력에 대한 safety classifier 실행
- stop sequence 확인
- JSON 형태로 응답 패키징

## 7단계: Billing & Response

- 입력 토큰 수 × 단가
- 출력 토큰 수 × 단가(보통 더 비쌈)
- 많은 제공자에서 prompt caching으로 비용 감소 가능

포스트의 결론은 이것이 특정 한 회사만의 구조가 아니라, 대형 LLM 추론 서비스를 운영할 때 대체로 공통적으로 나타나는 흐름이라는 점이다.

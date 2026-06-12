# Figure Notes - Token-Superposition Training 기사

## Recovered figures
- `figure-01`: `figures/figure-01.png`
  - Status: recovered
  - Source URL: https://cdn.aitimes.com/news/photo/202605/210584_213282_5016.png
  - Source alt/caption: 토큰 중첩(Token Superposition)과 유사 기법과의 비교 (사진=arXiv)
  - Evidence note: arXiv 논문에서 인용된 도표/결과 이미지로 보존했다. 논문 저자 보고값을 시각화한 자료이며, 독립 재현 증거는 아니다.
- `figure-02`: `figures/figure-02.png`
  - Status: recovered
  - Source URL: https://cdn.aitimes.com/news/photo/202605/210584_213283_5121.png
  - Source alt/caption: 동일한 연산량(FLOPs) 조건에서 진행된 두 개의 큐원3 기반 10B-A1B MoE 모델의 사전학습 손실(loss) 곡선 (사진=arXiv)
  - Evidence note: arXiv 논문에서 인용된 도표/결과 이미지로 보존했다. 논문 저자 보고값을 시각화한 자료이며, 독립 재현 증거는 아니다.
- `figure-03`: `figures/figure-03.png`
  - Status: recovered
  - Source URL: https://cdn.aitimes.com/news/photo/202605/210584_213284_5144.png
  - Source alt/caption: 표준 학습 방식(베이스라인)과 비교했을 때, 다양한 설정 환경에서 나타난 TST의 성능 및 효율 개선 효과 (사진=arXiv)
  - Evidence note: arXiv 논문에서 인용된 도표/결과 이미지로 보존했다. 논문 저자 보고값을 시각화한 자료이며, 독립 재현 증거는 아니다.

## Vision notes
- `figure-01`: Next-token prediction, multi-token prediction, SuperBPE, Token Superposition을 같은 흐름도 형식으로 비교한다. TST가 여러 토큰 embedding을 평균/중첩해 짧아진 processed length로 LLM에 넣고, 출력에서 bag-of-tokens를 multi-hot CE loss로 예측한다는 구조적 차이를 보여주는 개념 도표다. 수치 결과 자체가 아니라 방법 비교 도식이다.
- `figure-02`: Training steps 대비 training loss 그래프다. baseline은 빨간색, TST는 파란색으로 표시되며, TST가 초기 superposition phase 후 baseline regime으로 돌아오면서 약 50만 step 부근에서 baseline의 약 120만 step 수준 loss에 도달한다는 `2.5x speedup` 주장을 시각화한다. 논문 저자 보고 실험 그래프이며 독립 재현 증거는 아니다.
- `figure-03`: Dense 270M/600M/3B와 10B-A1B MoE 설정에서 baseline과 TST를 비교한 표다. TST steps, total steps/tokens, B200-hours, final loss, HellaSwag, ARC-E/ARC-C, MMLU가 정리되어 있고, 기사에 나온 12,311 vs 4,768 B200-hours 및 2.252 vs 2.236 loss 수치의 근거 표다. 논문 표이므로 실험 조건과 저자 보고값이라는 caveat를 함께 보존한다.

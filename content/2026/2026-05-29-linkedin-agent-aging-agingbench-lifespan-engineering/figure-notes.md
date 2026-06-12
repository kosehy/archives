# Figure Notes - LinkedIn / AgingBench 이미지

## figure-01
- Status: recovered
- File: `figures/figure-01.jpg`
- Source URL: https://media.licdn.com/dms/image/v2/D5622AQH72Tqdka8SCA/feedshare-shrink_800/B56Z5wmZvPKMAg-/0/1780005575991?e=2147483647&v=beta&t=CWUgYkAfrwAD2KQYMicTnfJKvxpR-iNDzO9Tj68lhSw
- SHA-256: `fe65bed8ff2b1b2e3defe9bcd7e5cd557177852c5965c412c98b1bd1dd6dc34b`
- Shows: 논문 Figure 8로 보이는 흑백 개념도. Fresh Deployment에서 Aged Agent로 갈수록 frozen model은 유지되지만 memory가 쌓이고 faded signals, repeated loops, duplicate thoughts, 출력 오류가 늘어나는 모습을 그린다.
- Why it matters: 작성자가 말한 "모델 가중치는 고정돼도 에이전트 상태와 메모리 파이프라인은 노화한다"는 핵심 비유를 시각적으로 압축한다.

## figure-02
- Status: recovered
- File: `figures/figure-02.jpg`
- Source URL: https://media.licdn.com/dms/image/v2/D5622AQG8UqwJgduMDw/feedshare-shrink_1280/B56Z5wmZvjKcAQ-/0/1780005576129?e=2147483647&v=beta&t=ahDvCe5UUsstwYJ81VMHJQZFrVGs6GcJNd6Qt6M98-M
- SHA-256: `ac23f94c3c5eea6ef274279158f751ce79ff86d200125aec538ba492dd69e19c`
- Shows: 논문 Figure 1. compression, interference, revision, maintenance 네 가지 aging mechanism을 Day 1 메모리 쓰기 사례, 중앙 aging curve, Day N 실패 예시 omission/confusion/staleness/collapse로 연결한다.
- Why it matters: AgingBench가 단일 메모리 점수가 아니라 네 실패 메커니즘을 분리해 진단한다는 프레임을 제공한다.

## figure-03
- Status: recovered
- File: `figures/figure-03.jpg`
- Source URL: https://media.licdn.com/dms/image/v2/D5622AQEkQxTiBYzHgQ/feedshare-image-high-res/B56Z5wmZvuGoAc-/0/1780005576130?e=2147483647&v=beta&t=x4XxILEp01aDvLbKjfbZ8y8ETVihK6ARl1PqCIRI4ks
- SHA-256: `ac6f34d551b835bb5bf95f8b471efeffe2f4d93702d5553dfa5049b3395b72c1`
- Shows: 논문 Figure 7. 메커니즘별 발견: S1 half-life heatmap, S2 silent precision loss, revision failure 산점도, S6 maintenance shock 전후 recall 막대그래프.
- Why it matters: LinkedIn 본문의 반감기, 조용한 정밀도 붕괴, revision/maintenance failure 수치 주장을 뒷받침하는 핵심 실험 요약 그림이다.

## figure-04
- Status: recovered
- File: `figures/figure-04.jpg`
- Source URL: https://media.licdn.com/dms/image/v2/D5622AQFi-Enowv_yiA/feedshare-image-high-res/B56Z5wmZvrHAAc-/0/1780005576230?e=2147483647&v=beta&t=T6E5WVYw1Hs1LaP-g_fKLbsOpTMN2zm7vTjOUnWBook
- SHA-256: `73fac3df0e3bf21bc8e247d0b06546cd7df7167e37ab398f42c98d7105c09c99`
- Shows: 논문 Table 3. Tier 1 runner-controlled ReAct agents와 Tier 2 autonomous agents의 compression, interference, revision, maintenance 진단 행렬을 모델별로 정리한다.
- Why it matters: 본문의 GPT-5-mini, Haiku-4.5, Opus-4.7, Qwen3-8B 등 모델별 비교 주장이 어느 열과 지표에서 나온 것인지 확인하게 해준다.

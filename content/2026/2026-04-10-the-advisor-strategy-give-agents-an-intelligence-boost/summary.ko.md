# advisor strategy: 에이전트의 지능을 끌어올리는 방법 — 요약

원문: https://claude.com/blog/the-advisor-strategy
기준 파일: `archive/2026/2026-04-10-the-advisor-strategy-give-agents-an-intelligence-boost/translation.ko.md`
저장일: 2026-04-10

## 한 문단 요약

Anthropic은 advisor strategy를 에이전트 시스템의 비용 대비 성능을 끌어올리는 구조로 제시한다. 즉, Sonnet이나 Haiku가 executor로서 작업 루프 전체를 담당하고, 정말 어려운 판단 지점에서만 Opus에게 조언을 구하는 방식이다. 이렇게 하면 실행 대부분은 저비용 모델 위에서 돌리면서도, 중요한 순간에는 상위 모델의 추론력을 빌릴 수 있다. Anthropic은 이를 advisor tool이라는 서버사이드 기능으로 API에 넣었고, 코딩과 브라우징 계열 벤치마크에서 품질 개선과 비용 절감을 동시에 얻었다고 설명한다.

## 핵심 포인트

- executor 모델이 전체 작업 루프를 수행하고, 어려운 판단 지점에서만 Opus로 escalation한다.
- 이는 큰 오케스트레이터가 작은 워커에게 위임하는 일반 패턴을 뒤집는 구조다.
- Anthropic은 일부 평가에서 Sonnet 단독보다 더 높은 점수와 더 낮은 task당 비용을 함께 제시한다.
- advisor tool은 단일 Messages API 요청 안에서 동작하며, usage 분리 보고와 호출 횟수 제한도 가능하다.

## 한 줄 정리

정말 중요한 순간에만 비싼 지능을 호출해 전체 비용은 낮추고 판단력은 끌어올리는 전략이다.

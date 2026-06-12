# Summary (ko)

## 한 줄 요약

SkillOpt는 에이전트의 `skill` 문서를 모델 가중치처럼 훈련 가능한 외부 상태로 보고, 실행 궤적의 성공/실패 피드백을 바탕으로 별도 optimizer model이 제한된 텍스트 패치를 제안한 뒤 검증 세트에서 점수가 오른 경우에만 수용하는 skill 최적화 방법이다.

## 핵심 내용

- 문제의식: 현재 agent skill은 사람이 직접 쓰거나 LLM이 한 번 생성하거나 느슨하게 self-revision하는 수준이라, 피드백을 받아도 안정적으로 개선된다는 보장이 약하다.
- 방법: target model은 고정하고, 별도 optimizer model이 rollout 결과를 분석해 `add/delete/replace` 형태의 bounded edit을 만든다. 후보 skill은 held-out selection split에서 기존 skill보다 좋아질 때만 채택된다.
- 안정화 장치: textual learning-rate budget, rejected-edit buffer, epoch-wise slow/meta update를 둬서 skill 문서가 과도하게 흔들리거나 같은 실패를 반복하지 않게 한다.
- 배포 형태: 학습이 끝나면 `best_skill.md` 같은 자연어 skill artifact만 남는다. 추론 시에는 추가 optimizer 호출이 필요 없고, target model과 harness도 그대로 둔다.
- 실험 범위: 논문은 6개 benchmark, 7개 target model, 3개 execution harness(direct chat, Codex, Claude Code)에서 SkillOpt를 human/LLM/Trace2Skill/TextGrad/GEPA/EvoSkill 계열 skill과 비교했다고 보고한다.
- 핵심 결과: 저자 보고 기준 SkillOpt는 52개 `(model, benchmark, harness)` cell 전체에서 최고 또는 공동 최고였고, GPT-5.5에서는 no-skill 대비 direct chat +23.5점, Codex loop +24.8점, Claude Code +19.1점 평균 개선을 보였다.
- transfer: 최적화된 skill은 모델 크기, Codex와 Claude Code harness, 인접 수학 benchmark 사이에서도 일정한 이식 가치를 보였다고 보고된다.

## 왜 중요하나

Hermes의 skill 생태계 관점에서 이 논문은 “좋은 skill을 사람이 계속 고치는 것”을 넘어, skill을 평가 데이터와 검증 gate를 갖춘 훈련 대상으로 다루자는 방향을 제안한다. 특히 skill 변경을 작은 patch로 제한하고, 실패한 patch를 negative feedback으로 남기며, 검증 점수 없이는 수용하지 않는 구조는 실제 운영형 Hermes skill 관리에도 바로 연결된다.

## 재사용 시 주의

- 모든 성능 수치는 preprint 저자 보고값이며 독립 재현이 아니다.
- benchmark, harness, scoring rule, selection split 설계에 민감할 수 있다.
- stronger optimizer model은 배포 비용은 늘리지 않지만, offline skill training 비용과 데이터 설계 비용은 분명히 존재한다.
- skill artifact가 특정 harness의 tool semantics에 과적합될 가능성은 별도 검증이 필요하다.

# SWE-bench Verified가 더 이상 프런티어 코딩 역량을 측정하지 못하는 이유

Source: https://openai.com/index/why-we-no-longer-evaluate-swe-bench-verified/
Shared URL: https://news.hada.io/topic?id=28949
Original shared redirect: https://share.google/7O4UOD9hwNKtrK32I
Saved: 2026-04-29
Language: Korean
Type: Source-limited preservation of an OpenAI article via GeekNews
Quality status: partial_missing

## Preservation note

The original OpenAI source URL is recorded as the main source, but it was not directly recoverable in this session (OpenAI returned an access-protection page / HTTP 403 through the available fetch paths). This file therefore preserves the accessible GeekNews Korean write-up of the OpenAI article and discloses that limitation.

## Recoverable article body from GeekNews

- 자율 소프트웨어 엔지니어링 작업의 대표 지표였던 **SWE-bench Verified**는 **프런티어 모델 역량**을 재기에는 적합성이 크게 떨어짐
- 최근 최고 성능 향상폭이 **74.9%에서 80.9%** 로 제한된 가운데, 남은 실패가 모델 한계인지 데이터세트 결함인지 구분하기 어려워짐
- 감사 대상 138개 문제 중 **59.4%** 에서 테스트 설계나 문제 설명의 중대한 결함이 확인됐고, 제한적인 테스트와 과도하게 넓은 테스트가 기능적으로 올바른 해법도 탈락시킴
- 공개 데이터와 코드베이스를 바탕으로 한 평가라 **학습 데이터 오염**을 피하기 어려웠고, 일부 모델은 작업 설명이나 ID만으로 **골드 패치**를 거의 그대로 재현함
- 그래서 **SWE-bench Verified 점수 보고**를 중단했고, 오염 영향이 덜한 **SWE-bench Pro**와 비공개 벤치마크 쪽으로 평가 축이 옮겨감

## 벤치마크가 더 이상 측정하지 못하는 이유

- **SWE-bench Verified**는 자율 소프트웨어 엔지니어링 작업에서 모델 성능을 재는 표준 지표로 널리 쓰였지만, 현재 수준의 프런티어 모델 역량을 측정하기에는 적합성이 크게 떨어짐
- 최고 성능 향상폭이 최근 6개월간 [74.9%에서 80.9%](https://llm-stats.com/benchmarks/swe-bench-verified)로 제한되면서, 남은 실패가 모델 한계인지 데이터세트 결함인지 구분하기 어려워짐
- 새 분석에서는 **결함 있는 테스트**와 **학습 데이터 오염**이 핵심 문제로 드러났고, 점수가 실제 코딩 능력보다 벤치마크 노출 정도를 더 크게 반영하게 됨
- 그래서 OpenAI는 **SWE-bench Verified 점수 보고를 중단**했고, 다른 모델 개발사에도 같은 조치를 권장함
- 대안으로는 오염이 덜한 **SWE-bench Pro** 사용을 권장하며, 새로운 비오염 평가 지표도 구축 중임

## 배경

- 원본 [SWE-bench](https://arxiv.org/abs/2310.06770)는 2023년에 공개됐고, 12개 오픈소스 Python 리포지터리에서 해결된 GitHub 이슈와 해당 PR을 짝지어 구성됨
- 각 문제는 수정 전 코드베이스와 이슈 텍스트만 주어진 상태에서 코드 변경을 생성해야 하며, 적용 후 **모든 테스트 통과**가 합격 기준이 됨
  수정 전에는 실패하고 올바른 수정 후에는 통과해야 하는 테스트가 포함됨
  기존 기능이 깨지지 않았는지 확인하는 **회귀 테스트**도 함께 포함됨
- 원본 평가에는 올바른 수정도 거부하는 과도하게 구체적인 테스트, 여러 해석이 가능한 불충분한 명세, 환경 차이에 따라 실패하는 테스트 같은 문제가 있었음
- 이를 줄이기 위해 2024년에 [SWE-bench Verified](https://news.hada.io/index/introducing-swe-bench-verified/)를 만들었고, 1,699개 문제를 전문가 검토로 걸러 **500개 문제 세트**를 구성함
  각 문제는 3명의 전문가가 독립적으로 검토함

## 테스트 설계 결함

- OpenAI o3가 64회의 독립 실행에서도 일관되게 해결하지 못한 **138개 문제**를 감사 대상으로 삼았고, 각 사례는 최소 6명의 숙련된 소프트웨어 엔지니어가 독립적으로 검토함
- 그 결과 138개 중 **59.4%** 는 테스트 설계나 문제 설명에 중대한 결함이 있어, 뛰어난 모델이나 사람도 해결이 매우 어렵거나 불가능한 상태였음
- 감사 대상 작업의 **35.5%** 는 특정 구현 세부 사항을 강제하는 제한적인 테스트를 포함함
  기능적으로 올바른 여러 해법도 무효 처리될 수 있음
- 감사 대상 작업의 **18.8%** 는 문제 설명에 없는 추가 기능까지 요구하는 광범위한 테스트를 포함함
- 나머지 **5.1%** 는 위 두 범주에 뚜렷하게 들어가지 않는 다른 문제가 있었음
- 제한적인 테스트 케이스
  [pylint-dev\_\_pylint-4551](https://github.com/pylint-dev/pylint/pull/4551)에서는 PR 테스트가 `get_annotation` 함수를 직접 임포트하지만, 이 함수 이름은 문제 명세에 나오지 않음
  그래서 문제를 기능적으로 올바르게 해결해도, 그 **특정 함수명**을 구현하지 않으면 임포트 오류로 테스트에 실패할 수 있음
- 광범위한 테스트 케이스
  [sympy\_\_sympy-18199](https://github.com/sympy/sympy/pull/18199)는 실제로 [#17373](https://github.com/sympy/sympy/issues/17373), [#17377](https://github.com/sympy/sympy/issues/17377), [#18212](https://github.com/sympy/sympy/issues/18212) 세 이슈를 함께 고친 PR에서 가져옴
  하지만 SWE-bench Verified 작업 설명은 [#18212](https://github.com/sympy/sympy/issues/18212)만 다루기 때문에, 설명대로 구현해도 나머지 두 이슈를 검사하는 테스트에서 실패할 수 있음

## 오염 문제

- SWE-bench Verified와 해당 리포지터리의 코드베이스, 릴리스 노트는 모두 공개되어 널리 사용되고 논의되므로 **데이터 오염 회피가 어려움**
- OpenAI는 자체 모델에서도 오염 징후를 확인했고, 거의 해결 불가능하다고 본 31개 작업을 GPT‑5.2가 해결한 사례도 포함됨
- [django\_\_django-14725](https://github.com/django/django/pull/14725)에서는 테스트가 문제 명세에 없는 `edit_only` 매개변수를 요구하는데, GPT‑5.2는 추론 과정에서 이 매개변수가 **Django 4.1**에 도입됐다는 점까지 정확히 짚음
- OpenAI는 오염 심각도를 평가하기 위해 **자동화된 레드팀 테스트 환경**을 구축함
  각 SWE-bench Verified 문제에 대해 GPT‑5가 GPT‑5.2‑Chat, Claude Opus 4.5, Gemini 3 Flash Preview의 오염 여부를 조사함
  GPT‑5에는 작업 ID, 설명, 골드 패치, PR 테스트가 제공됐고 총 15턴 동안 프롬프트와 유도 전략을 바꿀 수 있게 함
  매 턴 뒤 평가 모델이 새로 드러난 작업 특화 정보의 양을 기준으로 오염 심각도를 **없음~강함**으로 분류함
  강한 오염 사례는 추가 평가 모델로 정보 유출 과다 여부를 검증했고, 최종적으로 직접 검토함

## 모델별 심각한 오염 사례

- GPT‑5.2
  [django\_\_django-11451](https://github.com/django/django/pull/11451)에서 짧은 작업 설명 스니펫만으로도 **정확한 골드 패치**를 출력함
  `ModelBackend.authenticate()`에서 `username is None or password is None`일 때 조기 반환하는 조건, 파일 경로, 메서드 이름까지 재현함
- Claude Opus 4.5
  [astropy\_\_astropy-13236](https://github.com/astropy/astropy/pull/13236)에서 수정 대상 파일 경로 `astropy/table/table.py`, `_convert_data_to_col` 메서드, 그리고 diff 안의 **인라인 주석**까지 글자 그대로 인용함
  구조화된 ndarray를 `NdarrayMixin`으로 자동 변환하던 4줄 코드도 정확히 복원함
- Gemini 3 Flash
  [django\_\_django-11099](https://github.com/django/django/pull/11099)에서 작업 ID 외 추가 정보가 거의 없는 상태에서도 작업 설명과 **골드 패치 전체**를 글자 그대로 출력함
  사용자 이름 검증용 정규식이 `r'^[\w.@+-]+$'`에서 `r'^[\w.@+-]+\Z'`로 바뀌는 내용과 줄 단위 diff까지 재현함

## 핵심 교훈

- 공개적으로 이용 가능한 자료에서 추출한 벤치마크는 **오염 위험**을 안고 있으며, 학습 데이터 노출이 점수를 눈에 띄지 않게 부풀릴 수 있음
- 공개 크롤링 데이터로 벤치마크를 만들 경우, 모델 개발자는 오염 여부를 확인하는 **추가 테스트**를 수행해야 함
- 공개된 벤치마크와 해답도 결국 학습 데이터에 포함될 수 있으므로, 데이터세트 배포 방식과 학습 데이터 필터링 모두에 각별한 주의가 필요함
  비밀번호 보호 같은 배포 통제 방식이 언급됨
  카나리아 문자열 엄수 같은 **필터링 방법**도 함께 언급됨
- 자동 채점은 중요하지 않은 구현 차이에 흔들리지 않으면서도 편법을 막을 만큼 견고해야 하는데, 이를 동시에 만족시키기 매우 어려움
- 이런 결함을 찾아내는 데는 여러 차례의 **대규모 수동 레이블링**이 필요했음

## 앞으로의 평가 방향

- 최근 몇 달간 OpenAI는 **SWE-bench Pro 공개 평가 데이터** 결과를 보고하기로 했고, 다른 모델 개발자도 같은 조치를 취하길 권장함
- SWE-bench Pro도 완벽하지는 않지만, 경험적으로는 SWE-bench Verified보다 **오염 영향이 덜함**
  내부 오염 검증 파이프라인에서 일부 오염 사례는 발견됐음
  다만 SWE-bench Verified보다 훨씬 드물고 덜 심각했음
  어떤 모델도 글자 그대로 완전히 일치하는 골드 패치를 생성하지는 못했음
- 앞으로는 독창적이고 **비공개로 작성된 벤치마크**에 계속 투자할 계획임
- [GDPVal](https://openai.com/index/gdpval/)에서는 도메인 전문가가 비공개로 작업을 작성하고, 훈련된 평가자가 솔루션을 종합적으로 채점함
- 이런 방식은 리소스를 많이 쓰지만, 실질적인 역량 향상을 측정하려면 점점 더 필수적인 요소가 됨

# 요약 — Cloudflare를 버리고 bunny.net으로 옮기기

## 핵심 아이디어

이 글은 개인 사이트 인프라를 Cloudflare에서 bunny.net으로 옮긴 이유를 설명하면서, 성능이나 가격만이 아니라 특정 인프라 사업자 의존도를 줄이는 문제를 함께 다룬다.

## 핵심 포인트

- 작성자는 하나의 거대 인프라 사업자에 과도하게 의존하는 구조를 불편하게 느낀다.
- bunny.net은 경쟁력 있는 유럽 기반 CDN 대안으로 제시된다.
- 도메인 등록은 Porkbun으로, CDN/프록시 계층은 bunny.net으로 분리했다.
- 글은 pull zone 생성, custom hostname 연결, SSL 활성화, 캐싱 설정을 단계별로 설명한다.
- 작성자는 Phoenix에서 cache-control 헤더를 명시해 HTML까지 CDN 캐싱하도록 구성했다.
- 추가로 Force SSL, Origin Shield, stale cache, 기본 도메인 리디렉션도 추천한다.

## 한 줄 결론

이 글은 Cloudflare 이탈이 단순한 가격 비교가 아니라, 인프라 집중 리스크를 줄이려는 선택일 수 있다고 말한다.

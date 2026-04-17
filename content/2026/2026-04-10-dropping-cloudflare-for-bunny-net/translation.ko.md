# Cloudflare를 버리고 bunny.net으로 옮기기

원문: https://jola.dev/posts/dropping-cloudflare
아카이브: 2026-04-10
언어: Korean
유형: 한국어 번역본

이 글은 작성자가 개인 블로그 인프라를 Cloudflare에서 bunny.net으로 옮긴 이유와 실제 설정 과정을 정리한 글이다. 핵심 동기는 단순한 가격 문제가 아니라, 인터넷 인프라를 하나의 거대 사업자에 과도하게 의존하는 구조에 대한 불안감이다.

작성자는 Cloudflare가 매우 강력하고 관대한 서비스를 제공한다는 점은 인정한다. 하지만 동시에, 너무 많은 웹사이트가 하나의 미국 기업에 의존하게 되면 그 자체가 단일 실패 지점이 될 수 있다고 우려한다. Cloudflare 장애가 뉴스가 될 정도로 영향력이 크고, 특정 사업자가 임의의 판단으로 사이트를 차단할 수 있는 구조도 불편하게 느낀다. 그래서 대안을 찾던 중 bunny.net에 주목하게 되었다.

## bunny.net을 선택한 이유

bunny.net은 슬로베니아에 기반을 둔 유럽 회사로, CDN 관련 기능에서 이미 충분히 경쟁력이 있다고 본다. PoP 네트워크 규모는 Cloudflare보다 작지만, 속도와 성능 면에서 좋은 평가를 받고 있으며, 유럽 기술 생태계를 지지하고 싶다는 개인적 동기도 선택에 작용했다.

## 무엇을 대체하려 했는가

작성자는 도메인 등록까지 모두 bunny.net으로 옮긴 것은 아니다. 도메인 등록은 결국 Porkbun으로 옮겼고, Cloudflare가 맡고 있던 역할 중 핵심은 이른바 "Orange Cloud" 기능, 즉 자동 캐싱, 오리진 숨기기, 선택적 보호 기능이었다. 이번 이전은 바로 그 레이어를 bunny.net으로 대체하는 작업이다.

## 설정 절차 요약

글은 bunny.net CDN 설정을 단계별로 설명한다.

### 1. Pull Zone 생성
- 의미 있는 이름을 정한다.
- Origin type은 `Origin URL`로 둔다.
- 오리진 서버 주소를 입력한다.
- 여러 앱을 같은 서버에서 운영한다면 Host header도 함께 전달한다.
- Tier는 Standard를 선택한다.
- 필요에 따라 가격 구역을 조정한다.

### 2. Pull Zone 연결
- Custom hostname에 실제 사이트 도메인을 넣는다.
- 안내에 따라 DNS에 CNAME을 추가해 `*.b-cdn.net` 쪽으로 연결한다.
- 전파 후 `Verify & Activate SSL`을 눌러 SSL을 활성화한다.

### 3. 캐싱 구성
- 오리진이 적절한 cache-control 헤더를 반환하면 bunny.net이 이를 존중한다.
- 직접 헤더를 제어하지 않으려면 Smart Cache를 켤 수 있다.
- 작성자는 Phoenix 라우터에 `cache-control: public, s-maxage=86400, max-age=0`를 추가해 HTML까지 CDN에 캐싱되도록 구성했다.
- 그 대가로 새 글 발행 시 pull zone purge가 필요하다.

### 4. 기본 옵션
- Force SSL 활성화
- Origin Shield 활성화
- stale cache 옵션 활성화 고려
- 기본 `b-cdn.net` 주소를 실제 도메인으로 리디렉션하는 edge rule 추가

## 핵심 해석

이 글은 bunny.net이 Cloudflare를 무조건 대체한다는 주장보다는, 개인 사이트나 소규모 서비스 운영자 입장에서 더 분산적이고 덜 종속적인 구조를 만들고 싶을 때 고려할 수 있는 현실적인 대안이라는 쪽에 가깝다. 즉, 성능과 비용뿐 아니라 거버넌스와 의존성 구조 자체를 함께 판단 기준에 넣고 있다는 점이 이 글의 핵심이다.

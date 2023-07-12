# elk_kibana_log
42gg에 연동하지 못한 비운의 키바나 관련자료, 처음하는 ELK 5일간 여정의 끝


## ELK 연동시의 KIBANA 로그 모니터링 화면
![image1](https://github.com/FeFe2200/elk_kibana_log/assets/67796301/a45d0a4a-2ba5-491d-bce0-f2dfc48450b8)


## 배포에 포함되지 못한 이유
1. 테스트서버에서 컨테이너를 실행했을 때, KIBANA화면 접속 확인 가능.
하지만 컨테이너 실행 후 2분 후 서버가 다운되는 상황이 발생.
ELK 컨테이너만 3개이며, 기존에 컨테이너를 수를 합치면 10개의 컨테이너가 실행 중이라 서버가 견디지 못하고 다운 됨.
메인 서버의 경우 테스트서버보다 스펙이 좋지만 일단 보류하기로 함.

2. 로컬에서 테스트를 할 당시, 위의 모니터링 화면이 나왔지만, KIBANA에서의 쿼리 조작 미숙으로 학습이 필요해 배포에서 제외 되는 것으로 합의를 함.
쿼리 조작 학습 시간이 줄어든 이유는 테스트서버 환경에서의 nginx 환경을 로컬에서 새로 세팅하다 소요된 시간으로 많았음.
또한, 기존에서는 도메인 함수가 호출과 반환하는 경우만 로그가 출력되도록 했는데, 사용자 ID도 추가해서 출력되도록 수정해야 통계자료를 만들 수 있을 것으로 보여
기존 로그 출력 AOP를 수정해야 했지만 배포일 기준 전날이라 배포에서 제외하는 것으로 되었다.

## 실행방법
https://github.com/42organization/42gg.server.dev.v2/blob/main/src/main/resources/logback-spring.xml
위의 경로의 파일에서 주석 처리된 부분을 해제하고 도커컴포즈의 logstash ip주소와 동일하게 ip를 넣어 실행파일(.jar)을
./docker/tomcat/ 안에 넣어준 뒤 도커 컴포즈 파일을 실행하면 된다.


## 참고자료
1. https://github.com/deviantony/docker-elk/tree/main
2. https://investment-engineer.tistory.com/5
3. https://cmelcmel.tistory.com/112
4. https://rastalion.me/elastic-search-kibana/


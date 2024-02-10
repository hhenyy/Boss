# 남성 의류 쇼핑몰 (BossMall)

## 소개
쇼핑몰 기본기능(상품관리, 회원관리, 리뷰, 문의, 관리자페이지, 결제)와 더불어 유저들이 더 오래 쇼핑몰에 머물수 있도록 챗봇 기능과 유저 커뮤니티 게시판을 제작.<br/>

### 프로젝트 링크
### [BossMall 방문하기](http://13.125.218.183/)
<br>

## 개발환경 및 활용기술 
  maven, MyBatis, <br/>
 JQuery, Ajax, REST API, OpenAI API, vector DB 
<br/>
 ### 🔨 기술 스택
---
#### 📜 FRONT
<p align="left">
  <img src="https://img.shields.io/badge/HTML5-%23E34F26.svg?style=flat-square&logo=html5&logoColor=white" alt="HTML5" height="25"/>
  <img src="https://img.shields.io/badge/CSS3-%231572B6.svg?style=flat-square&logo=css3&logoColor=white" alt="CSS3" height="25"/>
  <img src="https://img.shields.io/badge/JavaScript-%23323330.svg?style=flat-square&logo=javascript&logoColor=%23F7DF1E" alt="JavaScript" height="25"/>
</p>

#### 🛠️ BACK
<p align="left">
  <img src="https://img.shields.io/badge/Java-%23ED8B00.svg?style=flat-square&logo=openjdk&logoColor=white" alt="Java" height="25"/>
  <img src="https://img.shields.io/badge/Spring-%236DB33F.svg?style=flat-square&logo=spring&logoColor=white" alt="Spring" height="25"/>
  <img src="https://img.shields.io/badge/JSON-000000?style=flat-square&logo=json&logoColor=white" alt="JSON" height="25"/>
</p>

#### 📀 DB

![Oracle](https://img.shields.io/badge/Oracle-F80000.svg?&style=for-the-badge&logo=Oracle&logoColor=white)


#### ✂️ Tool

![Eclipse IDE](https://img.shields.io/badge/Eclipse%20IDE-2C2255.svg?&style=for-the-badge&logo=Eclipse%20IDE&logoColor=white)


#### ⭐️ etc
<p align="left">
  <img src="https://img.shields.io/badge/Git-F05032?style=flat-square&logo=git&logoColor=white" alt="Git" height="25"/>
  <img src="https://img.shields.io/badge/GitHub-181717?style=flat-square&logo=GitHub&logoColor=white" alt="GitHub" height="25"/>
  <img src="https://img.shields.io/badge/Amazon%20AWS-232F3E?style=flat-square&logo=amazonaws&logoColor=white" alt="AWS" height="25"/>
</p>
<br>



<br><br>
## 주요 기능
<br/>
 1. 소셜 로그인 (naver, kakao API 활용) <br/>
 2. spring security를 이용한 password 암호화 <br/>
 3. 상품 결제 API 기능<br/>
 4. 배송 상태 문자전송 기능<br/>
 5. 유투브 data api를 활용한 조회수가 높은 영상 검색 및 시청 기능 구현<br/>
 6. 상품 추천 챗봇 기능 구현<br/>
 7. AWS에 프로젝트 배포 및 DB 구축<br/>

<br/>
## 담당 역할 
  1. UI 설계, 요구사항 분석, 작업 흐름도 작성, ppt자료 제작 <br/>
  2. 메인 페이지 구현 <br/>
  3. 관리자 모드 구현(회원관리)  <br/>
  4. 상품 추천 챗봇 구현 (vector DB/openAI API) <br/>
  5. 유저 커뮤니티 게시판 구현 (검색 기능 / 첨부파일 처리) <br/>
  6. 댓글 기능 : 댓글 목록/수정/삭제 CRUD구현, Ajax이용 비동기 출력 <br/>
  7. 유투브 data API를 활용한 조회수가 높은 영상 검색 및 시청 기능 구현<br/>
  8. 좋아요 기능 <br/>
  9. 프론트엔드
<br/>

## 기능
##  1) 메인 페이지<br/>
<img width="934" alt="스크린샷 2023-12-29 094617" src="https://github.com/hhenyy/BossMall/assets/141230104/4a38e7d9-1cc7-444c-848c-af96e2e19c34">
<img width="942" alt="스크린샷 2023-12-29 094635" src="https://github.com/hhenyy/BossMall/assets/141230104/346a1aac-94d6-4151-b9e1-17bbd25bc085">
<br/>
- 메인 이미지 슬라이드 bootstrap/ 팝업창<br/>
- header/menu/footer 분리 & 회원/비회원/관리자 아이디 별 노출 아이콘 링크 분리<br/>
- 관리자 아이디 로그인 시 상품 변경 버튼 메인 이미지 노출/ 변경 페이지 이동<br/>
- 챗봇(js popup chatbot/vector DB/openAI API) <br/>
- 저장된 상품 정보를 embedding하여 vector DB에 저장해두고 유저가 질문한 내용을 embedding하여 vector DB에 query를 하면 두 개의 embedding으로 유사도를 구하게 되고 이때 코사인유사도 값이 정해 놓은 수치 이상이면 해당 상품추천과 상품 상세 페이지로 링크설정  <br/>
<br/>

##  2) 유저 커뮤니티 게시판<br/>
<img width="947" alt="스크린샷 2023-12-29 094654" src="https://github.com/hhenyy/BossMall/assets/141230104/0488c51d-c146-4d62-9283-9507c3a2cc20">
<img width="936" alt="스크린샷 2023-12-29 094705" src="https://github.com/hhenyy/BossMall/assets/141230104/207b2f75-0af8-4e5d-a04e-cc7c858d09c8">
<br/>
- 제목, 내용 검색기능 / 목록 페이징<br/>
- 댓글 기능 : 댓글 목록/수정/삭제 Ajax이용 비동기 출력<br/>
- 첨부 파일 기능<br/>
- 글 신고 (클릭시 신고 게시판으로 이동) <br/>
- 좋아요 기능 (Ajax, Json) : 클릭시 하트 이미지 변경 & 개수 카운팅 update<br/>
- 유투브 data API ('남성 패션' 검색키워드 조회수 top9 data추출)(REST API) <br/>

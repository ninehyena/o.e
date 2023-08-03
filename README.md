# 01 프로젝트 개요

### o.e (오늘 이런 레슨 어때요?) - 소박이
### 음악 레슨을 하고 싶은 사람과 받고 싶은 사람을 매칭해주는 플랫폼

## 기획 의도
평소 주변에서 음악 관련 입시를 준비하거나, 취미로 음악을 배우고 싶어하는 사람들을 자주 볼 수 있었다.
하지만 기존 시점에서는 대다수가 레슨을 진행하기 위해 여러 학원을 통해 직접 알아보는 수고스러운 과정을 거친다.
이번 프로젝트를 통해 온라인상에서 강사가 레슨을 직접 등록하여 레슨에 대한 정보를 제공하고, 수강생은 원하는 레슨을 신청하여
각자 개인의 환경과 조건에 맞는 레슨을 진행할 수 있도록 기획하였다.

## 주요 기능
인덱스 페이지에는  o.e 사용자 기반의 통계 데이터를 시각화하여 나타내었으며, 프로젝트의 주요 기능은 강사와 수강생에게 구분되어 적용될 수 있도록 개발하였다.

정보 게시판은 파일 첨부 기능을 추가하여 정보에 대한 이미지를 추가할 수 있다.

카카오 로그인을 진행할 경우 API를 통해 받아온 사용자의 이메일을 이용해 회원가입을 진행하여 서비스를 이용할 수 있으며,
아이디/비밀번호 찾기 기능, 회원 정보 수정 및 탈퇴 기능을 구현하였다.

o.e의 기준(누적 수강생 수가 30명이 넘을 때)을 만족하는 강사에게는 인증 뱃지를 부여하였으며,
레슨 페이지에서는 강사가 등록한 레슨의 상세 정보와 강사의 학력/이력, 수강평과 평점 확인이 가능하고 해당 레슨을 등록한 강사와, 레슨을 신청/수강/완료한 수강생에 한해 댓글을 작성할 수 있다.

레슨은 '신청하기' 버튼을 통해 신청할 수 있으며 클릭 시 레슨 신청 상태는 대기가 되며, 강사가 신청을 수락하면 대기에서 진행으로 상태가 전환된다.
레슨이 종료되어 강사가 나의 레슨 페이지에서 레슨 완료 버튼을 누르면 레슨 상태가 진행에서 완료로 전환되며, 수강생은 해당 레슨에 대한 리뷰를 남길 수 있다.

나의 레슨(myLesson) 페이지에서 등록한 레슨 / 신청한 레슨 목록을 관리할 수 있으며, 레슨에 대한 진행 상태를 확인할 수 있다.
강사의 경우 하단의 캘린더를 통해 레슨 일정을 관리할 수 있도록 구현하여, 강사가 레슨 일정을 등록하면 해당 수강생의 캘린더에도 레슨 일정이 표시될 수 있도록 데이터를 연동하였다.

## 주요 화면
<img width="948" alt="스크린샷 2023-08-03 123449" src="https://github.com/ninehyena/o.e/assets/75665063/f2d4e632-2d05-4751-8b04-9f06bf0fd48a">
<img width="1270" alt="스크린샷 2023-08-01 174228" src="https://github.com/ninehyena/o.e/assets/75665063/341caa9c-3081-4e89-8ff6-2e0e77ad1c52">
<img width="1267" alt="스크린샷 2023-08-01 174151" src="https://github.com/ninehyena/o.e/assets/75665063/e125abdd-eafa-47aa-82c1-1e64c0bb4373">
<img width="1268" alt="스크린샷 2023-08-01 174450" src="https://github.com/ninehyena/o.e/assets/75665063/e909a33a-02c8-46ed-a497-d537426f7746">
<img width="1267" alt="스크린샷 2023-08-01 174302" src="https://github.com/ninehyena/o.e/assets/75665063/287678c4-8a6c-495b-9d83-1f253d97baa8">

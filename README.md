# DailyRecord

> 교육생과 강사를 위한 교육 과정 통합 관리 플랫폼
> 
> DailyRecord는 대보정보통신 2기 교육 과정에서 진행한 팀 오순도순의 Final Project입니다.
> 
> 교육 과정 중 분산되어 있던 일일과제 제출, 자료 공유, 일정 관리, 교육생 관리, 실시간 채팅 등의 기능을 하나의 웹 서비스에서 사용할 수 있도록 통합하는 것을 목표로 개발했습니다.

---

## 프로젝트 소개

교육 과정에서는 과제 제출, 공지 및 자료 공유, 일정 확인, 교육생 관리 등 여러 업무가 서로 다른 방식으로 이루어지고 있었습니다.

DailyRecord는 이러한 불편을 개선하기 위해 교육생과 강사가 하나의 시스템에서 교육 과정에 필요한 기능을 사용할 수 있도록 구성했습니다.

## 주요 사용자

* 교육생
    * 일일과제 작성 및 제출
    * 게시판 및 자료 확인
    * 일정 관리
    * Todo 관리
    * 실시간 채팅
    * 개인 정보 및 마이페이지 관리
* 강사 / 관리자
    * 교육생 및 반 관리
    * 교육생 현황 확인
    * 과제 및 일정 관리
    * 게시판 및 자료 관리
    * 교육생 관련 통계 및 관리 기능

---

## 주요 기능

1. 일일과제 관리

    교육생이 교육 과정에서 수행한 일일과제를 작성하고 관리할 수 있습니다.

* 일일과제 작성
* 과제 조회
* 과제 수정 및 삭제
* 교육생별 과제 관리

2. 게시판 및 자료 공유

    교육 과정에 필요한 공지사항과 자료를 공유할 수 있습니다.

* 게시글 작성 / 조회 / 수정 / 삭제
* 댓글 작성 및 관리
* 파일 첨부
* 자료 공유

파일 저장 기능에는 AWS S3를 활용했습니다.

3. 실시간 채팅

    교육생 간 또는 교육 과정 내 커뮤니케이션을 위한 실시간 채팅 기능을 제공합니다.

* WebSocket 기반 실시간 통신
* STOMP 메시징
* 채팅 메시지 송수신

4. 일정 관리

    교육 과정의 주요 일정을 등록하고 확인할 수 있습니다.

* 일정 등록
* 일정 조회
* 일정 수정 및 삭제
* 교육 일정 관리

5. Todo 관리

    개인별 해야 할 업무를 관리할 수 있습니다.

* Todo 등록
* 완료 상태 관리
* Todo 수정 및 삭제

6. 교육생 / 반 관리

    관리자는 교육생과 교육 과정의 반 정보를 관리할 수 있습니다.

* 교육생 정보 관리
* 반(Class) 관리
* 교육생별 소속 관리
* 교육생 현황 및 통계 확인

7. 회원 및 권한 관리

    Spring Security를 이용해 사용자 인증과 권한별 접근을 관리합니다.

* 로그인 / 로그아웃
* 사용자 인증
* 사용자 권한 관리
* 학생 / 강사·관리자 화면 분리

---

### Tech Stack

#### Backend

기술	사용
Java	Java 11
Framework	Spring Framework 5.1.3
Web	Spring MVC
Security	Spring Security
Persistence	MyBatis 3.4.6
Connection Pool	HikariCP
Database	Oracle
Real-time	Spring WebSocket / STOMP
File Storage	AWS S3
Logging	Log4j2
Build	Maven
Packaging	WAR

#### Frontend

기술	사용
View	JSP / JSTL
Style	CSS / SCSS
Script	JavaScript
Server Rendering	Spring MVC + JSP

#### Architecture

프로젝트는 Spring MVC 기반의 계층형 구조로 구성했습니다.

Client
  │
  ▼
Controller
  │
  ▼
Service
  │
  ▼
DAO
  │
  ▼
MyBatis Mapper
  │
  ▼
Oracle Database

파일 업로드는 별도로 AWS S3와 연동되며, 실시간 채팅은 WebSocket/STOMP를 통해 처리합니다.

                      ┌───────────────┐
                      │    Client     │
                      │   JSP / JS    │
                      └───────┬───────┘
                              │
                    HTTP / WebSocket
                              │
               ┌──────────────▼──────────────┐
               │      Spring MVC Layer       │
               │                             │
               │ Controller → Service → DAO │
               └───────┬─────────────┬──────┘
                       │             │
                       │             └──── WebSocket / STOMP
                       │
               ┌───────▼───────┐
               │    MyBatis    │
               └───────┬───────┘
                       │
               ┌───────▼───────┐
               │    Oracle     │
               └───────────────┘
                       │
                       └──────────── AWS S3

#### Project Structure
```
final-pj
├── docs                    
│   ├── Requirements.png
│   ├── idea.png
│   ├── log.png
│   └── setting.png
│
├── src
│   └── main
│       ├── java/com/osoondosson
│       │   ├── controller
│       │   │   ├── admin
│       │   │   ├── chat
│       │   │   └── user
│       │   ├── dao
│       │   ├── security
│       │   ├── service
│       │   ├── utill
│       │   └── vo
│       │
│       ├── resources
│       │   ├── mapper
│       │   ├── mybatis
│       │   ├── log4j2.xml
│       │   └── log4jdbc.log4j2.properties
│       │
│       └── webapp
│           ├── WEB-INF
│           │   ├── spring
│           │   ├── views
│           │   │   ├── auth
│           │   │   ├── common
│           │   │   ├── student
│           │   │   └── teacher
│           │   └── web.xml
│           │
│           └── resources
│               ├── css
│               ├── images
│               ├── js
│               ├── scss
│               └── vendor
│
├── pom.xml
└── README.md
```
---

### 주요 Domain

프로젝트의 주요 기능은 다음 Domain을 중심으로 구성되어 있습니다.
```
User
 ├── MemberInfo
 ├── UserRole
 └── Class
Board
 ├── Reply
 └── File
Task
Schedule
ToDoList
Group
Chat
```
이에 대응하여 Controller / Service / DAO / MyBatis Mapper를 기능별로 분리했습니다.

⸻

화면 구성

프로젝트 화면은 사용자 역할에 따라 분리했습니다.
```
views
├── auth        # 로그인 및 인증
├── common      # 공통 화면
├── student     # 교육생 화면
└── teacher     # 강사 / 관리자 화면
```
---
프로젝트 설계 자료

아이디어

요구사항

개발 환경 설정

Log

---

Build

본 프로젝트는 Maven 기반 WAR 프로젝트입니다.

Requirements

Java 11
Maven
Oracle Database
Servlet Container (Tomcat 등)

Build

mvn clean package

빌드가 완료되면 target 디렉터리에 WAR 파일이 생성됩니다.

target/final-pj-1.0-SNAPSHOT.war

생성된 WAR 파일을 Servlet Container에 배포하여 실행할 수 있습니다.

---

External Configuration

프로젝트 실행을 위해 환경에 따라 다음 설정이 필요합니다.

Oracle Database Connection
AWS S3
SMTP
Spring Security

DB 접속 정보, AWS Credential, SMTP 계정 등의 민감 정보는 Repository에 직접 저장하지 않고 별도의 환경 설정으로 관리하는 것을 권장합니다.

---

Deployment

서비스는 프로젝트 완료 후 실제 서버에 배포하여 운영했습니다.

현재 운영 서버는 종료된 상태입니다.

서비스 운영 종료: 2023-10-30

---

Project Goal

이 프로젝트에서는 단순 기능 구현뿐만 아니라 여러 업무 기능을 하나의 서비스로 통합하면서 다음 내용을 경험하는 것을 목표로 했습니다.

* Spring MVC 기반 웹 애플리케이션 설계
* Controller / Service / DAO 계층 분리
* MyBatis를 이용한 데이터 접근
* Oracle Database 연동
* Spring Security 기반 인증 / 권한 관리
* WebSocket 기반 실시간 통신
* AWS S3 파일 저장
* 게시판 / 과제 / 일정 / 사용자 관리 등 복합 Domain 구현
* Maven 기반 WAR 빌드 및 서버 배포
* Git을 이용한 팀 단위 협업

---

Team

오순도순

대보정보통신 2기 Final Project

---

Repository

GitHub
https://github.com/Daebo2th/final-pj
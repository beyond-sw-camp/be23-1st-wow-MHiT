#  MHiT DB 프로젝트

야구 경기와 셔틀 예약을 한 번에!

&nbsp;

---

## 📌 프로젝트 개요  

- **MHiT** : 사용자가 원하는 야구 경기를 예매할 때 근방에서 해당 경기장까지 운행하는 셔틀 버스까지 예약할 수 있는 DB 중심의 프로젝트입니다.

- 실제 서비스 운영에 적합한 **ERD**를 설계하고, **SQL 쿼리와 프로시저가 요구사항대로 정확하게 실행되는지 테스트**하는 데 중점을 두었습니다.

---

## 스택
<p>
<img src="https://img.shields.io/badge/mariaDB-003545?style=for-the-badge&logo=mariaDB&logoColor=white">
<img src="https://img.shields.io/badge/mysql-4479A1?style=for-the-badge&logo=mysql&logoColor=white">
<img src="https://img.shields.io/badge/visualstudiocode-007ACC?style=for-the-badge&logo=visualstudiocode&logoColor=white">
<img src="https://img.shields.io/badge/git-F05032?style=for-the-badge&logo=git&logoColor=white">
<img src="https://img.shields.io/badge/github-181717?style=for-the-badge&logo=github&logoColor=white">
<img src="https://img.shields.io/badge/notion-000000?style=for-the-badge&logo=notion&logoColor=white">
<img src="https://img.shields.io/badge/discord-5865F2?style=for-the-badge&logo=discord&logoColor=white">
</p>

---

## 📅 프로젝트 기간  

**2025.12.04 ~ 2025.12.05**

---

## 🧭 진행흐름도
<img width="1484" height="425" alt="MHIT 2" src="https://github.com/user-attachments/assets/ff7af975-6909-43aa-96db-d8936c257cb0" />



---

## ✨ 주요 기능

| 기능 구분 | 상세 기능 |
|----------|-----------|
| 🎟 **경기 예매** | - 날짜·구단·구장 기준 경기 검색 <br> - 좌석 기반 예매 기능 <br> - 경기 예매 내역 조회 |
| 🚌 **셔틀버스 예약** | - 경기 일정과 연동된 셔틀버스 노선 조회 <br> - 출발지·도착지 및 시간 확인 <br> - 이용 가능 버스 정보 조회 |
| 🏟 **구단 조회** | - 구단 기본 정보 조회 <br> - 구단 경기 일정 조회 <br> - 구단 승률, 선호 팬 수 조회 |
| ⚾ **경기 조회** | - 전체 경기 일정 조회 <br> - 특정 구단 경기 조회 <br> - 경기 결과(승/패/무), 경기 상태(경기 전/취소) 확인 |
| 🏟 **구장 조회** | - 구장 정보(위치·좌석 수 등) 조회 <br> - 해당 구장의 경기 일정 조회 <br> - 연계 셔틀버스 정보 조회 |



---


## 🎯 서비스 대상

- 야구 경기를 관람하고 싶은 일반 사용자
- 경기 예매와 이동편(셔틀버스)을 한 번에 확인하고 싶어하는 사용자
- 구단 정보, 경기 일정, 구장 정보를 미리 알고 싶어하는 사용자
- 실시간으로 경기 결과·승률·순위 등을 확인하고 싶은 야구 팬
- 여러 앱을 켜지 않고 하나의 플랫폼에서 경기 관람 준비를 하고 싶은 사용자


---


## 🔥 타 서비스와의 차별점

### 🚌 경기 예매와 셔틀버스 정보를 하나의 서비스에서 제공
경기 예매와 동시에 해당 경기장의 셔틀버스 정보를 확인할 수 있는  
통합형 야구 관람 지원 서비스입니다.


---


## 🎯 기대효과

### 1️⃣ 사용자 편의성 향상
- 경기 예매와 셔틀버스 예약을 한 번에 처리할 수 있어 번거로움 최소화
- 경기장까지의 이동 수단을 미리 확보하여 관람 경험이 쾌적해짐

### 2️⃣ 원활한 이동 동선 확보
- 셔틀버스 예약으로 경기장 주변 교통 혼잡 완화
- 불필요한 대기시간 감소


---

## 📎 프로젝트 주요 산출물  

각 항목은 클릭하여 확인하거나 다운로드할 수 있습니다.

- 📘 **[요구사항 정의서](https://docs.google.com/spreadsheets/d/1KQKxB8eO9gHyPbQbWEiC2BqMWqx1NzDDvSr9orACbNc/edit?gid=200263830#gid=200263830)**  
  프로젝트 기능 정의 및 상세 요구사항 정리

- 📙 **[WBS (작업 분류 체계)](https://docs.google.com/spreadsheets/d/1KQKxB8eO9gHyPbQbWEiC2BqMWqx1NzDDvSr9orACbNc/edit?gid=602560201#gid=602560201)**  
  전체 프로젝트 일정과 작업 흐름 구성

- 🗺️ **ERD (Database Schema)**  
<p align="center">
  <img src="./images/MHiT_ERD.png" width="2000" alt="MHiT ERD"/>
</p>



---

### 쿼리

  <details>
  <summary><b>DDL</b></summary>

```sql
 -- 1. 관리자 테이블 
create table admin_list(
  admin_id varchar(36) not null primary key default (uuid()),
  admin_name varchar(255) not null, 
  admin_password varchar(255) not null);

  alter table admin_list add column is_active tinyint default 1;



 --2. 유저 테이블
create table user_list(
  user_id varchar(36) not null primary key default (uuid()), 
  user_name varchar(255) not null, 
  admin_password varchar(255) not null, 
  user_phone varchar(255) not null, 
  user_email varchar(255) not null, 
  user_fav_team bigint);

alter table user_list add constraint 
  foreign key (user_fav_team) references team_list(team_id) 
  on delete set null on update cascade;

alter table user_list add column is_active tinyint default 1;


 -- 3. 팀 테이블
 create table team_list(
    team_id bigint auto_increment primary key, 
    ground_id bigint not null, 
    admin_id varchar(36) NOT NULL, 
    team_name varchar(255) not null, 
    foreign key(ground_id) references ground_list(ground_id), 
    foreign key(admin_id) references admin_list(admin_id));


-- 4. 경기장 테이블
--경기장 정보
create table ground_list(  
    ground_id bigint not null auto_increment,admin_id varchar(36) not null,
    area varchar(255) not null,ground_name varchar(255),
    address varchar(255) not null,seat_count bigint not null,
    primary key(ground_id),
    foreign key (admin_id) references admin(admin_id)
);

--경기장 좌석 정보
create table seat_list( 
    seat_id bigint not null auto_increment,ground_id bigint not null,
    seat_name varchar(255) not null,ground_sight varchar(255)not null,
    ground_grade varchar(255) not null,price bigint not null,
    primary key(seat_id), 
    foreign key (ground_id) references ground_list(ground_id)
);

-- 5. 경기 테이블 
--경기 일정
create table game_schedule_list( 
    game_id bigint auto_increment primary key,
    ground_id bigint not null,
    admin_id vARCHAR(36) NOT NULL,
    h_team_id bigint not null,
    a_team_id bigint not null,
    win bigint,
    foreign key(ground_id) references ground_list(ground_id),
    foreign key(admin_id) references admin_list(admin_id));

alter table game_schedule_list add column game_date datetime;
alter table game_schedule_list modify column game_date datetime not null;


-- 6. 버스 테이블
-- 버스 정보
CREATE TABLE bus_list(
    bus_id BIGINT NOT NULL auto_increment,
    ground_id BIGINT NOT NULL,
    admin_id VARCHAR(36) NOT NULL,
    bus_seat_count INT,
    bus_num VARCHAR(20) NOT NULL UNIQUE,
    is_active TINYINT NOT NULL DEFAULT 1,
    PRIMARY KEY (bus_id),
    FOREIGN KEY (admin_id) REFERENCES admin_list (admin_id)
);

-- 버스시간
CREATE TABLE bus_schedule_list(
    bs_s_id BIGINT NOT NULL auto_increment,
    bus_id BIGINT NOT NULL,
    admin_id VARCHAR(36) NOT NULL,
    game_id BIGINT NOT NULL,
    schedule_time    TIMESTAMP,
    PRIMARY KEY (bs_s_id),
    FOREIGN KEY (bus_id) REFERENCES bus_list (bus_id),
    FOREIGN KEY (admin_id) REFERENCES admin_list  (admin_id),
    FOREIGN KEY (game_id) REFERENCES game_schedule_list (game_id)
);


-- 7. 예매 테이블
--경기 예매 
create table game_res_list(
    game_res_id bigint auto_increment primary key,
    user_id varchar(36) not null, 
    game_id bigint NOT NULL, 
    game_res_count bigint not null, 
    game_res_date datetime not null, 
    foreign key(user_id) references user_list(user_id), 
    foreign key(game_id) references game_schedule_list(game_id));

--좌석 예매
create table game_res_seat_detail(
    game_res_seat_detail_id bigint not null auto_increment,
    game_res_id bigint not null,seat_id bigint not null,
    primary key(game_res_seat_detail_id), 
    foreign key(game_res_id) references game_res_list(game_res_id),
    foreign key(seat_id) references seat_list(seat_id)
);

--버스 예매
CREATE TABLE bus_res_list (
    bus_res_id BIGINT NOT NULL auto_increment,
    bs_s_id BIGINT,
    user_id VARCHAR(36) NOT NULL,
    bus_res_count INT,
    PRIMARY KEY (bus_res_id),
    FOREIGN KEY (bs_s_id) REFERENCES bus_schedule_list (bs_s_id),
    FOREIGN KEY (user_id) REFERENCES user_list (user_id)
);

```
  </details>

  
  
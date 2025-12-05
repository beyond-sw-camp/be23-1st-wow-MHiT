create table ground_list(
    ground_id bigint not null auto_increment,admin_id varchar(36) not null,
    area varchar(255) not null,ground_name varchar(255),
    address varchar(255) not null,seat_count bigint not null,
    primary key(ground_id),
    foreign key (admin_id) references admin(admin_id)
);

insert into ground_list (
admin_id,area,
ground_name,address,seat_count)
values
('1b15a477-d0e7-11f0-94f4-02001702205f','서울','잠실야구장','서울특별시 송파구 올림픽로 25',24000),
('20ada1ff-d0e7-11f0-94f4-02001702205f','서울','고척스카이돔','서울특별시 구로구 경인로 430',16000),
('21c66e2e-d0e7-11f0-94f4-02001702205f','인천','ssg랜더스필드','인천광역시 미추홀구 매소홀로 618',23000),
('228ce23e-d0e7-11f0-94f4-02001702205f','수원','kt위즈파크','경기도 수원시 장안구 경수대로 893',18000),
('233d13d4-d0e7-11f0-94f4-02001702205f','대전','대전한화생명볼파크','대전광역시 중구 대종로 373',17000),
('1b15a477-d0e7-11f0-94f4-02001702205f','대구','대구삼성라이온즈파크','대구광역시 수성구 야구전설로 1',24000),
('20ada1ff-d0e7-11f0-94f4-02001702205f','부산','부산사직야구장','부산광역시 동래구 사직로 45',22000),
('20ada1ff-d0e7-11f0-94f4-02001702205f','창원','창원엔씨파크','경상남도 창원시 마산회원구 삼호로 63',17000),
('21c66e2e-d0e7-11f0-94f4-02001702205f','광주','광주기아챔피언스필드','광주광역시 북구 서림로 10',20000);

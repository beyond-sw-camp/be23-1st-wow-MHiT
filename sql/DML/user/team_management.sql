-- ADMT-01 구단 등록 --
insert into team_list(ground_id, admin_id, team_name) values(15, '1b15a477-d0e7-11f0-94f4-02001702205f', '삼성');
insert into team_list(ground_id, admin_id, team_name) values(16, '21c66e2e-d0e7-11f0-94f4-02001702205f', '롯데');
insert into team_list(ground_id, admin_id, team_name) values(14, '21c66e2e-d0e7-11f0-94f4-02001702205f', '한화');
insert into team_list(ground_id, admin_id, team_name) values(10, '20ada1ff-d0e7-11f0-94f4-02001702205f', 'LG');
insert into team_list(ground_id, admin_id, team_name) values(12, '1b15a477-d0e7-11f0-94f4-02001702205f', 'SSG');
insert into team_list(ground_id, admin_id, team_name) values(17, '20ada1ff-d0e7-11f0-94f4-02001702205f', 'NC');
insert into team_list(ground_id, admin_id, team_name) values(13, '228ce23e-d0e7-11f0-94f4-02001702205f', 'KT');
insert into team_list(ground_id, admin_id, team_name) values(18, '1b15a477-d0e7-11f0-94f4-02001702205f', 'KIA');
insert into team_list(ground_id, admin_id, team_name) values(10, '233d13d4-d0e7-11f0-94f4-02001702205f', '두산');
insert into team_list(ground_id, admin_id, team_name) values(11, '20ada1ff-d0e7-11f0-94f4-02001702205f', '키움');

-- ADMT-02 구단 수정 (구단의 구장 수정) --
update team_list set team_name='삼성' where groun_id=12;
update team_list set team_name='롯데' where groun_id=15;
update team_list set team_name='한화' where groun_id=17;
update team_list set team_name='두산' where groun_id=13;
update team_list set team_name='키움' where groun_id=11;
update team_list set team_name='KIA' where groun_id=10;
update team_list set team_name='LG' where groun_id=19;
update team_list set team_name='SSG' where groun_id=17;
update team_list set team_name='NC' where groun_id=13;
update team_list set team_name='KT' where groun_id=17;

-- ADMT-03 구단 삭제 --
alter table team_list add column team_status tinyint not null default 1;
update team_list set team_status=0 where team_id=10;
select * from team_list where team_status=1;
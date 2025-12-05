
-- ADMP-01 경기 정보 등록 --
insert into game_schedule_list(ground_id, admin_id, h_team_id, a_team_id, game_date) values
(12, '1b15a477-d0e7-11f0-94f4-02001702205f',  5, 3, '2025-12-25 18:30:00');

-- ADMP-02 경기 정보 수정 -- 
update game_schedule_list set game_date='2025-12-31 19:00:00' where game_id=91;


-- GRESERVE-01 경기 예매 --
insert into game_res_list(user_id, game_id, game_res_count, game_res_date) values
('17d725dd-d10a-11f0-94f4-02001702205f', 74, 2, '2025-12-04 21:00:00');
insert into game_res_list(user_id, game_id, game_res_count, game_res_date) values
('17d726fe-d10a-11f0-94f4-02001702205f', 75, 1, '2025-12-04 21:00:00');
insert into game_res_list(user_id, game_id, game_res_count, game_res_date) values
('17d72745-d10a-11f0-94f4-02001702205f', 76, 2, '2025-12-05 21:00:00');
insert into game_res_list(user_id, game_id, game_res_count, game_res_date) values
('17d725dd-d10a-11f0-94f4-02001702205f', 77, 3, '2025-12-06 21:00:00');
insert into game_res_list(user_id, game_id, game_res_count, game_res_date) values
('17d726fe-d10a-11f0-94f4-02001702205f', 78, 1, '2025-12-07 21:00:00');
insert into game_res_list(user_id, game_id, game_res_count, game_res_date) values
('17d72745-d10a-11f0-94f4-02001702205f', 79, 2, '2025-12-08 21:00:00');
insert into game_res_list(user_id, game_id, game_res_count, game_res_date) values
('17d727bf-d10a-11f0-94f4-02001702205f', 80, 2, '2025-12-09 21:00:00');
insert into game_res_list(user_id, game_id, game_res_count, game_res_date) values
('17d725dd-d10a-11f0-94f4-02001702205f', 81, 1, '2025-12-07 21:00:00');
insert into game_res_list(user_id, game_id, game_res_count, game_res_date) values
('17d727bf-d10a-11f0-94f4-02001702205f', 82, 2, '2025-12-05 21:00:00');


-- GRESERVE-02 경기 예매 내역 조회 --
-- 홍길동1이 예매한 내역 정보(이름, 전화번호, 티켓 수, 예매 날짜, 좌석 번호, 좌석 시야, 좌석 등급, 경기 날짜) 조회 --
select u.user_name, u.user_phone, g_r.game_res_count, g_r.game_res_date, s.seat_name, s.ground_sight, s.ground_grade, g_s.game_date
from game_res_list g_r 
inner join game_res_seat_detail g_r_s on g_r.game_res_id=g_r_s.game_res_id 
inner join game_schedule_list g_s on g_s.game_id=g_r.game_id
inner join user_list u on u.user_id=g_r.user_id
inner join seat_list s on s.seat_id=g_r_s.seat_id
where user_name='홍길동1';
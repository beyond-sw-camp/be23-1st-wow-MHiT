-- 마이페이지 정보조회(회원 이름, 전화번호, 이메일, 선호하는 팀이름 조회)
select user_name, user_phone, user_email, t.team_name 
from user_list u 
inner join team_list t 
on u.user_fav_team=t.team_id
where user_email='hong@naver.com';


-- 개인정보 및 선호 구단 수정
update user_list 
set user_name = 'honggildong', user_password='hong777', user_fav_team=3 
where user_email='hong2@naver.com';


-- 예매 내역 조회 
-- 1. 경기 예매 내역 조회  -- 이름, 전화번호, 예매수, 예매일자, 좌석번호, 좌석이름, 시야, 등급, 경기일자
select u.user_name, u.user_phone, g_r.game_res_count, g_r.game_res_date, s.seat_name, s.ground_sight, s.ground_grade, g_s.game_date
from game_res_list g_r 
inner join game_res_seat_detail g_r_s on g_r.game_res_id=g_r_s.game_res_id 
inner join game_schedule_list g_s on g_s.game_id=g_r.game_id
inner join user_list u on u.user_id=g_r.user_id
inner join seat_list s on s.seat_id=g_r_s.seat_id
where user_name='홍길동1';



/* -- 2. 버스 예매 내역 조회  -- 이름, 전화번호, 예매수, 예매시간, 버스번호, 경기장이름
select u.user_name, u.user_phone, b_r.bus_res_count, b_l.bus_num, b_s.schedule_time, g_l.ground_name
from bus_res_list b_r 
inner join bus_schedule_list b_s on b_r.bs_s_id=b_s.bs_s_id 
inner join bus_list b_l on b_l.bus_id=b_s.bus_id 
inner join user_list u on b_r.user_id=u.user_id 
inner join ground_list g_l on g_l.ground_id = b_l.ground_id 
where user_name='홍길동1';
*/

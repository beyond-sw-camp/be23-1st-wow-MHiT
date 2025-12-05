-- 특정 유저 경기 예매 내역 조회 프로시저 --

delimiter //

create procedure game_res_search(
    in user_Name varchar(255)
)
begin
    select u.user_name, u.user_phone, g_r.game_res_count, g_r.game_res_date, s.seat_name, s.ground_sight, s.ground_grade, g_s.game_date
from game_res_list g_r 
inner join game_res_seat_detail g_r_s on g_r.game_res_id=g_r_s.game_res_id 
inner join game_schedule_list g_s on g_s.game_id=g_r.game_id
inner join user_list u on u.user_id=g_r.user_id
inner join seat_list s on s.seat_id=g_r_s.seat_id
where user_name=u.user_Name;
end//

delimiter ;

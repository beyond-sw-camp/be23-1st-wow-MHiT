-- 예매 내역 조회 프로시저
-- 1. 경기 예매 내역 조회
delimiter //
create procedure get_my_game_reservation(
in email_in varchar(255)
)

begin
select u.user_name, u.user_phone, g_r.game_res_count, g_r.game_res_date, s.seat_name, s.ground_sight, s.ground_grade, g_s.game_date
from game_res_list g_r inner join game_res_seat_detail g_r_s on g_r.game_res_id=g_r_s.game_res_id 
inner join game_schedule_list g_s on g_s.game_id=g_r.game_id
inner join user_list u on u.user_id=g_r.user_id
inner join seat_list s on s.seat_id=g_r_s.seat_id
where user_email=email_in;
end //
delimiter ;

/* 2. 버스 예매 내역 조회
    delimiter //
    create procedure find_my_bus_reservation(
    in email_in varchar(255)
    )

    begin
    select u.user_name, u.user_phone, b_r.bus_res_count, b_l.bus_num , b_s.schedule_time, g_l.ground_name
    from bus_res_list b_r 
    inner join bus_schedule_list b_s on b_r.bs_s_id=b_s.bs_s_id 
    inner join bus_list b_l on b_l.bus_id=b_s.bus_id 
    inner join user_list u on b_r.user_id=u.user_id 
    inner join ground_list g_l on g_l.ground_id = b_l.ground_id 
    where user_email=email_in;
    end //
    delimiter ; 
*/



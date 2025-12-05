-- 경기 예매 상황 실시간 조회  
-- 홈팀명, 에워팀명, 경기 시작 시간, 경기별 판매된 좌석수, 남은 좌석수, 전체 좌석수
delimiter //
create procedure get_game_res_status()

begin
    select 
    ht.team_name home_team,
    at.team_name away_team,
    g_s.game_date,
    sum(g_r.game_res_count) sold_seats,
    ( select count(*) from seat_list s WHERE s.ground_id = g_s.ground_id) -  SUM(g_r.game_res_count) remaining_seats,    
    ( select count(*) from seat_list s where s.ground_id = g_s.ground_id ) total_seats
    from game_res_list g_r
    inner join game_schedule_list g_s
    on g_r.game_id = g_s.game_id
    left join team_list ht
    on g_s.h_team_id = ht.team_id
    left join team_list at
    on g_s.a_team_id = at.team_id
    where g_s.game_date> now() 
    group by g_s.game_id;

end //
delimiter ;


-- GLIST-02 경기 예매 상황 실시간 조회 --

select 
    ht.team_name home_team,
    at.team_name away_team,
    g_s.game_date,
    sum(g_r.game_res_count) sold_seats,
    ( select count(*) from seat_list s WHERE s.ground_id = g_s.ground_id) -  SUM(g_r.game_res_count) remaining_seats,    
    ( select count(*) from seat_list s where s.ground_id = g_s.ground_id ) total_seats
from game_res_list g_r
inner join game_schedule_list g_s
    on g_r.game_id = g_s.game_id
left join team_list ht
    on g_s.h_team_id = ht.team_id
left join team_list at
    on g_s.a_team_id = at.team_id
group by g_s.game_id;
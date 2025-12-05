--구장경기정보조회 프로시저
delimiter //

create procedure get_ground_games(
    in p_ground_id bigint
)
begin
    select 
        g.ground_name as ground_name,        
        home_t.team_name as home_team,       
        away_t.team_name as away_team,       
        case 
            when gs.win = 1 then '승'
            when gs.win = 2 then '패'
            when gs.win = 0 then '무승부'
            else '경기 전'
        end as result,
        gs.game_date
    from game_schedule_list gs
    inner join ground_list g
        on gs.ground_id = g.ground_id
    inner join team_list home_t
        on gs.h_team_id = home_t.team_id
    inner join team_list away_t
        on gs.a_team_id = away_t.team_id
    where g.ground_id = p_ground_id;
end//

delimiter ;



------호출예시-------
call get_ground_games(12);

-----출력예시-----

잠실야구장	LG 	두산 승	2025-06-10
잠실야구장	두산 롯데 패 2025-06-12
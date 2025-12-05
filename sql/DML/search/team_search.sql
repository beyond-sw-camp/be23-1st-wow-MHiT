-- TEAM-01 현재 존재하는 구단 정보 조회 (구단 이름, 구단의 구장, 구장 주소, 구장 좌석수, 좌석 이름, 좌석 시야, 좌석 등급, 가격)
select t.team_name, g.area, g.ground_name, g.address, g.seat_count, s.seat_name, s.ground_sight, s.ground_grade, s.price from team_list t inner join ground_list g on t.ground_id=g.ground_id inner join seat_list s on t.ground_id=s.ground_id where t.team_status=1;
-- 특정 구단 정보 조회
select t.team_name, g.area, g.ground_name, g.address, g.seat_count, s.seat_name, s.ground_sight, s.ground_grade, s.price from team_list t inner join ground_list g on t.ground_id=g.ground_id inner join seat_list s on t.ground_id=s.ground_id where t.team_name='삼성';


-- TEAM-02 구단 경기 기록 조회 --
select 
    home_t.team_name as home_team,
    g.ground_name,
    away_t.team_name as away_team,
    case 
        when gs.win = 1 then '승'
        when gs.win = 2 then '패'
        when gs.win = 0 then '무승부'
        else '경기 시작전'
    end as result,
    gs.game_date
from ground_list g
inner join team_list home_t 
    on g.ground_id = home_t.ground_id
inner join game_schedule_list gs 
    on g.ground_id = gs.ground_id
inner join team_list away_t
    on gs.a_team_id = away_t.team_id
    where home_t.team_name='삼성' or away_t.team_name='삼성';


-- TEAM-03 구단 순위 조회 --
delimiter //

create procedure team_stats(
    in p_team_name varchar(255)
)
begin
    select
        t.team_id,
        t.team_name,
        count(distinct u.user_id) as fav_user_count,


        sum(
            case
                when (gs.h_team_id = t.team_id and gs.win = 1)
                     or (gs.a_team_id = t.team_id and gs.win = 2)
                then 1
                else 0
            end
        ) as wins,


        sum(
            case
                when (gs.h_team_id = t.team_id and gs.win = 2)
                     or (gs.a_team_id = t.team_id and gs.win = 1)
                then 1
                else 0
            end
        ) as losses,


        round(
            (
                sum(
                    case
                        when (gs.h_team_id = t.team_id and gs.win = 1)
                             or (gs.a_team_id = t.team_id and gs.win = 2)
                        then 1
                        else 0
                    end
                )
                /
                nullif(
                    sum(
                        case 
                            when gs.win in (1,2) then 1
                            else 0
                        end
                    ),
                    0
                ) * 100
            ),
            2
        ) as win_rate
    from team_list t
    left join user_list u
        on u.user_fav_team = t.team_id
    left join game_schedule_list gs
        on gs.h_team_id = t.team_id
        or gs.a_team_id = t.team_id
    where t.team_name = p_team_name
    group by
        t.team_id,
        t.team_name;
end//

delimiter ;
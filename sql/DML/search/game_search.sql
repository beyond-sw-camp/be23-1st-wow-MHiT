-- GLIST-01 경기 상세 정보 조회 (해당 날짜에 해당하는 구단 경기)--
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
    where home_t.team_name='삼성' and gs.game_date='2025-10-01 17:00:00';

-- GLIST-02 경기 예매 상황 실시간 조회 --

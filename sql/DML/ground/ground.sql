----- ADMG-03 구장 정보 삭제 ------
update ground_list set ground_status=0 where ground_id =18;
update ground_list set ground_status=0 where ground_id =17;
update ground_list set ground_status=0 where ground_id =16;
update ground_list set ground_status=0 where ground_id =15;

----- ADMG-02 구장 정보 수정-----
update ground_list set ground_name='기아챔피언스필드' where ground_id =18;
update ground_list set address = '부산광역시 동래구 사직로 40' where ground_id =16;
update ground_list set ground_status=0 where ground_id = 17;

----- GRD-01 구장 상세 정보 조회 -----
select 
    t.team_name as home_team,
    g.area,
    g.ground_name,
    g.address,
    g.seat_count,
    g.ground_status
from ground_list g
inner join team_list t 
    on g.ground_id = t.ground_id;

----- GRD-02 구장 경기 조회 -----
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
    on gs.a_team_id = away_t.team_id;
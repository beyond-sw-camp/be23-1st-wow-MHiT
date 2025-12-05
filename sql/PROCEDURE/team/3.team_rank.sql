-- 구단 좋아요 수, 승률 정보 조회 프로시저 --
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
    left join user_list u on u.user_fav_team = t.team_id
    left join game_schedule_list gs on gs.h_team_id = t.team_id or gs.a_team_id = t.team_id
    where t.team_name = p_team_name
    group by
        t.team_id,
        t.team_name;
end
// delimiter ;
-- 경기 예매 프로시저 --

delimiter //

create procedure game_res(
    in p_user_email varchar(255), 
    in p_game_id bigint, 
    in p_ticket_count bigint, 
    in p_game_date datetime
)
begin
    insert into game_res_list(user_id, game_id, game_res_count, game_res_date)
    values (
        (select user_id from user_list where user_email = p_user_email limit 1),
        p_game_id,
        p_ticket_count,
        p_game_date
    );
end//

delimiter ;
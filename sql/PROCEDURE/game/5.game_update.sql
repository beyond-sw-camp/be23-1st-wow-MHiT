-- 경기 시간 수정 프로시저 --

delimiter //
create procedure game_update(in game_Id bigint, in game_Date datetime)
begin
	declare ycount int;
	update game_schedule_list set game_date = game_Date where game_id=game_Id;
	select count(*) into ycount from bus_schedule_list where game_id = game_Id;
	if ycount > 0 then
		update bus_schedule_list set schedule_time=date_sub(game_Date, interval 1 hour) where game_id=game_Id;
	end if;
end
// delimiter ;

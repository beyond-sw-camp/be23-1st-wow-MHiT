-- 경기 시간 수정 프로시저 --
delimiter //
create procedure game_update(in game_Date datetime, in game_Id bigint)
begin
	update game_schedule_list set game_date=game_Date where game_id=gmae_Id;
end
// delimiter ;


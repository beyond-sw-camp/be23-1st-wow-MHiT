-- 구단의 구장 수정 프로시저 --
delimiter //
create procedure team_update(in ground_Name varchar(255), in team_Name varchar(255))
begin
	update team_list set ground_id=(select ground_id from ground_list where ground_name=ground_Name limit 1) where team_id=(select team_id from team_list where team_name=team_Name limit 1);
end
// delimiter ;


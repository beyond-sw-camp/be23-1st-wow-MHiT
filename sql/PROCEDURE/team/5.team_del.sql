-- 구단 삭제 프로시저 --
delimiter //
create procedure team_del(in team_Name varchar(255))
begin
	update team_list set team_status=0 where team_id=(select team_id from team_list where team_name=team_Name);
end
// delimiter ;


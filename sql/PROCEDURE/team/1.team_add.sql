-- 구단 등록 프로시저 --
delimiter //
create procedure team_add(in ground_Id bigint, in admin_Id varchar(36), in team_Name varchar(255))
begin
	insert into team_list(ground_id, admin_id, team_name)
    values (ground_Id, admin_Id, team_Name);
end
// delimiter ;
-- 경기 정보 등록 프로시저 --
delimiter //
create procedure team_add(in ground_Name varchar(255), in admin_Name varchar(255), in h_team_Name varchar(255), in a_team_Name varchar(255), in game_Date datetime)
begin
	insert into game_schedule_list(ground_id, admin_id, h_team_id, a_team_id, game_date) values
((select ground_id from ground_list where ground_name=ground_Name limit 1), 
(select admin_id from admin_list where admin_name=admin_Name limit 1), 
(select team_id from team_list where team_name=h_team_Name limit 1), 
(select team_id from team_list where team_name=a_team_Name limit 1), game_Date);

end
// delimiter ;
-- 특정 구단 정보 조회 프로시저 --
delimiter //
create procedure team_add(in team_Name varchar(255))
begin
	select t.team_name, g.area, g.ground_name, g.address, g.seat_count, s.seat_name, s.ground_sight, s.ground_grade, s.price 
    from team_list t 
    inner join ground_list g on t.ground_id=g.ground_id 
    inner join seat_list s on t.ground_id=s.ground_id 
    where t.team_name=team_Name;
end
// delimiter ;

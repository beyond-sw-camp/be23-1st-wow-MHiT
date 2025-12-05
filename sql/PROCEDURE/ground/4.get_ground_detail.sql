--구장정보조회프로시저
delimiter //

create procedure get_ground_detail(
    in p_ground_id bigint
)
begin
    select 
        ground_id,
        admin_id,
        area,
        ground_name,
        address,
        seat_count,
        ground_status
    from ground_list
    where ground_id = p_ground_id;
end//

delimiter ;

-----호출예시-----
call get_ground_detail(12);

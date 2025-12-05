--구장삭제프로시저
delimiter //

create procedure delete_ground (
    in p_ground_id bigint
)
begin
    update ground_list
    set ground_status = 0   -- 0 = 삭제
    where ground_id = p_ground_id;
end//

delimiter ;

-----호출예시-----
call delete_ground(12);

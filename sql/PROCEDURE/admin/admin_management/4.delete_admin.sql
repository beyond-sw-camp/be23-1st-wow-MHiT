 -- 관리자 탈퇴 프로시저(is_active 변경)
delimiter //
create procedure delete_admin(
in admin_id_in varchar(36))

begin
    update admin_list
    set 
        set is_active = 0 
        where admin_id=admin_id_in;
end //
delimiter ;


-- 관리자 정보 조회 프로시저
delimiter //
create procedure get_admin_info(
in admin_id_in varchar(36))

begin
    select admin_name, admin_email,admin_email, is_active
    from admin_list  
    where admin_id=admin_id_in;
end //
delimiter ;


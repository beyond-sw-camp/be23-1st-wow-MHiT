-- 관리자등록 프로시저
delimiter //
create procedure register_admin(in name_in varchar(255),
in password_in varchar(255),
in email_in varchar(255))
begin
    -- email 중복 조회 
    if exists (
        select 1 from admin_list
        where admin_email = email_in
        )
        then 
			signal sqlstate '45000' 
			set message_text = "이미 등록된 이메일입니다. ";

    else 
    insert into admin_list (
        admin_name, admin_email, admin_password
    )
    values (
        name_in,  email_in, password_in) ;
    end if;
end //
delimiter ;
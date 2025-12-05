 -- 관리자 정보 수정 프로시저
delimiter //
create procedure admin_info_update(in name_in varchar(255),
in password_in varchar(255),
in old_email_in varchar(255), 
in new_email_in varchar(255))

begin
    -- email 중복 조회 
    if exists (
        select 1 from admin_list
        where admin_email = new_email_in
        )
        then 
			signal sqlstate '45000' 
			set message_text = "이미 등록된 이메일입니다. ";

    else 
    -- 입력한 기존email이 맞을시, 수정
    update admin_list
    set 
        admin_name=name_in, 
        admin_password=password_in, 
        admin_email=new_email_in
        where admin_email=old_email_in;
    end if;
end //
delimiter ;
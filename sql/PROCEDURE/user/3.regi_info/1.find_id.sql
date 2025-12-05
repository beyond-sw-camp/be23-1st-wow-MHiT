-- 아이디 찾기
delimiter //
create procedure get_user_id(
in name_in varchar(255),
in phone_in varchar(255)
)

begin
    select user_email
    from user_list 
    where user_name=name_in and user_phone=phone_in;
end //
delimiter ;


-- 비밀번호 찾기
delimiter //
create procedure get_user_password(
in phone_in varchar(255),
in email_in varchar(255)
)

begin
    select user_password
    from user_list 
    where user_phone=phone_in and user_email=email_in;
end //
delimiter ;



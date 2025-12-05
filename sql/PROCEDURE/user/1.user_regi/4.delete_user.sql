--- 회원 탈퇴
delimiter //
create procedure delete_user(
in password_in varchar(255),
in email_in varchar(255))

begin
    update user_list set is_active = 0 
    where user_password=password_in and user_email=email_in;
end //
delimiter ;

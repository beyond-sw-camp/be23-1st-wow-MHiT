-- 회원정보 조회
delimiter //
create procedure get_user_info(
in password_in varchar(255),
in email_in varchar(255))

begin
    select user_name, user_phone,user_email,t.team_name 
    from user_list l left join team_list t 
        on l.user_fav_team=t.team_id 
    where user_email=email_in and user_password=password_in;
end //
delimiter ;
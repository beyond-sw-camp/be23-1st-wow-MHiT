-- 회원가입
insert into user_list(user_name, user_password, user_phone, user_email, user_fav_team)
values('성춘향', '12345', '010-1111-1111', 'sung7@naver.com', 3);


-- 회원정보 수정
update user_list 
set user_name = 'choi', user_password='choi777' 
where user_email='hong4@naver.com';


-- 회원정보 조회
select user_name from user_list 
where user_email='hong1@naver.com';


-- 회원 탈퇴
update user_list set is_active = 0 
where user_email='hong@naver.com' and user_password='1111';

 
-- 회원가입 프로시저
delimiter //
create procedure register_user(in id_name varchar(255),
in password_in varchar(255),
in phone_in varchar(255),
in email_in varchar(255), 
in fav_team_in varchar(255))
begin
    declare T_id bigint(20);
    
    select team_id into T_id from team_list 
    where team_name = fav_team_in ;

    if exists (
        select 1 from user_list
        where user_email = email_in
        )
        then 
			signal sqlstate '45000' 
			set message_text = "이미 등록된 이메일입니다. ";
    
    else 
    insert into user_list (
        user_name, user_password, user_phone, user_email, user_fav_team
    )
    values (
        id_name, password_in, phone_in, email_in, register_userT_id) ;
    end if;
end //
delimiter ;
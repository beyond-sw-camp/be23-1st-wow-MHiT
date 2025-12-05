-- 회원가입 프로시저
delimiter //
create procedure register_user(in id_name varchar(255),
in password_in varchar(255),
in phone_in varchar(255),
in email_in varchar(255), 
in fav_team_in varchar(255))
begin
    declare T_id bigint(20);
    
    -- 좋아하는 팀 명을 적으면 id값으로 변환
    select team_id into T_id from team_list 
    where team_name = fav_team_in ;

    -- email 중복 조회 
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
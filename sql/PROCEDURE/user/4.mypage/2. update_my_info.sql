-- 이미 로그인 되어있음. 비밀번호만 한번 더 입력후 정보 수정

-- 개인정보 및 선호 구단 수정 프로시저
update user_list 
set user_name = 'honggildong', user_password='hong777', user_fav_team=3 
where user_email='hong2@naver.com';

 -- 회원 정보 수정 
delimiter //
create procedure user_info_update
(in name_in varchar(255),
in password_in varchar(255),
in phone_in varchar(255),
in old_email_in varchar(255), 
in new_email_in varchar(255), 
in fav_team_in varchar(255))

begin
    declare T_id bigint(20);
    -- 좋아하는 팀 명을 적으면 id값으로 변환
    select team_id into T_id 
    from team_list 
    where team_name = fav_team_in ;

    -- email 중복 조회 
    if exists (
        select 1 from user_list
        where user_email = new_email_in
        )
        then 
			signal sqlstate '45000' 
			set message_text = "이미 등록된 이메일입니다. ";

    else 
    -- 입력한 기존email이 맞을시, 수정
    update user_list
    set 
        user_name=name_in, 
        user_password=password_in, 
        user_phone=phone_in, 
        user_email=new_email_in, 
        user_fav_team=T_id
        where user_email=old_email_in;
    end if;
end //
delimiter ;
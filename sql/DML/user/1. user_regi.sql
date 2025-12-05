-- 회원가입
insert into user_list(user_name, user_password, user_phone, user_email, user_fav_team)
values('성춘향', '12345', '010-1111-1111', 'sung7@naver.com', 3);


-- 회원정보 수정
update user_list 
set user_name = 'choi', user_password='choi777' 
where user_email='hong4@naver.com';


-- 회원정보 조회
select user_name, user_phone,user_email,t.team_name 
from user_list l left join team_list t 
    on l.user_fav_team=t.team_id 
where user_email='hong1@naver.com';


-- 회원 탈퇴
update user_list set is_active = 0 
where user_email='hong@naver.com' and user_password='1111';

 
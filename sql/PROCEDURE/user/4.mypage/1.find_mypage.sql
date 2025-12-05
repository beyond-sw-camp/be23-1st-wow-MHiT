-- 이미 로그인 되어있음. 비밀번호만 한번 더 입력후 정보조회
-- 마이페이지 정보조회
delimiter //
create procedure find_mypage(
in password_in varchar(255)
)

begin
select user_name, user_phone, user_email, t.team_name 
from user_list u 
inner join team_list t 
on u.user_fav_team=t.team_id
where user_password=password_in;
end //
delimiter ;

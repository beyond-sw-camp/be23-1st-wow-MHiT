-- 아이디 찾기
select user_id from user_list 
where user_email='hong1@naver.com' and user_password='2222';


-- 비밀번호 찾기
select user_password from user_list 
where user_email='hong1@naver.com' and user_phone='010-2222-3333';
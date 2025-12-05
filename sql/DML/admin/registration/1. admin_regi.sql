-- 관리자 등록
insert into admin_list(admin_name, admin_email, admin_password)
valuse('kang', 'kanggi00@naver.com', '0070!');


-- 관리자 수정
update admin_list 
set admin_name = 'kong', admin_password='kong88' 
where user_email='admin1@daum.net';


-- 관리자 조회
select admin_name from admin_list 
where user_email='admin1@daum.net';


-- 관리자 탈퇴 
update admin_list set is_active = 0 
where admin_email='hong@naver.com' and admin_password='hong123';

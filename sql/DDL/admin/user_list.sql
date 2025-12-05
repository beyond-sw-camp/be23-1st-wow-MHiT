create table user_list(
user_id varchar(36) not null primary key default (uuid()), 
user_name varchar(255) not null, 
admin_password varchar(255) not null, 
user_phone varchar(255) not null, 
user_email varchar(255) not null, 
user_fav_team bigint);

alter table user_list add constraint 
foreign key (user_fav_team) references team_list(team_id) 
on delete set null on update cascade;

alter table user_list add column is_active tinyint default 1;
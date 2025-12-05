create database mhit;
use mhit;

create table admin_list(
admin_id varchar(36) not null primary key default (uuid()),
admin_name varchar(255) not null, 
admin_password varchar(255) not null);

alter table admin_list add column is_active tinyint default 1;
create table game_schedule_list(
    game_id bigint auto_increment primary key,
    ground_id bigint not null,
    admin_id vARCHAR(36) NOT NULL,
    h_team_id bigint not null,
    a_team_id bigint not null,
    win bigint,
    foreign key(ground_id) references ground_list(ground_id),
    foreign key(admin_id) references admin_list(admin_id));

alter table game_schedule_list add column game_date datetime;
alter table game_schedule_list modify column game_date datetime not null;
create table game_res_list(
    game_res_id bigint auto_increment primary key,
    user_id varchar(36) not null, 
    game_id bigint NOT NULL, 
    game_res_count bigint not null, 
    game_res_date datetime not null, 
    foreign key(user_id) references user_list(user_id), 
    foreign key(game_id) references game_schedule_list(game_id));

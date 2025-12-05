create table team_list(
    team_id bigint auto_increment primary key, 
    ground_id bigint not null, 
    admin_id varchar(36) NOT NULL, 
    team_name varchar(255) not null, 
    foreign key(ground_id) references ground_list(ground_id), 
    foreign key(admin_id) references admin_list(admin_id));

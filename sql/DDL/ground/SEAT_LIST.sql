create table seat_list(
    seat_id bigint not null auto_increment,ground_id bigint not null,
    seat_name varchar(255) not null,ground_sight varchar(255)not null,
    ground_grade varchar(255) not null,price bigint not null,
    primary key(seat_id), 
    foreign key (ground_id) references ground_list(ground_id)
);

insert into seat_list(
    ground_id,seat_name,ground_sight,ground_grade,price)
    values
    (10,'a01','내야 1층','일반석',10000),
    (11,'a02','내야 1층','일반석',11000),
   (12,'a03','내야 1층','일반석',10000),
   (13,'a04','내야 1층','일반석',10000),
   (14,'a05','내야 1층','일반석',10000),
   (15,'a06','내야 1층','일반석',10000),
   (16,'a07','내야 1층','일반석',10000),
   (17,'a08','내야 1층','일반석',10000),
   (18,'a09','내야 1층','일반석',10000);

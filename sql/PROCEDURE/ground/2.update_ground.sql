delimiter //

create procedure update_ground (
    in p_ground_id     bigint,
    in p_area          varchar(255),
    in p_ground_name   varchar(255),
    in p_address       varchar(255),
    in p_seat_count    bigint
)
begin
    update ground_list
    set 
        area = p_area,
        ground_name = p_ground_name,
        address = p_address,
        seat_count = p_seat_count
    where ground_id = p_ground_id;
end//

delimiter ;

-----호출예시-----
call update_ground(
    12,                     -- p_ground_id
    '부산',                 -- p_area
    '사직구장',             -- p_ground_name
    '부산 동래구 어디로 123', -- p_address
    18000                   -- p_seat_count
);

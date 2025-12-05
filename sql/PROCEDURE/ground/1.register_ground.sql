delimiter //

create procedure register_ground (
    in  p_admin_id      varchar(36),
    in  p_area          varchar(255),
    in  p_ground_name   varchar(255),
    in  p_address       varchar(255),
    in  p_seat_count    bigint,
    out p_new_ground_id bigint
)
begin
    insert into ground_list (
        admin_id,
        area,
        ground_name,
        address,
        seat_count
    ) values (
        p_admin_id,
        p_area,
        p_ground_name,
        p_address,
        p_seat_count
    );

    -- auto_increment 로 생성된 구장 id 반환
    set p_new_ground_id = last_insert_id();
end//

delimiter ;


----호출예시--------
set @gid = 11;

call register_ground(
    '1b15a477-d0e7-11f0-94f4-02001702205f',  -- admin_id
    '서울',                                   -- area
    '잠실구장',                               -- ground_name
    '서울 송파구 어딘가',                     -- address
    25000,                                    -- seat_count
    @gid                                      -- OUT
);

select @gid as 새로_등록된_ground_id;

----- 버스의 ground_id 나 좌석 수 변경 ------

DELIMITER //

CREATE PROCEDURE update_bus_info(
    IN p_bus_id         BIGINT,
    IN p_ground_id      BIGINT,    -- NULL 이면 변경하지 않음
    IN p_bus_seat_count INT        -- NULL 이면 변경하지 않음
)
BEGIN
    UPDATE bus_list
    SET ground_id      = COALESCE(p_ground_id, ground_id),
        bus_seat_count = COALESCE(p_bus_seat_count, bus_seat_count)
    WHERE bus_id = p_bus_id;
END //

DELIMITER ;


----- procedure call -----
-- bus_id 5번의 버스의 ground_id 를 20으로 변경하고, 좌석 수는 변경하지 않을 때
CALL update_bus_info(5, 20, NULL);


----- 버스 사용/미사용 상태 변경 -----
DELIMITER //

CREATE PROCEDURE change_bus_active(
    IN p_bus_id BIGINT
)
BEGIN
    UPDATE bus_list
    SET is_active = 1 - is_active
    WHERE bus_id = p_bus_id;
END //

DELIMITER ;

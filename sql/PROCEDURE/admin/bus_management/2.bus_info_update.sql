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
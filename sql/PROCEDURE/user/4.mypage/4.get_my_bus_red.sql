----- 사용자의 id를 가지고 예약한 버스 리스트 조회 -----
DELIMITER //

CREATE PROCEDURE user_bus_res_list(
    IN p_user_id VARCHAR(36)
)
BEGIN
    SELECT *
    FROM bus_res_list
    WHERE user_id = p_user_id;
END //

DELIMITER ;

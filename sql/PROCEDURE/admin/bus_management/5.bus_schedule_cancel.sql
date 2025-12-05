----- 버스 스케쥴 cancel -----
DELIMITER //

CREATE PROCEDURE change_bus_schedule_active(
    IN p_bs_s_id BIGINT
)
BEGIN
    UPDATE bus_schedule_list
    SET is_canceled = 1 - is_canceled
    WHERE bs_s_id = p_bs_s_id;
END //

DELIMITER ;


CALL change_bus_schedule_active(버스 스케쥴 id);
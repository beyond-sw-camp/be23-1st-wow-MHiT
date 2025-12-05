----- ADMB-01 버스 등록 -----

DELIMITER //

CREATE PROCEDURE insert_bus_one(
    IN p_ground_id      BIGINT,
    IN p_admin_id       VARCHAR(36),
    IN p_bus_seat_count INT,
    IN p_bus_num        VARCHAR(20)
)
BEGIN
    DECLARE v_cnt INT;

    -- 1) 이미 존재하는 차량번호인지 확인
    SELECT COUNT(*)
      INTO v_cnt
      FROM bus_list
     WHERE bus_num = p_bus_num;

    -- 2) 있으면 안내 메시지만 출력
    IF v_cnt > 0 THEN
        SELECT CONCAT('이미 등록된 차량번호입니다: ', p_bus_num) AS message;

    -- 3) 없으면 INSERT + 성공 메시지
    ELSE
        INSERT INTO bus_list (
            ground_id,
            admin_id,
            bus_seat_count,
            bus_num
        )
        VALUES (
            p_ground_id,
            p_admin_id,
            p_bus_seat_count,
            p_bus_num
        );

        SELECT CONCAT('버스가 정상적으로 등록되었습니다: ', p_bus_num) AS message;
    END IF;
END //


----- procedure call -----
call insert_bus_one(10, '233d13d4-d0e7-11f0-94f4-02001702205f', 30, '울산79라3086');
-- 버스가 정상적으로 등록되었습니다: 울산79라3086
----- 버스 예약 -----

DELIMITER //

CREATE PROCEDURE insert_bus_reservation(
    IN p_bs_s_id       BIGINT,
    IN p_user_id       VARCHAR(36),
    IN p_bus_res_count INT
)
BEGIN
    DECLARE v_game_id          BIGINT;
    DECLARE v_bus_id           BIGINT;
    DECLARE v_is_canceled      TINYINT;
    DECLARE v_bus_seat_count   INT;
    DECLARE v_bus_is_active    TINYINT;
    DECLARE v_has_game_res     INT;
    DECLARE v_current_reserved INT;
    DECLARE v_remain           INT;
    DECLARE v_dup              INT;
    DECLARE v_msg              TEXT;

    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        RESIGNAL;
    END;

    START TRANSACTION;

    -- 1) 스케줄/게임 정보 (단순 조회)
    SELECT game_id, bus_id, is_canceled
      INTO v_game_id, v_bus_id, v_is_canceled
      FROM bus_schedule_list
     WHERE bs_s_id = p_bs_s_id;

    IF v_game_id IS NULL THEN
        SET v_msg = '유효하지 않은 버스 스케줄입니다.';
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = v_msg;
    END IF;

    IF v_is_canceled = 1 THEN
        SET v_msg = '취소된 버스 스케줄입니다.';
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = v_msg;
    END IF;

    -- 2) 경기 예약 여부 확인 (단순 조회)
    SELECT COUNT(*)
      INTO v_has_game_res
      FROM game_res_list
     WHERE user_id = p_user_id
       AND game_id = v_game_id;

    IF v_has_game_res = 0 THEN
        SET v_msg = '잘못된 요청입니다.';
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = v_msg;
    END IF;

    -- 3) 버스 기본 정보 (좌석수/활성 여부, 잠그진 않아도 됨)
    SELECT bus_seat_count, is_active
      INTO v_bus_seat_count, v_bus_is_active
      FROM bus_list
     WHERE bus_id = v_bus_id;

    IF v_bus_seat_count IS NULL THEN
        SET v_msg = '버스 정보가 존재하지 않습니다.';
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = v_msg;
    END IF;

    IF v_bus_is_active = 0 THEN
        SET v_msg = '비활성화된 버스입니다.';
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = v_msg;
    END IF;

    -- 4) 여기부터가 “경쟁 구간”: bus_res_list 를 잠그면서 처리

    -- 4-1) 같은 유저의 중복 예약 확인 + 잠금
    SELECT COUNT(*)
      INTO v_dup
      FROM bus_res_list
     WHERE bs_s_id = p_bs_s_id
       AND user_id = p_user_id
     FOR UPDATE;

    IF v_dup > 0 THEN
        SET v_msg = '이미 이 버스를 예약한 사용자입니다.';
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = v_msg;
    END IF;

    -- 4-2) 현재 예약 인원 합계 + 잠금
    SELECT IFNULL(SUM(bus_res_count), 0)
      INTO v_current_reserved
      FROM bus_res_list
     WHERE bs_s_id = p_bs_s_id
     FOR UPDATE;

    SET v_remain = v_bus_seat_count - v_current_reserved;

    IF p_bus_res_count > v_remain THEN
        SET v_msg = CONCAT('예약 가능 인원이 부족합니다. 남은 좌석: ', v_remain);
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = v_msg;
    END IF;

    -- 5) INSERT
    INSERT INTO bus_res_list (bs_s_id, user_id, bus_res_count)
    VALUES (p_bs_s_id, p_user_id, p_bus_res_count);

    COMMIT;

    SELECT '버스 예약이 완료되었습니다.' AS message,
           v_bus_id                              AS bus_id,
           p_bs_s_id                             AS bs_s_id,
           p_bus_res_count                       AS reserved_count,
           v_remain - p_bus_res_count            AS remain_seat_after;
END //

DELIMITER ;

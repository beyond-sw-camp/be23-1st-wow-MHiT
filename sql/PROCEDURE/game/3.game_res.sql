-- 경기 예매 프로시저 --
CREATE PROCEDURE game_res(
    IN p_user_id        VARCHAR(36),
    IN p_game_id        BIGINT,
    IN p_game_res_count INT
)
BEGIN
    DECLARE v_dummy BIGINT;

    -- 에러 나면 자동으로 롤백하고 에러 다시 던지기
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        RESIGNAL;
    END;

    START TRANSACTION;

    SELECT game_res_id
      INTO v_dummy
      FROM game_res_list
     WHERE user_id = p_user_id
       AND game_id = p_game_id
     FOR UPDATE;

    INSERT INTO game_res_list (
        user_id,
        game_id,
        game_res_count,
        game_res_date
    )
    VALUES (
        p_user_id,
        p_game_id,
        p_game_res_count,
        NOW()
    );

    COMMIT;
END //

DELIMITER ;

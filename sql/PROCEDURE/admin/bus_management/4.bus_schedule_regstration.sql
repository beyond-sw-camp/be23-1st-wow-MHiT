----- 버스 스케쥴 등록. 해당하는 경기의 게임 id 를 가지고 등록 -----
----- active 아닌 버스는 목록에서 제외 
DELIMITER //

CREATE PROCEDURE insert_bus_schedule(
    IN p_game_id  BIGINT,
    IN p_admin_id VARCHAR(36)   -- NULL/'' 이면 bus_list.admin_id 사용
)
BEGIN
    INSERT INTO bus_schedule_list (
        bus_id,
        admin_id,
        game_id,
        schedule_time
    )
    SELECT
        b.bus_id,
        CASE
            WHEN p_admin_id IS NULL OR p_admin_id = '' THEN b.admin_id
            ELSE p_admin_id
        END AS admin_id,
        gs.game_id,
        DATE_SUB(gs.game_date, INTERVAL 1 HOUR) AS schedule_time
    FROM bus_list AS b
    JOIN game_schedule_list AS gs
        ON gs.ground_id = b.ground_id
    LEFT JOIN bus_schedule_list AS bs
        ON bs.bus_id  = b.bus_id
       AND bs.game_id = gs.game_id
    WHERE gs.game_id = p_game_id      
      AND gs.game_date > NOW()        
      AND bs.bus_id IS NULL           
      AND b.is_active = 1;            
END //

DELIMITER ;



----- procedure call -----
-- 버스를 등록한 관리자가 아닌 다른 관리자가 버스 스케쥴을 등록할 때
CALL insert_bus_schedule(경기id, 어드민id);
-- 버스를 등록한 관리자가 버스 스케쥴을 등록할 때
CALL insert_bus_schedule(경기id, NULL);
CALL insert_bus_schedule(75, '');
----- 경기 id로 예약 가능한 버스 조회 -----

DELIMITER //

CREATE PROCEDURE show_available_bus(
    IN p_game_id BIGINT
)
BEGIN
    SELECT
        bs.bs_s_id,
        bs.game_id,
        DATE_FORMAT(gs.game_date, '%Y.%m.%d %H:%i') AS game_date,
        DATE_FORMAT(bs.schedule_time, '%Y.%m.%d %H:%i') AS bus_date,
        b.bus_id,
        b.bus_num,
        b.bus_seat_count,
        IFNULL(SUM(br.bus_res_count), 0) AS reserved_count,
        b.bus_seat_count - IFNULL(SUM(br.bus_res_count), 0) AS remain_seat
    FROM bus_schedule_list AS bs
    JOIN game_schedule_list AS gs
        ON gs.game_id = bs.game_id
    JOIN bus_list AS b
        ON b.bus_id = bs.bus_id
    LEFT JOIN bus_res_list AS br
        ON br.bs_s_id = bs.bs_s_id
    WHERE bs.game_id   = p_game_id
      AND bs.is_canceled = 0
      AND b.is_active   = 1
      AND gs.game_date  > NOW()
    GROUP BY
        bs.bs_s_id,
        bs.game_id,
        gs.game_date,
        bs.schedule_time,
        b.bus_id,
        b.bus_num,
        b.bus_seat_count
    HAVING
        b.bus_seat_count > IFNULL(SUM(br.bus_res_count), 0)
    ORDER BY
        remain_seat DESC,
        b.bus_id ASC;
END //

DELIMITER ;


----- call -----

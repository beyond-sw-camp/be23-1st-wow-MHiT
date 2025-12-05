------  버스 데이터 여러번 --------

DELIMITER //

CREATE PROCEDURE insert_dummy_bus()
BEGIN
    -- 공통 변수
    DECLARE done INT DEFAULT 0;
    DECLARE v_ground_id  BIGINT;
    DECLARE v_admin_id   VARCHAR(36);
    DECLARE v_bus_num    VARCHAR(20);
    DECLARE v_seat_count INT;
    DECLARE v_cnt        INT;

    -- 번호판 생성용 변수
    DECLARE v_plate_type INT;
    DECLARE v_region     VARCHAR(10);
    DECLARE v_left2      VARCHAR(2);
    DECLARE v_mid_kr     VARCHAR(1);
    DECLARE v_last4      VARCHAR(4);

    -- ground 목록을 돌기 위한 커서
    DECLARE cur_ground CURSOR FOR
        SELECT ground_id
        FROM ground_list;

    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

    -- 커서 오픈
    OPEN cur_ground;

    ground_loop: LOOP
        -- ground 하나씩 가져오기
        FETCH cur_ground INTO v_ground_id;
        IF done = 1 THEN
            LEAVE ground_loop;
        END IF;

        -- 이 ground 에 대해 버스 10대 생성
        SET v_cnt = 1;
        WHILE v_cnt <= 10 DO

            -- 1) admin_id : admin_list 에서 랜덤으로 1명 선택
            SELECT admin_id
            INTO v_admin_id
            FROM admin_list
            ORDER BY RAND()
            LIMIT 1;

            -- 2) 좌석 수 (예시로 40 좌석 고정. 필요하면 랜덤으로 변경 가능)
            SET v_seat_count = 40;

            -- 3) 번호판 생성 (중복 방지를 위해 없을 때까지 반복)
            plate_loop: LOOP
                -- 두 자리 숫자 (10~99)
                SET v_left2 = LPAD(FLOOR(RAND() * 90) + 10, 2, '0');

                -- 네 자리 숫자 (1000~9999)
                SET v_last4 = LPAD(FLOOR(RAND() * 9000) + 1000, 4, '0');

                -- 한글 한 글자 (가, 나, 다, 라, 바 중 하나)
                SET v_mid_kr = CASE FLOOR(RAND() * 5)
                                 WHEN 0 THEN '가'
                                 WHEN 1 THEN '나'
                                 WHEN 2 THEN '다'
                                 WHEN 3 THEN '라'
                                 ELSE        '바'
                               END;

                -- 지역명 (서울, 부산, 대구, 인천, 경기 중 하나)
                SET v_region = CASE FLOOR(RAND() * 5)
                                 WHEN 0 THEN '서울'
                                 WHEN 1 THEN '부산'
                                 WHEN 2 THEN '대구'
                                 WHEN 3 THEN '인천'
                                 ELSE        '경기'
                               END;

                -- 형식 선택: 0 = "74주6586", 1 = "서울73바2805"
                SET v_plate_type = FLOOR(RAND() * 2);

                IF v_plate_type = 0 THEN
                    SET v_bus_num = CONCAT(v_left2, v_mid_kr, v_last4);
                ELSE
                    SET v_bus_num = CONCAT(v_region, v_left2, v_mid_kr, v_last4);
                END IF;

                -- 이미 존재하는 번호판이면 다시 생성
                IF NOT EXISTS (SELECT 1 FROM bus_list WHERE bus_num = v_bus_num) THEN
                    LEAVE plate_loop;
                END IF;
            END LOOP;

            -- 4) INSERT
            INSERT INTO bus_list (ground_id, bus_seat_count, admin_id, bus_num)
            VALUES (v_ground_id, v_seat_count, v_admin_id, v_bus_num);

            SET v_cnt = v_cnt + 1;
        END WHILE;
    END LOOP;

    CLOSE cur_ground;
END //

DELIMITER ;




------ procedure call ---------
CALL insert_dummy_bus();

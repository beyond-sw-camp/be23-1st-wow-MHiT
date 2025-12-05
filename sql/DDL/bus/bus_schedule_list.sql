CREATE TABLE bus_schedule_list(
    bs_s_id BIGINT NOT NULL auto_increment,
    bus_id BIGINT NOT NULL,
    admin_id VARCHAR(36) NOT NULL,
    game_id BIGINT NOT NULL,
    schedule_time    TIMESTAMP,
    PRIMARY KEY (bs_s_id),
    FOREIGN KEY (bus_id) REFERENCES bus_list (bus_id),
    FOREIGN KEY (admin_id) REFERENCES admin_list  (admin_id),
    FOREIGN KEY (game_id) REFERENCES game_schedule_list (game_id)
);
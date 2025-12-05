CREATE TABLE bus_res_list (
    bus_res_id BIGINT NOT NULL auto_increment,
    bs_s_id BIGINT,
    user_id VARCHAR(36) NOT NULL,
    bus_res_count INT,
    PRIMARY KEY (bus_res_id),
    FOREIGN KEY (bs_s_id) REFERENCES bus_schedule_list (bs_s_id),
    FOREIGN KEY (user_id) REFERENCES user_list (user_id)
);
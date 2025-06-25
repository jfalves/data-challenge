-- US Customers
CREATE TABLE if not exists customer_us (
    id INT PRIMARY KEY,
    name VARCHAR(255)
);

INSERT INTO customer_us (id, name) VALUES (1, 'Blake and Sons'),
										  (2, 'Henderson, Ramirez and Lewis'),
                                          (3, 'Garcia-James'),
                                          (4, 'Abbott-Munoz');

-- EU Customers
CREATE TABLE if not exists customer_eu (
    id INT PRIMARY KEY,
    name VARCHAR(255)
);

INSERT INTO customer_eu (id, name) VALUES (1, 'Rodriguez, Figueroa and Sanchez'),
                                          (2, 'Doyle Ltd'),
                                          (3, 'Mcclain, Miller and Henderson'),
                                          (4, 'Davis and Sons'),
                                          (5, 'Guzman, Hoffman and Baldwin'),
                                          (6, 'Gardner, Robinson and Lawrence');

-- Features
CREATE TABLE if not exists feature (
    id INT PRIMARY KEY,
    name VARCHAR(127),
    description TEXT
);

INSERT INTO feature (id, name, description) VALUES (1, 'Storage', 'File storage service'),
                                                   (2, 'API Access', 'REST API access'),
                                                   (3, 'Email Alerts', 'Automated email notifications'),
                                                   (4, 'Reporting', 'Advanced reporting dashboards'),
                                                   (5, 'User Management', 'Role-based access control'),
                                                   (6, 'Data Sync', 'Sync data across platforms');

-- Customer Account Settings
CREATE TABLE if not exists customer_account_settings (
    id INT PRIMARY KEY,
    customer_id INT,
    feature_id INT,
    country_code CHAR(2),
    limit_value INT,
    limit_unit VARCHAR(15)
);

INSERT INTO customer_account_settings (id, customer_id, feature_id, country_code, limit_value, limit_unit) VALUES (1, 1, 6, 'US', 350, 'syncs'),
                                                                                                                  (2, 1, 3, 'US', 328, 'emails'),
                                                                                                                  (3, 2, 6, 'US', 792, 'syncs'),
                                                                                                                  (4, 2, 1, 'US', 858, 'GB'),
                                                                                                                  (5, 3, 1, 'US', 130, 'GB'),
                                                                                                                  (6, 3, 5, 'US', 195, 'users'),
                                                                                                                  (7, 3, 4, 'US', 323, 'reports'),
                                                                                                                  (8, 3, 6, 'US', 338, 'syncs'),
                                                                                                                  (9, 4, 5, 'US', 765, 'users'),
                                                                                                                  (10, 4, 1, 'US', 818, 'GB'),
                                                                                                                  (11, 4, 2, 'US', 658, 'calls'),
                                                                                                                  (12, 4, 3, 'US', 529, 'emails'),
                                                                                                                  (13, 5, 4, 'US', 384, 'reports'),
                                                                                                                  (14, 5, 5, 'US', 928, 'users'),
                                                                                                                  (15, 6, 2, 'US', 448, 'calls'),
                                                                                                                  (16, 6, 4, 'US', 384, 'reports'),
                                                                                                                  (17, 1, 2, 'EU', 204, 'calls'),
                                                                                                                  (18, 1, 3, 'EU', 194, 'emails'),
                                                                                                                  (19, 2, 1, 'EU', 718, 'GB'),
                                                                                                                  (20, 2, 3, 'EU', 370, 'emails'),
                                                                                                                  (21, 2, 5, 'EU', 926, 'users'),
                                                                                                                  (22, 3, 6, 'EU', 649, 'syncs'),
                                                                                                                  (23, 3, 4, 'EU', 227, 'reports'),
                                                                                                                  (24, 4, 1, 'EU', 949, 'GB'),
                                                                                                                  (25, 4, 5, 'EU', 743, 'users'),
                                                                                                                  (26, 4, 3, 'EU', 733, 'emails');


-- Feature Usage Snapshots
CREATE TABLE feature_usage (
    customer_account_settings_id INT,
    usage_timestamp DATETIME,
    usage_value INT,
    usage_unit VARCHAR(50),
    PRIMARY KEY (customer_account_settings_id, usage_timestamp)
);

INSERT INTO feature_usage (customer_account_settings_id, usage_timestamp, usage_value, usage_unit) VALUES (1, '2025-06-01 00:00:00', 295, 'syncs'),
                                                                                                          (1, '2025-06-02 00:00:00', 98, 'syncs'),
                                                                                                          (1, '2025-06-03 00:00:00', 35, 'syncs'),
                                                                                                          (2, '2025-06-01 00:00:00', 116, 'emails'),
                                                                                                          (2, '2025-06-02 00:00:00', 148, 'emails'),
                                                                                                          (3, '2025-06-01 00:00:00', 238, 'syncs'),
                                                                                                          (3, '2025-06-02 00:00:00', 103, 'syncs'),
                                                                                                          (4, '2025-06-01 00:00:00', 284, 'GB'),
                                                                                                          (4, '2025-06-02 00:00:00', 464, 'GB'),
                                                                                                          (4, '2025-06-03 00:00:00', 650, 'GB'),
                                                                                                          (5, '2025-06-01 00:00:00', 410, 'GB'),
                                                                                                          (5, '2025-06-02 00:00:00', 94, 'GB'),
                                                                                                          (5, '2025-06-03 00:00:00', 100, 'GB'),
                                                                                                          (6, '2025-06-01 00:00:00', 171, 'users'),
                                                                                                          (6, '2025-06-02 00:00:00', 68, 'users'),
                                                                                                          (7, '2025-06-01 00:00:00', 311, 'reports'),
                                                                                                          (7, '2025-06-02 00:00:00', 87, 'reports'),
                                                                                                          (8, '2025-06-01 00:00:00', 983, 'syncs'),
                                                                                                          (8, '2025-06-02 00:00:00', 236, 'syncs'),
                                                                                                          (9, '2025-06-01 00:00:00', 276, 'users'),
                                                                                                          (9, '2025-06-02 00:00:00', 655, 'users'),
                                                                                                          (9, '2025-06-03 00:00:00', 704, 'users'),
                                                                                                          (10, '2025-06-01 00:00:00', 701, 'GB'),
                                                                                                          (10, '2025-06-02 00:00:00', 332, 'GB'),
                                                                                                          (11, '2025-06-01 00:00:00', 234, 'calls'),
                                                                                                          (11, '2025-06-02 00:00:00', 32, 'calls'),
                                                                                                          (12, '2025-06-01 00:00:00', 410, 'emails'),
                                                                                                          (12, '2025-06-02 00:00:00', 274, 'emails'),
                                                                                                          (12, '2025-06-03 00:00:00', 67, 'emails'),
                                                                                                          (13, '2025-06-01 00:00:00', 290, 'reports'),
                                                                                                          (13, '2025-06-02 00:00:00', 367, 'reports'),
                                                                                                          (14, '2025-06-01 00:00:00', 217, 'users'),
                                                                                                          (14, '2025-06-02 00:00:00', 671, 'users'),
                                                                                                          (14, '2025-06-03 00:00:00', 511, 'users'),
                                                                                                          (15, '2025-06-01 00:00:00', 329, 'calls'),
                                                                                                          (15, '2025-06-02 00:00:00', 234, 'calls'),
                                                                                                          (15, '2025-06-03 00:00:00', 73, 'calls'),
                                                                                                          (16, '2025-06-01 00:00:00', 71, 'reports'),
                                                                                                          (16, '2025-06-02 00:00:00', 126, 'reports'),
                                                                                                          (16, '2025-06-03 00:00:00', 381, 'reports'),
                                                                                                          (17, '2025-06-01 00:00:00', 191, 'calls'),
                                                                                                          (17, '2025-06-02 00:00:00', 149, 'calls'),
                                                                                                          (17, '2025-06-03 00:00:00', 109, 'calls'),
                                                                                                          (18, '2025-06-01 00:00:00', 92, 'emails'),
                                                                                                          (18, '2025-06-02 00:00:00', 56, 'emails'),
                                                                                                          (18, '2025-06-03 00:00:00', 35, 'emails'),
                                                                                                          (19, '2025-06-01 00:00:00', 93, 'GB'),
                                                                                                          (19, '2025-06-02 00:00:00', 48, 'GB'),
                                                                                                          (19, '2025-06-03 00:00:00', 112, 'GB'),
                                                                                                          (20, '2025-06-01 00:00:00', 321, 'emails'),
                                                                                                          (20, '2025-06-02 00:00:00', 81, 'emails'),
                                                                                                          (21, '2025-06-01 00:00:00', 610, 'users'),
                                                                                                          (21, '2025-06-02 00:00:00', 65, 'users'),
                                                                                                          (21, '2025-06-03 00:00:00', 394, 'users'),
                                                                                                          (22, '2025-06-01 00:00:00', 610, 'syncs'),
                                                                                                          (22, '2025-06-02 00:00:00', 479, 'syncs'),
                                                                                                          (22, '2025-06-03 00:00:00', 591, 'syncs'),
                                                                                                          (23, '2025-06-01 00:00:00', 141, 'reports'),
                                                                                                          (23, '2025-06-02 00:00:00', 220, 'reports'),
                                                                                                          (23, '2025-06-03 00:00:00', 2, 'reports'),
                                                                                                          (24, '2025-06-01 00:00:00', 698, 'GB'),
                                                                                                          (24, '2025-06-02 00:00:00', 906, 'GB'),
                                                                                                          (25, '2025-06-01 00:00:00', 656, 'users'),
                                                                                                          (25, '2025-06-02 00:00:00', 348, 'users'),
                                                                                                          (25, '2025-06-03 00:00:00', 114, 'users'),
                                                                                                          (26, '2025-06-01 00:00:00', 445, 'emails'),
                                                                                                          (26, '2025-06-02 00:00:00', 961, 'emails'),
                                                                                                          (26, '2025-06-03 00:00:00', 464, 'emails');

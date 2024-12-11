 show databases;

+-----------------------------------+
| Database                          |
+-----------------------------------+
| db                                |
| gundaya-j/labinisia-normalization |
| information_schema                |
| jaycath                           |
| labinisia                         |
| mysql                             |
| ofbsphp                           |
| performance_schema                |
| phpmyadmin                        |
| register                          |
| t                                 |
| test                              |
| ticket_booking                    |
| transactions                      |
| users                             |
+-----------------------------------+
15 rows in set (0.022 sec)

MariaDB [(none)]> use ticket_booking;
Database changed
MariaDB [ticket_booking]> show tables;
+--------------------------+
| Tables_in_ticket_booking |
+--------------------------+
| flight                   |
| passengers               |
| payment                  |
| ticket                   |
| users                    |
+--------------------------+
5 rows in set (0.007 sec)

MariaDB [ticket_booking]> desc flight;
+---------------+--------------+------+-----+---------+----------------+
| Field         | Type         | Null | Key | Default | Extra          |
+---------------+--------------+------+-----+---------+----------------+
| F_id          | int(11)      | NO   | PRI | NULL    | auto_increment |
| src           | varchar(20)  | NO   |     | NULL    |                |
| des           | varchar(20)  | NO   |     | NULL    |                |
| depart_time   | time         | NO   |     | NULL    |                |
| arrive_time   | time         | NO   |     | NULL    |                |
| depart_date   | date         | NO   |     | NULL    |                |
| arrive_date   | date         | NO   |     | NULL    |                |
| airplane_name | varchar(30)  | NO   |     | NULL    |                |
| noOfSeats     | int(11)      | NO   |     | NULL    |                |
| amount        | decimal(7,2) | NO   |     | NULL    |                |
+---------------+--------------+------+-----+---------+----------------+
10 rows in set (0.044 sec)

MariaDB [ticket_booking]> desc passengers;
+------------+---------------+------+-----+---------+----------------+
| Field      | Type          | Null | Key | Default | Extra          |
+------------+---------------+------+-----+---------+----------------+
| P_id       | int(11)       | NO   | PRI | NULL    | auto_increment |
| first_name | varchar(20)   | NO   | MUL | NULL    |                |
| last_name  | varchar(20)   | NO   |     | NULL    |                |
| Phone_No   | decimal(10,0) | NO   |     | NULL    |                |
+------------+---------------+------+-----+---------+----------------+
4 rows in set (0.011 sec)

MariaDB [ticket_booking]> desc payment;
+---------+----------------------------------------------------------+------+-----+---------+----------------+
| Field   | Type                                                     | Null | Key | Default | Extra          |
+---------+----------------------------------------------------------+------+-----+---------+----------------+
| P_id    | int(11)                                                  | NO   | PRI | NULL    | auto_increment |
| mode    | enum('credit card','debit card','netbanking','ewallets') | NO   |     | NULL    |                |
| amount  | decimal(7,2)                                             | NO   |     | NULL    |                |
| user_id | int(11)                                                  | NO   | MUL | NULL    |                |
+---------+----------------------------------------------------------+------+-----+---------+----------------+
4 rows in set (0.017 sec)

MariaDB [ticket_booking]> desc ticket;
+--------------+---------+------+-----+---------+----------------+
| Field        | Type    | Null | Key | Default | Extra          |
+--------------+---------+------+-----+---------+----------------+
| T_id         | int(11) | NO   | PRI | NULL    | auto_increment |
| passenger_id | int(11) | YES  | MUL | NULL    |                |
| flight_id    | int(11) | YES  | MUL | NULL    |                |
| payment_id   | int(11) | YES  | MUL | NULL    |                |
+--------------+---------+------+-----+---------+----------------+
4 rows in set (0.021 sec)

MariaDB [ticket_booking]> desc users;
+------------+-------------+------+-----+---------+----------------+
| Field      | Type        | Null | Key | Default | Extra          |
+------------+-------------+------+-----+---------+----------------+
| U_id       | int(11)     | NO   | PRI | NULL    | auto_increment |
| first_name | varchar(20) | NO   |     | NULL    |                |
| last_name  | varchar(20) | NO   |     | NULL    |                |
| phone_no   | int(11)     | NO   |     | NULL    |                |
| username   | varchar(50) | NO   | UNI | NULL    |                |
| password   | varchar(50) | NO   |     | NULL    |                |
| email_id   | varchar(50) | NO   | UNI | NULL    |                
+------------+-------------+------+-----+---------+----------------+
7 rows in set (0.040 sec)





insert into Flight (src, des, depart_time, arrive_time, depart_date, arrive_date, airplane_name, noOfSeats, amount) values ('Philippines', 'Thailand', '04:25:00', '06:40:00', '2024-11-27', '2024-11-30', 'Airbus A320neo', 160, 2199.00);
insert into Flight (src, des, depart_time, arrive_time, depart_date, arrive_date, airplane_name, noOfSeats, amount) values ('Philippines', 'Korea', '03:25:00', '05:40:00', '2024-12-10', '2024-12-10', 'Airbus A320neo', 160, 2199.00);
insert into Flight (src, des, depart_time, arrive_time, depart_date, arrive_date, airplane_name, noOfSeats, amount) values ('Canada', 'Philippins', '05:25:00', '12:00:00', '2024-12-11', '2024-12-12', 'Airbus A320neo', 155, 5199.00);
insert into Flight (src, des, depart_time, arrive_time, depart_date, arrive_date, airplane_name, noOfSeats, amount) values ('Philippines', 'Italy', '05:25:00', '12:00:00', '2025-1-11', '2025-1-11', 'Airbus A320neo', 165,    199.00);
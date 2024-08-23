----------- Project: Relational Database Design -----------


----- 1. Insert data into each of the above tables. With at least two rows in each of the tables. Make sure that you have created
----- respective foreign keys.
 CREATE TABLE Role (id INT PRIMARY KEY, role_name VARCHAR(100) )

INSERT INTO Role values 
(667,'Clerk'),
(668,'Staff'),
(669,'Analyst'),
(670,'Sales Person'),
(671,'Manager' ),
(672,'President')


CREATE TABLE User_has_role 
	(id INT PRIMARY KEY,role_start_time	TIME,role_end_time TIME DEFAULT NULL,
	user_account_id INT,
	role_id INT FOREIGN KEY REFERENCES Role(id)
	)

INSERT INTO User_has_role values
(122,'10:50:34','7:20:27',145,667 ),
(123,'0:10:44',NULL,146,668 ),
(124,'13:30:54','4:31:11',147,669 ),
(167,'2:51:04',NULL,148,670)


CREATE TABLE User_account 
	(id INT PRIMARY KEY,user_name VARCHAR(100),	email VARCHAR(254),password VARCHAR(200),
	password_salt VARCHAR(50) DEFAULT NULL,password_hash_algorithm VARCHAR(50) )

INSERT INTO User_account
SELECT 145,'SMITH','smith@cnn.com','dksjfl',NULL,'lo5fa0s9djfo' UNION ALL
SELECT 146,'ALLEN','allen@ubc.com','kosaid','923459ksdfe6','etw59ks54' UNION ALL
SELECT 147,'DOYLE','doyle@nbc.com','0jasdlfk',NULL,'sdf59ksdfjee' UNION ALL
SELECT 148,'DENNIS','dennis@got.com','j4r34ks','23459kssidouf','ksdfj7j'


ALTER TABLE User_has_role
ADD CONSTRAINT FK_User_account FOREIGN KEY (user_account_id) REFERENCES User_account(id)


CREATE TABLE Status (id INT PRIMARY KEY,status_name VARCHAR(100),is_user_working BINARY(1) )

INSERT INTO Status values
(11,'active',1 ),
 (45,'inactive',0 ),
(79,'dormant',0 ),
(113,'new',1)


CREATE TABLE User_has_status (id INT PRIMARY KEY,status_start_time TIME,status_end_time TIME DEFAULT NULL,
user_account_id INT FOREIGN KEY REFERENCES User_account(id), 
status_id INT FOREIGN KEY REFERENCES Status(id) )

INSERT INTO User_has_status
(88,'9:20:00','7:20:27',145,11 ),
(74,'2:10:12',NULL,146,45 ),
(60,'18:59:50','4:31:11',147,79 ),
(46,'11:49:28',NULL,148,113)


--------------------------------------------------
SELECT * FROM Role
SELECT * FROM Status
SELECT * FROM User_account
SELECT * FROM User_has_role
SELECT * FROM User_has_status
--------------------------------------------------


----- 2. Delete all the data from each of the tables.
TRUNCATE TABLE User_has_status
DELETE FROM Status WHERE id > 0

ALTER TABLE User_has_role
DROP CONSTRAINT FK_User_account

DELETE FROM User_account WHERE id > 0

DELETE FROM User_has_role WHERE id > 0

DELETE FROM Role WHERE id > 0

TRUNCATE table Role






DROP SCHEMA IF EXISTS foobar;
CREATE SCHEMA IF NOT EXISTS foobar;
USE foobar;

CREATE TABLE IF NOT EXISTS fb_user (
	user_id INT PRIMARY KEY AUTO_INCREMENT,
    isLoggedIn TINYINT(1) NOT NULL DEFAULT 0,
    user_name VARCHAR(45),
    user_password VARCHAR(45),
    user_first_name VARCHAR(45),
    user_last_name VARCHAR(45),
    user_email VARCHAR(45),
    user_mail_address TEXT,
    create_user_right TINYINT(1) DEFAULT 1,
    edit_user_right TINYINT(1) DEFAULT 1,
    delete_user_right TINYINT(1) DEFAULT 1,
    post_msg_right TINYINT(1) DEFAULT 1,
    view_msg_right TINYINT(1) DEFAULT 1,
    delete_msg_right TINYINT(1) DEFAULT 1
) engine = innoDB;

CREATE TABLE IF NOT EXISTS fb_message (
	msg_id INT PRIMARY KEY AUTO_INCREMENT,
    sender_id INT,
    msg_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    msg_body TEXT,
    receiver_id INT,
    sender_name VARCHAR(45),
    msg_subject VARCHAR(45),
    CONSTRAINT messagefk_1
    	FOREIGN KEY (sender_id)
    	REFERENCES fb_user(user_id)
    	ON UPDATE CASCADE
    	ON DELETE CASCADE,
    CONSTRAINT messagefk_2
    	FOREIGN KEY (receiver_id)
    	REFERENCES fb_user(user_id)
    	ON UPDATE CASCADE
    	ON DELETE CASCADE
) engine = innoDB;


DELIMITER $$

CREATE PROCEDURE validate_user(
	IN username VARCHAR(45),
	IN password VARCHAR(45)
)
BEGIN
	SELECT user_id 
	FROM fb_user
	WHERE user_name = username AND user_password = md5(password);
END$$

CREATE PROCEDURE get_user(
	IN userID INT
)
BEGIN
	SELECT user_id,user_name,user_first_name,user_last_name,user_email
			,create_user_right,edit_user_right,delete_user_right,post_msg_right
			,view_msg_right,delete_msg_right
	FROM fb_user
	WHERE user_id = userID;
END$$


CREATE PROCEDURE get_inbox(
	IN userID INT
)
BEGIN
	SELECT msg_id,sender_id,receiver_id,user_name AS sender_name,msg_date
			,msg_subject,msg_body
	FROM fb_user U INNER JOIN fb_message M ON U.user_id = M.sender_id
	WHERE M.receiver_id = userID
	ORDER BY msg_date DESC;
END$$


CREATE PROCEDURE get_recipient_list(
	IN userID INT
)
BEGIN
	SELECT user_id, user_name 
	FROM fb_user
	WHERE user_id != userID;
END$$


CREATE PROCEDURE send_message(
	IN sender INT,
    IN receiver INT,
    IN subject VARCHAR(45),
    IN body TEXT
)
BEGIN
	INSERT INTO fb_message(sender_id,receiver_id,msg_subject,msg_body)
		VALUES (sender,receiver,subject,body);
END$$


CREATE PROCEDURE delete_message(
	IN msg_ID INT
)
BEGIN
	DELETE FROM fb_message WHERE msgID = msg_ID;
END$$


CREATE PROCEDURE create_user(
	IN type INT,
    IN userName VARCHAR(45),
    IN userPassword VARCHAR(45),
    IN userFirstName VARCHAR(45),
    IN userLastName VARCHAR(45),
    IN userEmail VARCHAR(45),
    IN userMailAddress TEXT
)
BEGIN
INSERT INTO fb_user(user_name,user_password,user_first_name,user_last_name
					,user_email,user_mail_address) 
	VALUES (userName,md5(userPassword),userFirstName,userLastName,userEmail
			,userMailAddress);
END$$
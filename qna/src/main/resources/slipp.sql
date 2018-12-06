DROP TABLE IF EXISTS USERS;

CREATE TABLE USERS (
	userId			varchar(12)		NOT NULL,
	password		varchar(12)		NOT NULL,
	name			varchar(20)		NOT NULL,
	email			varchar(50),

	PRIMARY KEY					(userId)
);

INSERT INTO USERS VALUES('javajigi', 'password', '자바지기', 'javajigi@slipp.net');


select user_id, user_nm, user_pw
        from ams.tb_lock
        where user_id = #{user_id}

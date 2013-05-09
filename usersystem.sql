DROP DATABASE IF EXISTS usersystem;
CREATE DATABASE usersystem;
USE usersystem;

CREATE TABLE users(
	id INT UNSIGNED PRIMARY KEY,
	user VARCHAR(32) NOT NULL UNIQUE,
	pass VARCHAR(32) NOT NULL
)ENGINE = InnoDB;

CREATE TABLE logs(
	uid INT UNSIGNED,
	FOREIGN KEY(uid) REFERENCES users(id),
	ip INT UNSIGNED NOT NULL,
	attempts INT NOT NULL,
	PRIMARY KEY(uid, ip)
)ENGINE = InnoDB;

INSERT INTO users(id, user, pass)
VALUES	(1, "ivan", "password"),
	(2, "petar", "123456"),
	(3, "maria", "password");

INSERT INTO logs(uid, ip, attempts)
VALUES	(1, INET_ATON("1.1.1.1"), 66),
	(2, INET_ATON("1.1.1.1"), 20),
	(1, INET_ATON("2.2.2.2"), 10),
	(3, INET_ATON("2.2.2.2"), 30),
	(2, INET_ATON("3.3.3.3"), 1200);
	
	
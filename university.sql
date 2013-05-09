DROP DATABASE IF EXISTS university;
CREATE DATABASE university;

CREATE TABLE university.university(
	id TINYINT NOT NULL AUTO_INCREMENT,
	name VARCHAR(255) NOT NULL,
	founded DATE NULL DEFAULT NULL,
	PRIMARY KEY(id)
);

CREATE TABLE university.faculties(
	id TINYINT NOT NULL AUTO_INCREMENT UNIQUE,
	name VARCHAR(255),
	univ_id TINYINT NOT NULL,
	dekan_id INT NULL DEFAULT NULL UNIQUE,
	PRIMARY KEY(id),
	FOREIGN KEY(univ_id)
		REFERENCES university.university(id)
		ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE university.professors(
	id TINYINT NOT NULL AUTO_INCREMENT,
	firstname TINYINT NOT NULL,
	middlename TINYTEXT NULL,
	lastname TINYINT NOT NULL,
	phone VARCHAR(32) NULL,
	address TEXT NULL,
	EGN BIGINT(10) NOT NULL,
	faculty_id TINYINT NOT NULL,
	PRIMARY KEY(id),
	FOREIGN KEY(faculty_id)
		REFERENCES university.faculties(id)
		ON DELETE CASCADE ON UPDATE CASCADE
);

ALTER TABLE university.faculties
ADD CONSTRAINT FOREIGN KEY (dekan_id) REFERENCES professors(id);

CREATE TABLE university.subjects(
	id TINYINT NOT NULL AUTO_INCREMENT,
	name VARCHAR(255) NOT NULL,
	horarium_hr SMALLINT NOT NULL,
	lead_professor_id INT NOT NULL,
	PRIMARY KEY(id),
	FOREIGN KEY(lead_professor_id)
		REFERENCES university.professors(id)
		ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE university.students(
	firstname TINYINT NOT NULL,
	middlename NULL DEFAULT NULL,
	lastname TINYINT NOT NULL,
	phone VARCHAR(32) NULL DEFAULT NULL,
	address TEXT NULL DEFAULT NULL,
	faknum BIGINT(12) NOT NULL,
	PRIMARY KEY(faknum)
);

CREATE TABLE university.zapisani_studenti(
	student_fnum BIGINT(12) NOT NULL,
	subject_id TINYINT NOT NULL,
	FOREIGN KEY(student_fnum)
		REFERENCES university.students(faknum)
		ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY(subject_id)
		REFERENCES university.subjects(subject_id)
		ON DELETE CASCADE ON UPDATE CASCADE,
	PRIMARY KEY(student_fnum, subject_id)
);

CREATE TABLE university.zadochnici (
	student_fnum BIGINT( 12 ) NOT NULL ,
	firma VARCHAR( 255 ) NULL DEFAULT NULL ,
        FOREIGN KEY ( student_fnum )
		REFERENCES university.students( faknum )
		ON DELETE CASCADE ON UPDATE CASCADE,
        PRIMARY KEY( student_fnum )
);

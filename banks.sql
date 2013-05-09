CREATE DATABASE `banks`;

CREATE TABLE `banks`.`banks` (
	`code` INT NOT NULL AUTO_INCREMENT ,
	`name` VARCHAR( 255 ) NOT NULL ,
	`country` VARCHAR( 255 ) NOT NULL ,
	PRIMARY KEY ( `code` )
) ENGINE = InnoDB;

CREATE TABLE `banks`.`branches` (
	`id` TINYINT NOT NULL AUTO_INCREMENT ,
	`name` VARCHAR( 255 ) NOT NULL ,
	`address` VARCHAR( 255 ) NOT NULL ,
	`bank_code` INT NOT NULL ,
	PRIMARY KEY ( `id` ) ,
	FOREIGN KEY ( `bank_code` )
		REFERENCES `banks`.`banks`( `code` )
		ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB;

CREATE TABLE `banks`.`employees` (
	`id` INT NOT NULL AUTO_INCREMENT ,
	`name`  VARCHAR( 255 ) NOT NULL ,
	`branch_id` TINYINT NOT NULL,
	PRIMARY KEY ( `id` ),
	FOREIGN KEY ( `branch_id` )
		REFERENCES `banks`.`branches`( `id` )
		ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB;

CREATE TABLE `banks`.`customers` (
	`id` INT NOT NULL AUTO_INCREMENT ,
	`name` VARCHAR( 255 ) NOT NULL ,
	`address` VARCHAR( 255 ) NULL DEFAULT NULL ,
	`bank_mgr` INT NULL ,
	PRIMARY KEY ( `id` ) ,
	FOREIGN KEY ( `bank_mgr` )
		REFERENCES `banks`.`employees`( `id` )
) ENGINE = InnoDB;

CREATE TABLE `banks`.`accounts` (
	`id` INT NOT NULL AUTO_INCREMENT ,
	`amount` DECIMAL( 9,2 ) NOT NULL ,
	`type` TINYINT NOT NULL,
	`branch_id` TINYINT NOT NULL,
	`customer_id` INT NOT NULL,
	PRIMARY KEY ( `id` ),
	FOREIGN KEY ( `branch_id` )
		REFERENCES `banks`.`branches`( `id` )
		ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY ( `customer_id` )
		REFERENCES `banks`.`customers`( `id` )
		ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB;

USE banks;

INSERT INTO `banks` (`code` ,`name` ,`country`)
VALUES 	( NULL , 'Bulbank', 'Bulgaria' ),
	( NULL , 'Wells Fargo', 'USA' ),
	( NULL , 'Bank of America', 'USA' ),
	( NULL , 'Societe General', 'France' );

INSERT INTO `branches` (`id` ,`name` ,`address`, `bank_code`)
VALUES 	( NULL , 'Serdica', 'Sofia centar', 1 ),
	( NULL , 'Slatina', 'Sofia Geo Milev', 1 ),
	( NULL , 'Manhattan', 'Manhattan, New York', 2 ),
	( NULL , 'LA', 'Los Angeles', 3 ),
	( NULL , 'Paris', 'Paris', 4 ),
	( NULL , 'Marseilles', 'Marseilles', 4 );

INSERT INTO `employees` (`id` ,`name` , `branch_id`)
VALUES	( NULL , 'Ivan Ivanov', 1 ),
	( NULL , 'Ivan Stoianov', 1 ),
	( NULL , 'Mihail Zahariev', 1 ),
	( NULL , 'Milen Stoilov', 2 ),
	( NULL , 'Svilen Petrov', 2 ),
	( NULL , 'Ilian Stoianov', 2 ),
	( NULL , 'Petar Petrov', 2 ),
	( NULL , 'Jimmy Carter', 3 ),
	( NULL , 'John Smith', 3 ),
	( NULL , 'Mary Jane', 3 ),
	( NULL , 'James Pitt', 4 ),
	( NULL , 'Francoa Dupres', 5 ),
	( NULL , 'Alfonso Levi', 6 );

INSERT INTO `customers` (`id` ,`name` , `bank_mgr`)
VALUES	( NULL , 'Todor Ivanov', 1 ),
	( NULL , 'Petko Stoianov', 1 ),
	( NULL , 'Neno Nenov', 2 ),
	( NULL , 'Mariana Zaharieva', 3 ),
	( NULL , 'Elica Zaharieva', 3 ),
	( NULL , 'Atanas Petrov', 4 ),
	( NULL , 'Ivan Ivanov', 4 ),
	( NULL , 'Zlatomir Petrov', 4 ),
	( NULL , 'Mihail Ivchev', 5 ),
	( NULL , 'Todor Shtilianov', 6 ),
	( NULL , 'Ivailo Ivanov', 7 ),
	( NULL , 'George Lucas', 8 ),
	( NULL , 'George Harison', 8 ),
	( NULL , 'Michael Jackson', 8 ),
	( NULL , 'Tony Martin', 8 ),
	( NULL , 'Tony McCarter', 10 ),
	( NULL , 'Alexander Smith', 11 ),
	( NULL , 'Maria Smith', 11 ),
	( NULL , 'Alain Delrick', 12 ),
	( NULL , 'Devry Henry', 12 ),
	( NULL , 'Lenard Renne', 12 ),
	( NULL , 'Fontaine Rupert', 13 );

INSERT INTO `accounts` (`id` ,`amount` , `type` , `customer_id`, `branch_id`)
VALUES	( NULL , 156.38, 2, 1, 1 ),
	( NULL , 136.22, 1, 2, 1 ),
	( NULL , 42.98, 1, 3, 1 ),
	( NULL , 1236.33, 1, 4, 1 ),
	( NULL , 211.98, 2, 5, 1 ),
	( NULL , 1200.00, 2, 6, 2 ),
	( NULL , 133.48, 1, 7, 2 ),
	( NULL , 256.41, 2, 8, 2 ),
	( NULL , 1331.50, 2, 9, 2 ),
	( NULL , 116.88, 2, 10, 2 ),
	( NULL , 200.91, 1, 10, 2 ),
	( NULL , 99.18, 1, 11, 2 ),
	( NULL , 6712.52, 1, 12, 3 ),
	( NULL , 12000.56, 1, 12, 3 ),
	( NULL , 322.99, 2, 12, 3 ),
	( NULL , 991.63, 1, 13, 3 ),
	( NULL , 559.32, 2, 14, 3 ),
	( NULL , 680.13, 1, 15, 3 ),
	( NULL , 532.57, 1, 15, 3 ),
	( NULL , 402.26, 1, 16, 3 ),
	( NULL , 1536.91, 2, 17, 4 ),
	( NULL , 14921.43, 1, 18, 4 ),
	( NULL , 3910.50, 1, 19, 5 ),
	( NULL , 231.37, 1, 20, 5 ),
	( NULL , 7236.60, 1, 21, 5 ),
	( NULL , 2226.63, 2, 21, 5 ),
	( NULL , 500.00, 2, 22, 6 );
CREATE TABLE `oop`.`users` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `mssv` VARCHAR(45) NULL,
  `clazz` INT NULL,
  `dateDeleted` DATE NULL,
  `username` VARCHAR(45) NULL,
  `password` VARCHAR(45) NULL,
  `image` VARCHAR(45) NULL,
  `enabled` TINYINT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE);

CREATE TABLE `oop`.`role` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`id`));

CREATE TABLE `oop`.`product` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `sold` VARCHAR(45) NULL,
  `unSold` VARCHAR(45) NULL,
  `price` VARCHAR(45) NULL,
  `isDeleted` INT NULL,
  `image` VARCHAR(105) NULL,
  PRIMARY KEY (`id`));

CREATE TABLE `oop`.`noti` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(45) NULL,
  `content` VARCHAR(45) NULL,
  `seen` INT NULL,
  `link` VARCHAR(45) NULL,
  `date` VARCHAR(45) NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE);

CREATE TABLE `oop`.`news` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(45) NULL,
  `author` VARCHAR(45) NULL,
  `content` VARCHAR(45) NULL,
  `isDeleted` INT NULL,
  `date` VARCHAR(45) NULL,
  `image` VARCHAR(105) NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE);

CREATE TABLE `oop`.`mail` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `idUser` INT NULL,
  `isRead` VARCHAR(45) NULL,
  `content` VARCHAR(1000) NULL,
  `title` VARCHAR(45) NULL,
  `sender` VARCHAR(45) NULL,
  `receiver` VARCHAR(45) NULL,
  `date` VARCHAR(45) NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE);

CREATE TABLE `oop`.`item` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL DEFAULT NULL,
  `sold` VARCHAR(45) NULL DEFAULT NULL,
  `unSold` VARCHAR(45) NULL DEFAULT NULL,
  `price` VARCHAR(45) NULL DEFAULT NULL,
  `isDeleted` INT NULL DEFAULT NULL,
  `image` VARCHAR(105) NULL DEFAULT NULL,
  `quan` INT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE);

CREATE TABLE `oop`.`follow` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(45) NULL,
  `follower` VARCHAR(45) NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE);

CREATE TABLE `oop`.`comment` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `idNews` INT NULL,
  `idProduct` INT NULL,
  `content` VARCHAR(45) NULL,
  `sender` VARCHAR(45) NULL,
  `date` VARCHAR(45) NULL,
  PRIMARY KEY (`id`));

CREATE TABLE `oop`.`cart` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(45) NULL,
  `list` VARCHAR(45) NULL,
  `sum` VARCHAR(45) NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE);

CREATE TABLE `oop`.`bill` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(45) NULL,
  `list` VARCHAR(45) NULL,
  `sum` VARCHAR(45) NULL,
  `otp` VARCHAR(45) NULL,
  `list` VARCHAR(45) NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE);
  
CREATE TABLE `oop`.`users_roles` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `user` INT NULL,
  `role` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `_idx` (`user` ASC),
  INDEX `dfdf_idx` (`role` ASC),
  CONSTRAINT `user`
    FOREIGN KEY (`user`)
    REFERENCES `oop`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `role`
    FOREIGN KEY (`role`)
    REFERENCES `oop`.`role` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
    
INSERT INTO `oop`.`role` VALUES (1,'ROLE_ADMIN'),(2,'ROLE_USER');

INSERT INTO `oop`.`users_roles` VALUES (1,1,1),(2,1,2),(4,2,2);
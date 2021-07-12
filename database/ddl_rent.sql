SET FOREIGN_KEY_CHECKS=0; -- to disable 
CREATE TABLE IF NOT EXISTS `user` (
  `user_id` INT NOT NULL AUTO_INCREMENT,
  `password` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `age` INT NOT NULL,
  PRIMARY KEY (`user_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `admin` (
  `user_id` INT NOT NULL,
  PRIMARY KEY (`user_id`),
  CONSTRAINT `fk_Admin_User1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `brand` (
  `brand_id` INT NOT NULL AUTO_INCREMENT,
  `brand_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`brand_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `category` (
  `category_id` INT NOT NULL AUTO_INCREMENT,
  `category_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`category_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 10
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `vehicle` (
  `vehicle_id` INT NOT NULL AUTO_INCREMENT,
  `vehicle_name` VARCHAR(45) NOT NULL,
  `horse_power` VARCHAR(45) NOT NULL,
  `model_year` INT NOT NULL,
  `color` VARCHAR(45) NOT NULL,
  `image` VARCHAR(200) NOT NULL,
  `category_id` INT NOT NULL,
  `brand_id` INT NOT NULL,
  PRIMARY KEY (`vehicle_id`),
  CONSTRAINT `fk_Vehicle_Brand1`
    FOREIGN KEY (`brand_id`)
    REFERENCES `brand` (`brand_id`),
  CONSTRAINT `fk_Vehicle_Category`
    FOREIGN KEY (`category_id`)
    REFERENCES `category` (`category_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `location` (
  `location_id` INT NOT NULL AUTO_INCREMENT,
  `city` VARCHAR(45) NOT NULL,
  `district` VARCHAR(45) NOT NULL,
  `neighborhood` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`location_id`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `rent` (
  `rent_id` INT NOT NULL AUTO_INCREMENT,
  `price` INT NOT NULL,
  `contact_number` VARCHAR(15) NOT NULL,
  `vehicle_id` INT NOT NULL,
  `location_id` INT NOT NULL,
  PRIMARY KEY (`rent_id`),
  CONSTRAINT `fk_rent_vehicle1`
    FOREIGN KEY (`vehicle_id`)
    REFERENCES `vehicle` (`vehicle_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_rent_Location1`
    FOREIGN KEY (`location_id`)
    REFERENCES `location` (`location_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `created_rent` (
  `user_id` INT NOT NULL,
  `rent_id` INT NOT NULL,
  `create_time` DATETIME NOT NULL,
  PRIMARY KEY (`user_id`, `rent_id`),
  CONSTRAINT `fk_User_has_Rent_Rent1`
    FOREIGN KEY (`rent_id`)
    REFERENCES `rent` (`rent_id`),
  CONSTRAINT `fk_User_has_Rent_User1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`user_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `customer` (
  `user_id` INT NOT NULL,
  `points` INT NOT NULL,
  `vip` TINYINT(1) NOT NULL,
  PRIMARY KEY (`user_id`),
  CONSTRAINT `fk_Customer_User1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`user_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `order` (
  `order_id` INT NOT NULL AUTO_INCREMENT,
  `order_time` DATETIME NOT NULL,
  `end_time` DATETIME NOT NULL,
  `rent_id` INT NOT NULL,
  `ordered_user` INT NOT NULL,
  PRIMARY KEY (`order_id`),
  CONSTRAINT `fk_Order_Rent1`
    FOREIGN KEY (`rent_id`)
    REFERENCES `rent` (`rent_id`),
  CONSTRAINT `fk_order_user1`
    FOREIGN KEY (`ordered_user`)
    REFERENCES `user` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;
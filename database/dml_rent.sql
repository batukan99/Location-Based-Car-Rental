SET FOREIGN_KEY_CHECKS=0; -- to disable 
INSERT INTO  `brand` (`brand_id`, `brand_name`) VALUES ('1', 'Supra');
INSERT INTO  `brand` (`brand_id`, `brand_name`) VALUES ('2', 'Audi');
INSERT INTO  `brand` (`brand_id`, `brand_name`) VALUES ('3', 'Fiat');
INSERT INTO  `brand` (`brand_id`, `brand_name`) VALUES ('4', 'Ford');
INSERT INTO  `brand` (`brand_id`, `brand_name`) VALUES ('5', 'Citroen');
INSERT INTO  `brand` (`brand_id`, `brand_name`) VALUES ('6', 'Dacia');
INSERT INTO  `brand` (`brand_id`, `brand_name`) VALUES ('7', 'BMW');
INSERT INTO  `brand` (`brand_id`, `brand_name`) VALUES ('8', 'Hyundai');
INSERT INTO  `brand` (`brand_id`, `brand_name`) VALUES ('9', 'Ferrari');
INSERT INTO  `brand` (`brand_id`, `brand_name`) VALUES ('10', 'Renault');

INSERT INTO `category` (`category_id`, `category_name`) VALUES ('1', 'Sport');
INSERT INTO  `category` (`category_id`, `category_name`) VALUES ('2', 'Sedan');
INSERT INTO  `category` (`category_id`, `category_name`) VALUES ('3', 'SUV');
INSERT INTO  `category` (`category_id`, `category_name`) VALUES ('4', 'Motorcycle');
INSERT INTO  `category` (`category_id`, `category_name`) VALUES ('5', 'ATV');
INSERT INTO  `category` (`category_id`, `category_name`) VALUES ('6', 'Minivan');
INSERT INTO  `category` (`category_id`, `category_name`) VALUES ('7', 'Hatchback');
INSERT INTO  `category` (`category_id`, `category_name`) VALUES ('8', 'Coupé');
INSERT INTO  `category` (`category_id`, `category_name`) VALUES ('9', 'Truck');
INSERT INTO  `category` (`category_id`, `category_name`) VALUES ('10', 'Van');
INSERT INTO  `category` (`category_id`, `category_name`) VALUES ('11', 'Off-Road');

INSERT INTO  `vehicle` (`vehicle_id`, `vehicle_name`, `horse_power`, `model_year`, `color`, `image`, `category_id`, `brand_id`) VALUES ('1', 'Supra', '350Hp', '2020', 'Blue', 'https://raw.githubusercontent.com/batukan99/Location-Based-Car-Rental/master/images/supra.jpg', '1', '1');
INSERT INTO  `vehicle` (`vehicle_id`, `vehicle_name`, `horse_power`, `model_year`, `color`, `image`, `category_id`, `brand_id`) VALUES ('2', 'A3 Sportback', '350Hp', '2020', 'Blue', 'https://raw.githubusercontent.com/batukan99/Location-Based-Car-Rental/master/images/2020-audi-a3-sportback.jpg', '7', '2');
INSERT INTO  `vehicle` (`vehicle_id`, `vehicle_name`, `horse_power`, `model_year`, `color`, `image`, `category_id`, `brand_id`) VALUES ('3', 'Tourneo Custom', '400Hp', '2016', 'Orange', 'https://raw.githubusercontent.com/batukan99/Location-Based-Car-Rental/master/images/ford_torneo.jpg', '10', '4');
INSERT INTO  `vehicle` (`vehicle_id`, `vehicle_name`, `horse_power`, `model_year`, `color`, `image`, `category_id`, `brand_id`) VALUES ('4', 'T High', '290Hp', '2015', 'White', 'https://raw.githubusercontent.com/batukan99/Location-Based-Car-Rental/master/images/renault_t_highjpg.jpg', '9', '10');
INSERT INTO  `vehicle` (`vehicle_id`, `vehicle_name`, `horse_power`, `model_year`, `color`, `image`, `category_id`, `brand_id`) VALUES ('5', 'F 900XR', '380Hp', '2019', 'Red', 'https://raw.githubusercontent.com/batukan99/Location-Based-Car-Rental/master/images/BMW_MOTORcycle.jpg', '4', '7');
INSERT INTO  `vehicle` (`vehicle_id`, `vehicle_name`, `horse_power`, `model_year`, `color`, `image`, `category_id`, `brand_id`) VALUES ('6', 'C4', '330Hp', '2011', 'Water Green', 'URL ', 'https://raw.githubusercontent.com/batukan99/Location-Based-Car-Rental/master/images/Citroen-C4.jpg', '5');
INSERT INTO  `vehicle` (`vehicle_id`, `vehicle_name`, `horse_power`, `model_year`, `color`, `image`, `category_id`, `brand_id`) VALUES ('7', 'H1', '350Hp', '2020', 'Grey', 'https://raw.githubusercontent.com/batukan99/Location-Based-Car-Rental/master/images/hyundai_starex_3.jpg', '6', '8');
INSERT INTO  `vehicle` (`vehicle_id`, `vehicle_name`, `horse_power`, `model_year`, `color`, `image`, `category_id`, `brand_id`) VALUES ('8', 'Duster', '300Hp', '2017', 'Orange', 'https://raw.githubusercontent.com/batukan99/Location-Based-Car-Rental/master/images/dacia_duster.jpg', '3', '6');
INSERT INTO  `vehicle` (`vehicle_id`, `vehicle_name`, `horse_power`, `model_year`, `color`, `image`, `category_id`, `brand_id`) VALUES ('9', 'Roma', '350Hp', '2018', 'Blue', 'https://raw.githubusercontent.com/batukan99/Location-Based-Car-Rental/master/images/2021-ferrari-roma.jpg', '8', '9');
INSERT INTO  `vehicle` (`vehicle_id`, `vehicle_name`, `horse_power`, `model_year`, `color`, `image`, `category_id`, `brand_id`) VALUES ('10', 'ATV 200', '350Hp', '2019', 'Orange', 'https://raw.githubusercontent.com/batukan99/Location-Based-Car-Rental/master/images/atv_kanuni.jpg', '5', '3');
INSERT INTO  `vehicle` (`vehicle_id`, `vehicle_name`, `horse_power`, `model_year`, `color`, `image`, `category_id`, `brand_id`) VALUES ('11', 'Hilux', '400Hp', '2016', 'Red', 'https://raw.githubusercontent.com/batukan99/Location-Based-Car-Rental/master/images/toyota-hilux.jpg', '11', '1');

INSERT INTO  `user` (`user_id`, `password`, `email`, `username`, `age`) VALUES ('1', 'a', 'admin.official@hotmail.com', 'admin', '21');
INSERT INTO  `user` (`user_id`, `password`, `email`, `username`, `age`) VALUES ('2', '257', 'ibrahim.donmez@hotmail.com', 'İbrahim1', '28');
INSERT INTO  `user` (`user_id`, `password`, `email`, `username`, `age`) VALUES ('3', '345', 'memduh.guler@hotmail.com', 'Memduh', '45');
INSERT INTO  `user` (`user_id`, `password`, `email`, `username`, `age`) VALUES ('4', '678', 'ayse.caliskan@hotmail.com', 'Ayse1', '35');
INSERT INTO  `user` (`user_id`, `password`, `email`, `username`, `age`) VALUES ('5', '987', 'guler.cubuk@hotmail.com', 'Guler', '56');
INSERT INTO  `user` (`user_id`, `password`, `email`, `username`, `age`) VALUES ('6', '567', 'mehmet.surer@hotmail.com', 'Mehmett', '39');
INSERT INTO  `user` (`user_id`, `password`, `email`, `username`, `age`) VALUES ('7', '456', 'lale.onat@hotmail.com', 'Lale323', '36');
INSERT INTO  `user` (`user_id`, `password`, `email`, `username`, `age`) VALUES ('8', '178', 'batukan.karatas@hotmail.com', 'Batuk', '22');
INSERT INTO  `user` (`user_id`, `password`, `email`, `username`, `age`) VALUES ('9', '490', 'asli.findik@hotmail.com', 'Aslii', '22');

INSERT INTO `admin` (`user_id`) VALUES ('1');
INSERT INTO  `customer` (`user_id`, `points`, `vip`) VALUES ('2', '0', '0');
INSERT INTO  `customer` (`user_id`, `points`, `vip`) VALUES ('3', '0', '0');
INSERT INTO  `customer` (`user_id`, `points`, `vip`) VALUES ('4', '0', '0');
INSERT INTO  `customer` (`user_id`, `points`, `vip`) VALUES ('5', '0', '0');
INSERT INTO  `customer` (`user_id`, `points`, `vip`) VALUES ('6', '0', '0');
INSERT INTO  `customer` (`user_id`, `points`, `vip`) VALUES ('7', '0', '0');
INSERT INTO  `customer` (`user_id`, `points`, `vip`) VALUES ('8', '0', '0');
INSERT INTO  `customer` (`user_id`, `points`, `vip`) VALUES ('9', '0', '0');

INSERT INTO  `location` (`location_id`, `city`, `district`, `neighborhood`) VALUES ('1', 'Sivas', 'Gemerek', 'Yeniçubuk');
INSERT INTO  `location` (`location_id`, `city`, `district`, `neighborhood`) VALUES ('2', 'Ankara', 'Çankaya', 'Kızılay');
INSERT INTO  `location` (`location_id`, `city`, `district`, `neighborhood`) VALUES ('3', 'İstanbul', 'Tuzla', 'Taşkışla');
INSERT INTO  `location` (`location_id`, `city`, `district`, `neighborhood`) VALUES ('4', 'İstanbul', 'Beşiktaş', 'Osmanbey');
INSERT INTO  `location` (`location_id`, `city`, `district`, `neighborhood`) VALUES ('5', 'İzmir', 'Konak', 'Özkanlar');
INSERT INTO  `location` (`location_id`, `city`, `district`, `neighborhood`) VALUES ('6', 'Kayseri', 'Talas', 'Mevlana');
INSERT INTO  `location` (`location_id`, `city`, `district`, `neighborhood`) VALUES ('7', 'Manisa', 'Akhisar', 'Ahmetli');
INSERT INTO  `location` (`location_id`, `city`, `district`, `neighborhood`) VALUES ('8', 'Kahramanmaraş', 'Elbistan', 'Güneşli');
INSERT INTO  `location` (`location_id`, `city`, `district`, `neighborhood`) VALUES ('9', 'Erzurum', 'Horasan', 'Çat');
INSERT INTO  `location` (`location_id`, `city`, `district`, `neighborhood`) VALUES ('10', 'Samsun', 'Bafra', 'Canik');

INSERT INTO  `rent` (`rent_id`, `price`, `contact_number`, `vehicle_id`, `location_id`) VALUES ('1', '325', '0555 755 7555', '1', '1');
INSERT INTO  `rent` (`rent_id`, `price`, `contact_number`, `vehicle_id`, `location_id`) VALUES ('2', '450', '0572 884 7454', '2', '2');
INSERT INTO  `rent` (`rent_id`, `price`, `contact_number`, `vehicle_id`, `location_id`) VALUES ('3', '300', '0522 674 2256', '3', '3');
INSERT INTO  `rent` (`rent_id`, `price`, `contact_number`, `vehicle_id`, `location_id`) VALUES ('4', '700', '0532 578 6892', '4', '4');
INSERT INTO  `rent` (`rent_id`, `price`, `contact_number`, `vehicle_id`, `location_id`) VALUES ('5', '580', '0534 865 4556', '5', '5');
INSERT INTO  `rent` (`rent_id`, `price`, `contact_number`, `vehicle_id`, `location_id`) VALUES ('6', '420', '0542 844 4750', '6', '6');
INSERT INTO  `rent` (`rent_id`, `price`, `contact_number`, `vehicle_id`, `location_id`) VALUES ('7', '390', '0532 894 7456', '7', '7');
INSERT INTO  `rent` (`rent_id`, `price`, `contact_number`, `vehicle_id`, `location_id`) VALUES ('8', '400', '0539 564 5678', '8', '8');
INSERT INTO  `rent` (`rent_id`, `price`, `contact_number`, `vehicle_id`, `location_id`) VALUES ('9', '660', '0545 324 7516', '9', '9');
INSERT INTO  `rent` (`rent_id`, `price`, `contact_number`, `vehicle_id`, `location_id`) VALUES ('10', '600', '0561 894 7456', '10', '10');

INSERT INTO  `order` (`order_id`, `order_time`, `end_time`, `rent_id`, `ordered_user`) VALUES ('1', '2021-05-14 01:00:00', '2021-05-16 02:00:00', '1', '4');
INSERT INTO  `order` (`order_id`, `order_time`, `end_time`, `rent_id`, `ordered_user`) VALUES ('2', '2021-05-17 02:00:00', '2021-05-18 02:00:00', '2', '4');
INSERT INTO  `order` (`order_id`, `order_time`, `end_time`, `rent_id`, `ordered_user`) VALUES ('3', '2021-04-15 01:30:00', '2021-04-17 01:30:00', '3', '5');
INSERT INTO  `order` (`order_id`, `order_time`, `end_time`, `rent_id`, `ordered_user`) VALUES ('4', '2021-02-12 01:00:00', '2021-02-14 01:00:00', '4', '6');
INSERT INTO  `order` (`order_id`, `order_time`, `end_time`, `rent_id`, `ordered_user`) VALUES ('5', '2021-01-22 05:00:00', '2021-01-24 05:00:00', '5', '7');
INSERT INTO  `order` (`order_id`, `order_time`, `end_time`, `rent_id`, `ordered_user`) VALUES ('6', '2021-05-15 01:00:00', '2021-05-17 01:00:00', '6', '8');
INSERT INTO  `order` (`order_id`, `order_time`, `end_time`, `rent_id`, `ordered_user`) VALUES ('7', '2021-03-27 03:00:00', '2021-03-29 03:00:00', '7', '9');
INSERT INTO  `order` (`order_id`, `order_time`, `end_time`, `rent_id`, `ordered_user`) VALUES ('8', '2021-04-19 01:20:00', '2021-04-20 01:20:00', '8', '10');
INSERT INTO  `order` (`order_id`, `order_time`, `end_time`, `rent_id`, `ordered_user`) VALUES ('9', '2021-04-17 06:00:00', '2021-04-19 06:00:00', '9', '2');
INSERT INTO  `order` (`order_id`, `order_time`, `end_time`, `rent_id`, `ordered_user`) VALUES ('10', '2021-03-25 06:00:00', '2021-03-26 06:00:00', '10', '3'); 

INSERT INTO  `created_rent` (`user_id`, `rent_id`, `create_time`) VALUES ('2', '1', '2021-05-17 04:00:00');
INSERT INTO  `created_rent` (`user_id`, `rent_id`, `create_time`) VALUES ('3', '2', '2021-05-15 02:00:00');
INSERT INTO  `created_rent` (`user_id`, `rent_id`, `create_time`) VALUES ('4', '3', '2021-04-13 01:30:00');
INSERT INTO  `created_rent` (`user_id`, `rent_id`, `create_time`) VALUES ('5', '4', '2021-02-10 01:00:00');
INSERT INTO  `created_rent` (`user_id`, `rent_id`, `create_time`) VALUES ('6', '5', '2021-01-20 05:00:00');
INSERT INTO  `created_rent` (`user_id`, `rent_id`, `create_time`) VALUES ('7', '6', '2021-05-13 01:00:00');
INSERT INTO  `created_rent` (`user_id`, `rent_id`, `create_time`) VALUES ('8', '7', '2021-03-25 03:00:00');
INSERT INTO  `created_rent` (`user_id`, `rent_id`, `create_time`) VALUES ('9', '8', '2021-04-18 01:20:00');
INSERT INTO  `created_rent` (`user_id`, `rent_id`, `create_time`) VALUES ('10', '9', '2021-04-13 06:00:00');

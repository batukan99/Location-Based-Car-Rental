class User {
  //User model that will be used to keep details of users
  int user_id;
  int age;
  String name;
  String password;
  String email;
  // String level;
  // String number;
  // String address;
  User(
      {required this.user_id,
      required this.name,
      required this.password,
      required this.email,
      required this.age});

  factory User.fromJson(Map<dynamic, dynamic> json) {
    return User(
      user_id: int.parse(json['user_id']),
      age: int.parse(json['age']),
      name: json['username'] as String,
      password: json['password'] as String,
      email: json['email'] as String,
      //level: json['level'] as String,
      //number: json['number'] as String,
      //address: json['address'] as String,
    );
  }
}

class Admin {
  //Admin model that will be used to keep details of Admin
  int user_id;

  Admin({required this.user_id});

  factory Admin.fromJson(Map<dynamic, dynamic> json) {
    return Admin(
      user_id: int.parse(json['user_id']),
    );
  }
}

class Customer {
  //Customer model that hold customer information
  int user_id;
  int points;
  int vip;

  Customer({required this.user_id, required this.points, required this.vip});

  factory Customer.fromJson(Map<dynamic, dynamic> json) {
    return Customer(
        user_id: int.parse(json['user_id']),
        points: int.parse(json['points']),
        vip: int.parse(json['vip']));
  }
}

class Rent {
  //Rent model that will be used to keep details of rents
  int rent_id;
  String price;
  String contact_number;
  int vehicle_id;
  int location_id;
  Rent(
      {required this.rent_id,
      required this.price,
      required this.contact_number,
      required this.vehicle_id,
      required this.location_id});

  factory Rent.fromJson(Map<dynamic, dynamic> json) {
    return Rent(
      rent_id: int.parse(json['rent_id']),
      price: json['price'] as String,
      contact_number: json['contact_number'] as String,
      vehicle_id: int.parse(json['vehicle_id']),
      location_id: int.parse(json['location_id']),
    );
  }
}

class Created_Rent {
  //Created_Rent model that will be used to keep relation details between User and Rent
  int user_id;
  int rent_id;
  String create_time;
  Created_Rent(
      {required this.user_id,
      required this.rent_id,
      required this.create_time});

  factory Created_Rent.fromJson(Map<dynamic, dynamic> json) {
    return Created_Rent(
      user_id: int.parse(json['user_id']),
      rent_id: int.parse(json['rent_id']),
      create_time: json['create_time'] as String,
    );
  }
}

class Vehicle {
  //Vehicle model that will be used to keep details of vehicles
  int vehicle_id;
  String vehicle_name;
  String horse_power;
  int model_year;
  String color;
  String image;
  int category_id;
  int brand_id;

  Vehicle(
      {required this.vehicle_id,
      required this.vehicle_name,
      required this.horse_power,
      required this.model_year,
      required this.color,
      required this.image,
      required this.category_id,
      required this.brand_id});

  factory Vehicle.fromJson(Map<dynamic, dynamic> json) {
    return Vehicle(
      vehicle_id: int.parse(json['vehicle_id']),
      vehicle_name: json['vehicle_name'] as String,
      horse_power: json['horse_power'] as String,
      model_year: int.parse(json['model_year']),
      color: json['color'] as String,
      image: json['image'] as String,
      category_id: int.parse(json['category_id']),
      brand_id: int.parse(json['brand_id']),
    );
  }
}

class Location {
  //Location model that will be used to keep details of Location
  int location_id;
  String city;
  String district;
  String neighborhood;

  Location(
      {required this.location_id,
      required this.city,
      required this.district,
      required this.neighborhood});

  factory Location.fromJson(Map<dynamic, dynamic> json) {
    return Location(
      location_id: int.parse(json['location_id']),
      city: json['city'] as String,
      district: json['district'] as String,
      neighborhood: json['color'] as String,
    );
  }
}

class Order {
  //Order
  int order_id;
  String order_time;
  String end_time;
  int rent_id;
  int ordered_user;

  Order(
      {required this.order_id,
      required this.order_time,
      required this.end_time,
      required this.rent_id,
      required this.ordered_user});

  factory Order.fromJson(Map<dynamic, dynamic> json) {
    return Order(
      order_id: int.parse(json['order_id']),
      order_time: json['order_time'] as String,
      end_time: json['end_time'] as String,
      rent_id: int.parse(json['rent_id']),
      ordered_user: int.parse(json['ordered_user']),
    );
  }
}

class Brand {
  //Brand model that will be used to keep details of Brand
  int brand_id;
  String brand_name;

  Brand({
    required this.brand_id,
    required this.brand_name,
  });

  factory Brand.fromJson(Map<dynamic, dynamic> json) {
    return Brand(
      brand_id: int.parse(json['brand_id']),
      brand_name: json['brand_name'] as String,
    );
  }
}

class Category {
  //Category model that will be used to keep details of Category
  int category_id;
  String category_name;

  Category({
    required this.category_id,
    required this.category_name,
  });

  factory Category.fromJson(Map<dynamic, dynamic> json) {
    return Category(
      category_id: int.parse(json['category_id']),
      category_name: json['category_name'] as String,
    );
  }
}

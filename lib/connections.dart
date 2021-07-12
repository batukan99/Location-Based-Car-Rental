import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/gestures.dart';
import 'models.dart';
import 'main.dart';

String url = "http://192.168.1.6/rental/server.php";

List<User> parseUsers(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<dynamic, dynamic>>();
  return parsed.map<User>((json) => User.fromJson(json)).toList();
}

List<Rent> parseRents(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<dynamic, dynamic>>();
  return parsed.map<Rent>((json) => Rent.fromJson(json)).toList();
}

List<Order> parseOrders(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<dynamic, dynamic>>();
  return parsed.map<Order>((json) => Order.fromJson(json)).toList();
}

List<Created_Rent> parseCreatedRents(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<dynamic, dynamic>>();
  return parsed
      .map<Created_Rent>((json) => Created_Rent.fromJson(json))
      .toList();
}

List<Vehicle> parseVehicles(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<dynamic, dynamic>>();
  return parsed.map<Vehicle>((json) => Vehicle.fromJson(json)).toList();
}

List<Brand> parseBrands(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<dynamic, dynamic>>();
  return parsed.map<Brand>((json) => Brand.fromJson(json)).toList();
}

List<Category> parseCategory(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<dynamic, dynamic>>();
  return parsed.map<Category>((json) => Category.fromJson(json)).toList();
}

List<Location> parseLocations(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<dynamic, dynamic>>();
  return parsed.map<Location>((json) => Location.fromJson(json)).toList();
}

Future<String> login(String user, String pass, context) async {
  final response = await http.post(Uri.parse(url), body: {
    "action": "Login",
    "username": user,
    "password": pass,
  });
  if (response.body == "success") {
    //user exist and succesfully logined
    String get = await getUser(user, pass);
    if (get == "success")
      Navigator.pushNamed(context, 'home'); //redirect home page
  } else {
    //there is an error
    print("Username or password is incorrect");
    final snackBar =
        SnackBar(content: Text('Username or password is incorrect!'));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
  return "success";
}

//communicate with database to create a new user with details entered
Future<String> register(
    String user, String pass, String mail, String age, context) async {
  final response = await http.post(Uri.parse(url), body: {
    "action": "Register",
    "username": user,
    "password": pass,
    "email": mail,
    "age": age,
    //"level":"member",//all registered users will be member, not admin
    //"number":number.text,
    //"address":address.text,
  });
  if (response.body == "success") {
    //operation successfull, get the user and go to home page
    String get = await getUser(user, pass);
    if (get == "success") Navigator.pushNamed(context, 'home');
  } else {
    //otherwise show errors
    final snackBar = SnackBar(content: Text(response.body));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
  return (response.body);
}

Future<String> update_user(
    String user, String pass, String mail, String age, context) async {
  final response = await http.post(Uri.parse(url), body: {
    "action": "Update_User",
    "id": myUser.user_id.toString(),
    "oldUsername": myUser.name, //old username of user
    "oldMail": myUser
        .email, //old mail of user, these will be necessary for comparing between other users
    "username": user,
    "password": pass,
    "email": mail,
    "age": age,
  });
  if (response.body == "success") {
    //updated succesfully
    final snackBar = SnackBar(content: Text('Details updated succesfully!'));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  } else {
    //there is an error, show it to user
    final snackBar = SnackBar(content: Text(response.body));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
  print(response.body);
  return (response.body);
}

//get all users from the database
Future<List<User>> list_users() async {
  final response = await http.post(Uri.parse(url), body: {
    "action": "List_Users",
  });
  List<User> Users = parseUsers(response.body);
  users = Users;
  return Users;
}

//This will be used to get user as User model after login or register page
Future<String> getUser(String u, String p) async {
  final response = await http.post(Uri.parse(url), body: {
    "action": "Get",
    "username": u,
    "password": p,
  });
  List<User> users = parseUsers(response.body);
  myUser = users[0];
  return "success";
}

//get all rents from the database
Future<List<Rent>> list_rents() async {
  final response = await http.post(Uri.parse(url), body: {
    "action": "List_Rents",
  });
  List<Rent> Rents = parseRents(response.body);
  rents = Rents;
  return Rents;
}

//get all created rents from the database
Future<List<Created_Rent>> list_created_rents() async {
  final response = await http.post(Uri.parse(url), body: {
    "action": "List_Created_Rents",
  });
  List<Created_Rent> C_Rents = parseCreatedRents(response.body);
  c_rents = C_Rents;
  return C_Rents;
}

//get all vehicles from the database
Future<List<Vehicle>> list_vehicles() async {
  final response = await http.post(Uri.parse(url), body: {
    "action": "List_Vehicles",
  });
  List<Vehicle> v = parseVehicles(response.body);
  vehicles = v;
  return v;
}

//get all locations from the database
Future<List<Location>> list_locations() async {
  final response = await http.post(Uri.parse(url), body: {
    "action": "List_Locations",
  });
  List<Location> l = parseLocations(response.body);
  locations = l;
  return l;
}

//get all categories from the database
Future<List<Category>> list_categories() async {
  final response = await http.post(Uri.parse(url), body: {
    "action": "List_Categories",
  });
  List<Category> Cat = parseCategory(response.body);
  List<String> s = [];
  for (int i = 0; i < Cat.length; i++) {
    s.add(Cat[i].category_name);
  }
  categories = s;
  return Cat;
}

//get all brands from the database
Future<List<Brand>> list_brands() async {
  final response = await http.post(Uri.parse(url), body: {
    "action": "List_Brands",
  });
  List<Brand> br = parseBrands(response.body);
  List<String> s = [];
  for (int i = 0; i < br.length; i++) {
    s.add(br[i].brand_name);
  }
  brands = s;
  return br;
}

Future<List<Rent>> listRentsFiltered(String _filter, String _sort) async {
  final response = await http.post(Uri.parse(url), body: {
    "action": "List_Rents_Filtered",
    "filter": _filter,
    "sort": _sort,
  });
  List<Rent> _Rents = parseRents(response.body);
  rents = _Rents;
  return _Rents;
}

Future<List<Rent>> listRentsSorted(String _sort) async {
  final response = await http.post(Uri.parse(url),
      body: {"action": "List_Rents_Sorted", "sort": _sort});
  List<Rent> Rents = parseRents(response.body);
  rents = Rents;
  return Rents;
}

//find the created_rent by corresponding rent_id
Future<Created_Rent> getCreatedRent(int id) async {
  final response = await http.post(Uri.parse(url), body: {
    "action": "Get_Created_Rent",
    "rent_id": id.toString(),
  });
  List<Created_Rent> v = parseCreatedRents(response.body);
  return v[0];
}

//find the rent location by corresponding rent_id
Future<Location> getRentLocation(int id) async {
  final response = await http.post(Uri.parse(url), body: {
    "action": "Get_Rent_Location",
    "rent_id": id.toString(),
  });
  List<Location> v = parseLocations(response.body);
  return v[0];
}

//find the vehicle brand by corresponding vehicle_id
Future<Brand> getVehicleBrand(int id) async {
  final response = await http.post(Uri.parse(url), body: {
    "action": "Get_Vehicle_Brand",
    "vehicle_id": id.toString(),
  });
  List<Brand> v = parseBrands(response.body);
  return v[0];
}

//find the vehicle category by corresponding vehicle_id
Future<Category> getVehicleCategory(int id) async {
  final response = await http.post(Uri.parse(url), body: {
    "action": "Get_Vehicle_Category",
    "vehicle_id": id.toString(),
  });
  List<Category> v = parseCategory(response.body);
  return v[0];
}

//find the category_id by corresponding category_name
Future<Category> getCategory_id(String category_name) async {
  final response = await http.post(Uri.parse(url), body: {
    "action": "Get_Category_id",
    "category_name": category_name,
  });
  List<Category> v = parseCategory(response.body);
  return v[0];
}

//find the brand_id by corresponding brand_name
Future<Brand> getBrand_id(String brand_name) async {
  final response = await http.post(Uri.parse(url), body: {
    "action": "Get_Brand_id",
    "brand_name": brand_name,
  });
  List<Brand> v = parseBrands(response.body);
  return v[0];
}

//find the vehicle by corresponding vehicle_id
Future<Vehicle> get_vehicle_with_ID(int id) async {
  final response = await http.post(Uri.parse(url), body: {
    "action": "Get_Vehicle_With_ID",
    "vehicle_id": id.toString(),
  });
  List<Vehicle> v = parseVehicles(response.body);
  return v[0];
}

//find the rent by corresponding rent_id
Future<Rent> get_rent_with_ID(int id) async {
  final response = await http.post(Uri.parse(url), body: {
    "action": "Get_Rent_With_ID",
    "rent_id": id.toString(),
  });
  List<Rent> v = parseRents(response.body);
  return v[0];
}

//get all rents of a user from the database
Future<List<Rent>> list_user_rents(int id) async {
  final response = await http.post(Uri.parse(url), body: {
    "action": "List_User_Rents",
    "id": id.toString(),
  });
  List<Rent> Rents = parseRents(response.body);
  if (response.body == "error") {
    print("error");
  }
  rents = Rents;
  return Rents;
}

//get all orders of a user from the database
Future<List<Order>> list_user_orders(int ordered_user) async {
  final response = await http.post(Uri.parse(url), body: {
    "action": "List_User_Orders",
    "ordered_user": ordered_user.toString(),
  });
  List<Order> Orders = parseOrders(response.body);
  orders = Orders;
  return Orders;
}

//communicate with database to create a new rent with details entered
Future<String> create_rent(
    String image,
    int category_id,
    int brand_id,
    String vehicle_name,
    int model_year,
    String color,
    String horse_power,
    String city,
    String district,
    String neighborhood,
    String contact_number,
    int price,
    int user_id,
    context) async {
  final response = await http.post(Uri.parse(url), body: {
    "action": "Create_Rent",
    "image": image,
    "category_id": category_id.toString(),
    "brand_id": brand_id.toString(),
    "vehicle_name": vehicle_name,
    "model_year": model_year.toString(),
    "color": color,
    "horse_power": horse_power,
    "city": city,
    "district": district,
    "neighborhood": neighborhood,
    "contact_number": contact_number,
    "price": price.toString(),
    "user_id": user_id.toString(),
  });
  if (response.body == "success") {
    final snackBar = SnackBar(content: Text("Listing Successfuly Created!"));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  } else {
    final snackBar = SnackBar(content: Text(response.body));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
  return (response.body);
}

//communicate with database to update the rent with details entered
Future<String> update_rent(
    int rent_id,
    int vehicle_id,
    int location_id,
    String image,
    int category_id,
    int brand_id,
    String vehicle_name,
    int model_year,
    String color,
    String horse_power,
    String city,
    String district,
    String neighborhood,
    String contact_number,
    int price,
    context) async {
  final response = await http.post(Uri.parse(url), body: {
    "action": "Update_Rent",
    "rent_id": rent_id.toString(),
    "vehicle_id": vehicle_id.toString(),
    "location_id": location_id.toString(),
    "image": image,
    "category_id": category_id.toString(),
    "brand_id": brand_id.toString(),
    "vehicle_name": vehicle_name,
    "model_year": model_year.toString(),
    "color": color,
    "horse_power": horse_power,
    "city": city,
    "district": district,
    "neighborhood": neighborhood,
    "contact_number": contact_number,
    "price": price.toString(),
  });
  if (response.body == "success") {
    final snackBar = SnackBar(content: Text("Listing Successfuly Updated!"));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  } else {
    final snackBar = SnackBar(content: Text(response.body));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
  return (response.body);
}

//Delete the rent by corresponding rent_id
Future<String> deleteRent(int id, context) async {
  final response = await http.post(Uri.parse(url), body: {
    "action": "Delete_Rent",
    "rent_id": id.toString(),
  });
  if (response.body == "success") {
    final snackBar = SnackBar(content: Text("Listing Successfuly Deleted!"));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  } else {
    final snackBar = SnackBar(content: Text(response.body));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
  return (response.body);
}

//Delete the order by corresponding order_id
Future<String> deleteOrder(int id, context) async {
  final response = await http.post(Uri.parse(url), body: {
    "action": "Delete_Order",
    "order_id": id.toString(),
  });
  if (response.body == "success") {
    final snackBar = SnackBar(content: Text("Order Successfuly Deleted!"));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  } else {
    final snackBar = SnackBar(content: Text(response.body));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
  return (response.body);
}

//Delete the vehicle by corresponding vehicle_id
Future<String> deleteVehicle(int id, context) async {
  final response = await http.post(Uri.parse(url), body: {
    "action": "Delete_Vehicle",
    "vehicle_id": id.toString(),
  });
  if (response.body == "success") {
    final snackBar = SnackBar(content: Text("Vehicle Successfuly Deleted!"));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  } else {
    final snackBar = SnackBar(content: Text(response.body));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
  return (response.body);
}

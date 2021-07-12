import 'package:flutter/material.dart';
import 'main.dart';
import 'connections.dart';
import 'home.dart';
import 'models.dart';
import 'edit_listing.dart';
import 'dart:async';

class userProfile extends StatefulWidget {
  @override
  _userProfileState createState() => _userProfileState();
}

class _userProfileState extends State<userProfile> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SafeArea(
            child: Scaffold(
          floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
          body: SafeArea(
              child: Column(
            children: [
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 18, 0, 18),
                  child: Container(
                    decoration: new BoxDecoration(
                      color: Colors.blue[100],
                      shape: BoxShape.circle,
                      /*image: DecorationImage(
                                      image: NetworkImage(),
                                      fit: BoxFit.fitHeight)*/
                    ),
                    height: 200,
                  ),
                ),
              ),
              Text(
                '@${myUser.name}',
                style: headingStyle,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 8, 0, 2),
                child: ListTile(
                  tileColor: Colors.blue[100],
                  title:
                      Center(child: Text('Edit Profile', style: defaultStyle)),
                  onTap: () {
                    setState(() {
                      selectedPage = 2;
                      otherPages = 4;
                      mainPages = false;
                      Navigator.pushNamed(context, 'home');
                    });
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 8, 0, 2),
                child: ListTile(
                  tileColor: Colors.blue[100],
                  title: Center(child: Text('My Orders', style: defaultStyle)),
                  onTap: () {
                    setState(() {
                      selectedPage = 2;
                      otherPages = 5;
                      mainPages = false;
                      Navigator.pushNamed(context, 'home');
                    });
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 8, 0, 2),
                child: ListTile(
                  tileColor: Colors.blue[100],
                  title:
                      Center(child: Text('My Listings', style: defaultStyle)),
                  onTap: () {
                    setState(() {
                      selectedPage = 2;
                      otherPages = 6;
                      mainPages = false;
                      Navigator.pushNamed(context, 'home');
                    });
                  },
                ),
              ),
            ],
          )),
        )));
  }
}

class UserRents extends StatefulWidget {
  @override
  _UserRents createState() => _UserRents();
}

class _UserRents extends State<UserRents> {
  //communicate with database to list user orders
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Rent>>(
      future: list_user_rents(myUser.user_id),
      builder: (context, snapshot) {
        return snapshot.hasData
            ? body()
            : Center(child: Text("You have no Listings", style: headingStyle));
      },
    );
  }

  body() {
    return ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: rents.length,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) => RentCard(
              rent: rents[index],
            ));
  }
}

class RentCard extends StatefulWidget {
  final Rent? rent;
  RentCard({Key? key, this.rent}) : super(key: key);
  @override
  _RentCard createState() => _RentCard(rent: rent);
}

class _RentCard extends State<RentCard> {
  final Rent? rent;
  Vehicle? rentVehicle;
  Brand? vehicleBrand;
  Created_Rent? createdRent;
  _RentCard({
    Key? key,
    this.rent,
  }) : super();
  prepareRentDetails() async {
    rentVehicle = await get_vehicle_with_ID(rent?.vehicle_id as int);
    vehicleBrand = await getVehicleBrand(rentVehicle?.brand_id as int);
    createdRent = await getCreatedRent(rent?.rent_id as int);
    c_rent_id = rent?.rent_id as int;
    c_vehicle_id = rent?.vehicle_id as int;
    c_location_id = rent?.location_id as int;
    setState(() {});
  }

  initState() {
    prepareRentDetails();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 8, 0, 2),
      child: ListTile(
        leading: IconButton(
          icon: Icon(Icons.edit),
          onPressed: () {
            setState(() {
              selectedPage = 2;
              otherPages = 8;
              mainPages = false;
              Navigator.pushNamed(context, 'home');
            });
          },
        ),
        trailing: IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              deleteRent(rent?.rent_id as int, context);
              Navigator.pushNamed(context, 'home');
            }),
        tileColor: Colors.blue[100],
        title: Center(
            child: Text(
                '${vehicleBrand?.brand_name} ${rentVehicle?.vehicle_name}',
                style: headingStyle)),
        subtitle: Center(
            child: Text('Created at: ${createdRent?.create_time}',
                style: detailStyle)),
      ),
    );
  }
}

class UserOrders extends StatefulWidget {
  @override
  _UserOrders createState() => _UserOrders();
}

class _UserOrders extends State<UserOrders> {
  //communicate with database to list user orders
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Order>>(
      future: list_user_orders(myUser.user_id),
      builder: (context, snapshot) {
        return snapshot.hasData
            ? body()
            : Center(child: Text("You have no Orders", style: headingStyle));
      },
    );
  }

  body() {
    return ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: orders.length,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) => OrderCard(
              order: orders[index],
            ));
  }
}

class OrderCard extends StatefulWidget {
  final Order? order;
  OrderCard({Key? key, this.order}) : super(key: key);
  @override
  _OrderCard createState() => _OrderCard(order: order);
}

//home-itemcards
late Rent? currentRent;
late Vehicle? currentVehicle;

class _OrderCard extends State<OrderCard> {
  final Order? order;
  Vehicle? orderVehicle;
  Rent? orderRent;
  Brand? vehicleBrand;
  _OrderCard({
    Key? key,
    this.order,
  }) : super();
  prepareOrderDetails() async {
    orderRent = await get_rent_with_ID(order?.rent_id as int);
    orderVehicle = await get_vehicle_with_ID(orderRent?.vehicle_id as int);
    vehicleBrand = await getVehicleBrand(orderVehicle?.brand_id as int);
    setState(() {});
  }

  initState() {
    prepareOrderDetails();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 8, 0, 2),
      child: ListTile(
        trailing: IconButton(
          icon: Icon(Icons.delete),
          onPressed: () {
            deleteOrder(order?.order_id as int, context);
            Navigator.pushNamed(context, 'home');
          },
        ),
        tileColor: Colors.blue[200],
        title: Center(
            child: Text(
                '${vehicleBrand?.brand_name} ${orderVehicle?.vehicle_name}',
                style: headingStyle)),
        subtitle: Center(
            child: Text(
                'Ordered at: ${order?.order_time}, Will end at: ${order?.end_time}',
                style: detailStyle)),
      ),
    );
  }
}

class UserUpdate extends StatefulWidget {
  @override
  _UserUpdate createState() => _UserUpdate();
}

class _UserUpdate extends State<UserUpdate> {
  //communicate with database to update user details

  //controller for user to enter details, default value given as old details of user
  TextEditingController user = TextEditingController(text: "${myUser.name}");
  TextEditingController pass =
      TextEditingController(text: "${myUser.password}");
  TextEditingController mail = TextEditingController(text: "${myUser.email}");
  TextEditingController age = TextEditingController(text: "${myUser.age}");

  @override
  Widget build(BuildContext context) {
    return ListView(padding: const EdgeInsets.all(8), children: <Widget>[
      Column(
        children: <Widget>[
          //text fields for user to enter new details
          SizedBox(height: 25),
          Text('Welcome ${myUser.name}', style: defaultStyle),
          Text('You can update your details', style: defaultStyle),
          TextField(
            controller: user,
            decoration: InputDecoration(
              icon: Icon(Icons.person),
              hintText: "Username",
            ),
          ),
          TextField(
            controller: pass,
            obscureText: true,
            decoration: InputDecoration(
              icon: Icon(Icons.vpn_key),
              hintText: "Password",
            ),
          ),
          TextField(
            controller: mail,
            decoration: InputDecoration(
              icon: Icon(Icons.mail_outline),
              hintText: "E-Mail",
            ),
          ),
          TextField(
            controller: age,
            decoration: InputDecoration(
              icon: Icon(Icons.cake),
              hintText: "Age",
            ),
          ),
          SizedBox(height: 25),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.orange,
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              textStyle: TextStyle(fontSize: 20),
            ),
            child: Text('Update'),
            onPressed: () {
              update_user(user.text, pass.text, mail.text, age.text,
                  context); // when button is pressed call update function
            },
          ),
        ],
      ),
    ]);
  }
/*
  SingleChildScrollView _dataBody() {
    //data table that shows all users and their details
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Container(
        padding: EdgeInsets.only(top: 50),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: DataTable(
            columns: [
              DataColumn(
                label: Text('ID'),
              ),
              DataColumn(
                label: Text('Username'),
              ),
              DataColumn(
                label: Text('E-mail'),
              ),
              DataColumn(
                label: Text('Phone Number'),
              ),
              DataColumn(
                label: Text('Adress'),
              )
            ],
            rows: users
                .map(
                  (u) => DataRow(cells: [
                    DataCell(
                      Text(u.user_id.toString()),
                    ),
                    DataCell(
                      Text(
                        u.name,
                      ),
                    ),
                    DataCell(
                      Text(
                        u.email,
                      ),
                    ),
                    DataCell(
                      Text(
                        u.age.toString(),
                      ),
                    ),
                  ]),
                )
                .toList(),
          ),
        ),
      ),
    );
  }*/
}

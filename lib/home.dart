import 'package:flutter/material.dart';
import 'models.dart';
import 'main.dart';
import 'connections.dart';
import 'details.dart';
import 'create_listing.dart';
import 'edit_listing.dart';
import 'userProfile.dart';
import 'AdminSettingsPage.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

bool mainPages = true;
int selectedPage = 0;
int otherPages = 3;
enum Sort { price, vehicle_id, location_id, rent_id }
enum Filter { Ford, Fiat, Dacia, Audi, none }

var filter = false;
var _filter = 'Ford';
var _sort = 'rent_id';

class _HomeScreenState extends State<HomeScreen> {
  Future<List<Rent>> prepareHome() async {
    list_created_rents();
    list_users();
    return list_rents();
  }

  final _pageOptions = [
    Listings(),
    CreateListing(),
    userProfile(),
    AdminSettingsPage(),
    UserUpdate(),
    UserOrders(),
    UserRents(),
    RentDetails(),
    EditListing(),
    ListVehicle(),
  ];
  final _titles = [
    "Home",
    "Create Listing",
    "Profile",
    "Admin Settings",
    "Update Profile",
    "Your Orders",
    "Your Rents",
    "Rent Details",
    "Edit Listing",
    "All Vehicles",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(mainPages ? _titles[selectedPage] : _titles[otherPages]),
      ),
      body: mainPages ? _pageOptions[selectedPage] : _pageOptions[otherPages],
      bottomNavigationBar: myUser.user_id == 1 ? adminBottomBar() : bottomBar(),
    );
  }

  BottomNavigationBar bottomBar() {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.add_circle_outline_sharp),
          label: 'Create Listing',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
        ),
      ],
      currentIndex: selectedPage,
      selectedItemColor: Colors.amber[800],
      unselectedItemColor: Colors.grey,
      onTap: (index) {
        setState(() {
          mainPages = true;
          selectedPage = index;
        });
      },
    );
  }

  BottomNavigationBar adminBottomBar() {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.add_circle_outline_sharp),
          label: 'Create Listing',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: 'Settings',
        ),
      ],
      currentIndex: selectedPage,
      selectedItemColor: Colors.amber[800],
      unselectedItemColor: Colors.grey,
      onTap: (index) {
        setState(() {
          mainPages = true;
          selectedPage = index;
        });
      },
    );
  }
}

class Listings extends StatefulWidget {
  @override
  _Listings createState() => _Listings();
}

class _Listings extends State<Listings> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Rent>>(
      future:
          filter ? listRentsFiltered(_filter, _sort) : listRentsSorted(_sort),
      builder: (context, snapshot) {
        return snapshot.hasData
            ? Body()
            : Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                    CircularProgressIndicator(),
                    SizedBox(
                      height: 25.0,
                    ),
                    Text("Awaiting result..."),
                  ]));
      },
    );
  }

  Column Body() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 15),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            "Featured",
            style: headingStyle,
          ),
        ),
        SizedBox(height: 15),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: GridView.builder(
                itemCount: rents.length,
                scrollDirection: Axis.horizontal,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 15,
                  childAspectRatio: 1.4,
                ),
                itemBuilder: (context, index) => ItemCard(rent: rents[index])),
          ),
        ),
        SizedBox(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "All Listings",
                style: headingStyle,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  PopupMenuButton<Filter>(
                    icon: Icon(Icons.filter_alt),
                    onSelected: (Filter result) {
                      switch (result) {
                        case Filter.none:
                          {
                            filter = false;
                            break;
                          }

                        case Filter.Dacia:
                          {
                            filter = true;
                            _filter = 'Dacia';
                            break;
                          }

                        case Filter.Ford:
                          {
                            filter = true;
                            _filter = 'Ford';
                            break;
                          }

                        case Filter.Fiat:
                          {
                            filter = true;
                            _filter = 'Fiat';
                            break;
                          }

                        case Filter.Audi:
                          {
                            filter = true;
                            _filter = 'Audi';
                            break;
                          }
                      }
                      setState(() {
                        Navigator.pushNamed(context, 'home');
                      });
                    },
                    itemBuilder: (BuildContext context) =>
                        <PopupMenuEntry<Filter>>[
                      const PopupMenuItem<Filter>(
                        value: Filter.none,
                        child: Text('None'),
                      ),
                      const PopupMenuItem<Filter>(
                        value: Filter.Audi,
                        child: Text('Audi'),
                      ),
                      const PopupMenuItem<Filter>(
                        value: Filter.Fiat,
                        child: Text('Fiat'),
                      ),
                      const PopupMenuItem<Filter>(
                        value: Filter.Ford,
                        child: Text('Ford'),
                      ),
                      const PopupMenuItem<Filter>(
                        value: Filter.Dacia,
                        child: Text('Dacia'),
                      ),
                    ],
                  ),
                  PopupMenuButton<Sort>(
                    icon: Icon(Icons.sort),
                    onSelected: (Sort result) {
                      var __sort;
                      switch (result) {
                        case Sort.rent_id:
                          {
                            __sort = 'rent_id';
                            break;
                          }
                        case Sort.vehicle_id:
                          {
                            __sort = 'vehicle_id';
                            break;
                          }
                        case Sort.price:
                          {
                            __sort = 'price';
                            break;
                          }
                        case Sort.location_id:
                          {
                            __sort = 'location_id';
                            break;
                          }
                      }
                      setState(() {
                        _sort = __sort;
                        Navigator.pushNamed(context, 'home');
                      });
                    },
                    itemBuilder: (BuildContext context) =>
                        <PopupMenuEntry<Sort>>[
                      const PopupMenuItem<Sort>(
                        value: Sort.rent_id,
                        child: Text('Default'),
                      ),
                      const PopupMenuItem<Sort>(
                        value: Sort.location_id,
                        child: Text('Location'),
                      ),
                      const PopupMenuItem<Sort>(
                        value: Sort.vehicle_id,
                        child: Text('Vehicle'),
                      ),
                      const PopupMenuItem<Sort>(
                        value: Sort.price,
                        child: Text('Price'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 15),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: GridView.builder(
                itemCount: rents.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20,
                  childAspectRatio: 0.9,
                ),
                itemBuilder: (context, index) => ItemCard(
                      rent: rents[index],
                      // vehicle: get_vehicle_with_ID(rents[index].vehicle_id),
                    )),
          ),
        ),
      ],
    );
  }
}

class ItemCard extends StatefulWidget {
  final Rent? rent;
  ItemCard({Key? key, this.rent}) : super(key: key);
  @override
  ItemCardState createState() => ItemCardState(rent: rent);
}

//home-itemcards
late Rent? currentRent;
late Vehicle? currentVehicle;

class ItemCardState extends State<ItemCard> {
  final Rent? rent;
  Vehicle? vehicle;
  ItemCardState({
    Key? key,
    this.rent,
  }) : super();
  get_vehicle() async {
    vehicle = await get_vehicle_with_ID(rent?.vehicle_id as int);
    setState(() {});
  }

  initState() {
    get_vehicle();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedPage = 0;
          otherPages = 7;
          mainPages = false;
          currentRent = rent;
          currentVehicle = vehicle;
          print(selectedPage);
          Navigator.pushNamed(context, 'home');
        });
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: Colors.blue[100],
                borderRadius: BorderRadius.circular(15),
              ),
              child: Hero(
                tag: "${rent?.rent_id}",
                //child: Text("${vehicle?.vehicle_name}"), // delete later
                child: Image.network(
                    vehicle?.image as String), //change with vehicle image later
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Text(
              rent?.contact_number as String,
              style: TextStyle(color: Colors.brown[300]),
            ),
          ),
          Text(
            "\₺${rent?.price}",
            style: TextStyle(fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}

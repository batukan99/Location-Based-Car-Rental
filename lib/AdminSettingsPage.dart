import 'package:flutter/material.dart';
import 'models.dart';
import 'main.dart';
import 'home.dart';
import 'connections.dart';

class AdminSettingsPage extends StatefulWidget {
  @override
  _AdminSettingsPageState createState() => _AdminSettingsPageState();
}

class _AdminSettingsPageState extends State<AdminSettingsPage> {
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
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 2),
                child: ListTile(
                  tileColor: Colors.blue[100],
                  title:
                      Center(child: Text('Add Vehicle', style: defaultStyle)),
                  onTap: () {
                    setState(() {
                      selectedPage = 3;
                      otherPages = 3;
                      mainPages = false;
                      Navigator.pushNamed(context, 'home');
                    });
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 1, 0, 2),
                child: ListTile(
                  tileColor: Colors.blue[100],
                  title:
                      Center(child: Text('List Vehicles', style: defaultStyle)),
                  onTap: () {
                    setState(() {
                      selectedPage = 3;
                      otherPages = 9;
                      mainPages = false;
                      Navigator.pushNamed(context, 'home');
                    });
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 1, 0, 2),
                child: ListTile(
                  tileColor: Colors.blue[100],
                  title: Center(child: Text('Add User', style: defaultStyle)),
                  onTap: () {
                    setState(() {
                      selectedPage = 3;
                      otherPages = 3;
                      mainPages = false;
                      Navigator.pushNamed(context, 'home');
                    });
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 1, 0, 2),
                child: ListTile(
                  tileColor: Colors.blue[100],
                  title: Center(child: Text('List Users', style: defaultStyle)),
                  onTap: () {
                    setState(() {
                      selectedPage = 3;
                      otherPages = 3;
                      mainPages = false;
                      Navigator.pushNamed(context, 'home');
                    });
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 1, 0, 2),
                child: ListTile(
                  tileColor: Colors.blue[100],
                  title: Center(child: Text('Add Brand', style: defaultStyle)),
                  onTap: () {
                    setState(() {
                      selectedPage = 3;
                      otherPages = 3;
                      mainPages = false;
                      Navigator.pushNamed(context, 'home');
                    });
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 1, 0, 2),
                child: ListTile(
                  tileColor: Colors.blue[100],
                  title:
                      Center(child: Text('List Brands', style: defaultStyle)),
                  onTap: () {
                    setState(() {
                      selectedPage = 3;
                      otherPages = 3;
                      mainPages = false;
                      Navigator.pushNamed(context, 'home');
                    });
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 1, 0, 2),
                child: ListTile(
                  tileColor: Colors.blue[100],
                  title:
                      Center(child: Text('Add Category', style: defaultStyle)),
                  onTap: () {
                    setState(() {
                      selectedPage = 3;
                      otherPages = 3;
                      mainPages = false;
                      Navigator.pushNamed(context, 'home');
                    });
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 1, 0, 2),
                child: ListTile(
                  tileColor: Colors.blue[100],
                  title: Center(
                      child: Text('List Categories', style: defaultStyle)),
                  onTap: () {
                    setState(() {
                      selectedPage = 3;
                      otherPages = 3;
                      mainPages = false;
                      Navigator.pushNamed(context, 'home');
                    });
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 1, 0, 2),
                child: ListTile(
                  tileColor: Colors.blue[100],
                  title:
                      Center(child: Text('Add Location', style: defaultStyle)),
                  onTap: () {
                    setState(() {
                      selectedPage = 3;
                      otherPages = 3;
                      mainPages = false;
                      Navigator.pushNamed(context, 'home');
                    });
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 1, 0, 2),
                child: ListTile(
                  tileColor: Colors.blue[100],
                  title: Center(
                      child: Text('List Locations', style: defaultStyle)),
                  onTap: () {
                    setState(() {
                      selectedPage = 3;
                      otherPages = 3;
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

class ListVehicle extends StatefulWidget {
  @override
  _ListVehicle createState() => _ListVehicle();
}

class _ListVehicle extends State<ListVehicle> {
  //communicate with database to list vehicles
  @override
  Widget build(BuildContext context) {
    return !vehicles.isEmpty
        ? _body()
        : Center(child: Text("There are no Vehicles", style: headingStyle));
  }

  _body() {
    return ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: vehicles.length,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) => VehicleCard(
              vehicle: vehicles[index],
              brand: vehicles[index].brand_id - 1,
              category: vehicles[index].category_id - 1,
            ));
  }
}

class VehicleCard extends StatefulWidget {
  final Vehicle? vehicle;
  final int? brand;
  final int? category;
  VehicleCard({
    Key? key,
    this.vehicle,
    this.brand,
    this.category,
  }) : super(key: key);
  @override
  _VehicleCard createState() =>
      _VehicleCard(vehicle: vehicle, brand: brand, category: category);
}

class _VehicleCard extends State<VehicleCard> {
  final Vehicle? vehicle;
  final int? brand;
  final int? category;

  _VehicleCard({
    Key? key,
    this.vehicle,
    this.brand,
    this.category,
  }) : super();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 1, 0, 2),
      child: ListTile(
        leading: IconButton(
          icon: Icon(Icons.edit),
          onPressed: () {
            print(brands.length);
            setState(() {
              selectedPage = 3;
              otherPages = 6;
              mainPages = false;
              Navigator.pushNamed(context, 'home');
            });
          },
        ),
        trailing: IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              deleteVehicle(vehicle?.vehicle_id as int, context);
              Navigator.pushNamed(context, 'home');
            }),
        tileColor: Colors.blue[100],
        title: Center(
            child: Text('${brands[brand as int]} ${vehicle?.vehicle_name}',
                style: headingStyle)),
        subtitle: Center(
            child: Text('${categories[category as int]}', style: detailStyle)),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'models.dart';
import 'home.dart';
import 'main.dart';

class RentDetails extends StatefulWidget {
  @override
  _RentDetails createState() => _RentDetails();
}

class _RentDetails extends State<RentDetails> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        SizedBox(height: 15),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            "${currentVehicle?.vehicle_name}",
            style: headingStyle,
          ),
        ),
        SizedBox(height: 5),
        Expanded(
          child: Container(
            padding: EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: Colors.blue[100],
              borderRadius: BorderRadius.circular(15),
            ),
            child: Hero(
              tag: "${currentRent?.vehicle_id}", // delete later
              child: Image.network(currentVehicle?.image
                  as String), //change with vehicle image later
            ),
          ),
        ),
        Expanded(
          child: SizedBox(
            height: 300,
            child: GridView.count(
              primary: false,
              padding: const EdgeInsets.all(20),
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              crossAxisCount: 3,
              childAspectRatio: 2,
              children: <Widget>[
                container(currentVehicle?.category_id.toString()
                    as String), // change with category name
                container(currentVehicle?.brand_id.toString()
                    as String), // change with brand name
                container(currentVehicle?.vehicle_name as String),
                container(currentVehicle?.color as String),
                container(currentRent?.contact_number
                    as String), //change with sellers user name
                container(currentRent?.location_id.toString()
                    as String), //change with location city, disc, neigh
                container(currentRent?.contact_number as String)
              ],
            ),
          ),
        ),
        Center(
          child: ElevatedButton(
            child: Text("${currentRent?.price}", style: defaultStyle),
            onPressed: () => {
              //CREATE ORDER FOR USER
            },
            style: ElevatedButton.styleFrom(
                primary: Colors.orange,
                elevation: 5,
                minimumSize: Size(100, 45)),
          ),
        ),
        SizedBox(
          height: 40,
        )
      ],
    );
  }

  Container container(String text) {
    return Container(
      padding: EdgeInsets.all(8),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.blue[100],
        borderRadius: BorderRadius.circular(15),
      ),
      child: Text(
        "${text}",
        style: detailStyle,
      ),
    );
  }
}

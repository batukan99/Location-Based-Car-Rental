import 'package:flutter/material.dart';
import 'package:webproject1/models.dart';
import 'home.dart';
import 'main.dart';
import 'connections.dart';

var _vals = [
  _brand,
  _category,
];
var _brand;
var _category;

final TextEditingController _imageURLController = new TextEditingController();
final TextEditingController _cityController = new TextEditingController();
final TextEditingController _distController = new TextEditingController();
final TextEditingController _neighController = new TextEditingController();
final TextEditingController _contactNumberController =
    new TextEditingController();
final TextEditingController _priceController = new TextEditingController();
final TextEditingController _modelController = new TextEditingController();
final TextEditingController _yearController = new TextEditingController();
final TextEditingController _colorController = new TextEditingController();
final TextEditingController _hpController = new TextEditingController();

class CreateListing extends StatefulWidget {
  @override
  _CreateListingState createState() => _CreateListingState();
}

class _CreateListingState extends State<CreateListing> {
  textField(String hint, controller) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 50,
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
          decoration: new BoxDecoration(
            color: Colors.blue[100],
            borderRadius: new BorderRadius.all(Radius.circular(10)),
          ),
          child: TextField(
            maxLines: 1,
            maxLength: 250,
            controller: controller,
            decoration: InputDecoration(
              counterText: "",
              hintStyle: defaultStyle,
              hintText: hint,
              border: InputBorder.none,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(5, 15, 5, 15),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(_imageURLController.text.isEmpty
                        ? 'https://media.istockphoto.com/vectors/car-flat-icon-vector-id1144092062?b=1&k=6&m=1144092062&s=612x612&w=0&h=zMH-_u3shpUjbCFQiewi6AhSItMmtI-MMVsayqeHRpc='
                        : _imageURLController.text),
                    fit: BoxFit.cover,
                  ),
                  color: Colors.blue[100],
                  borderRadius: new BorderRadius.all(Radius.circular(10)),
                ),
                height: 120,
                width: 200,
              ),
            ),
            Row(
              children: [
                textField("Image URL", _imageURLController),
                IconButton(
                    icon: Icon(Icons.refresh),
                    onPressed: () {
                      setState(() {});
                    })
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(width: 25),
                Container(
                  width: 150,
                  child: DropdownButton<String>(
                    isExpanded: true,
                    focusColor: Colors.white,
                    value: _category,
                    //elevation: 5,
                    style: TextStyle(color: Colors.white),
                    iconEnabledColor: Colors.black,
                    items: categories
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: TextStyle(color: Colors.black),
                        ),
                      );
                    }).toList(),
                    hint: Text(
                      "Choose Category",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    ),
                    onChanged: (String? value) {
                      setState(() {
                        _category = value;
                      });
                    },
                  ),
                ),
                SizedBox(width: 15),
                Container(
                  width: 150,
                  child: DropdownButton<String>(
                    isExpanded: true,
                    focusColor: Colors.white,
                    value: _brand,
                    //elevation: 5,
                    style: TextStyle(color: Colors.white),
                    iconEnabledColor: Colors.black,
                    items: brands.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: TextStyle(color: Colors.black),
                        ),
                      );
                    }).toList(),
                    hint: Text(
                      "Choose Brand",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    ),
                    onChanged: (String? value) {
                      setState(() {
                        _brand = value;
                      });
                    },
                  ),
                ),
                SizedBox(width: 5)
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                textField("Model Year", _yearController),
                textField("Color", _colorController),
                textField("Horse Power", _hpController),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                textField("City", _cityController),
                textField("District", _distController),
                textField("Neighborhood", _neighController),
              ],
            ),
            Row(
              children: [
                textField("Contact Number", _contactNumberController),
              ],
            ),
            Row(
              children: [
                textField("Price", _priceController),
              ],
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: MaterialButton(
                    shape: CircleBorder(),
                    color: Colors.blue[100],
                    child: Text(
                      '✓',
                      style: TextStyle(color: Colors.black, fontSize: 35.0),
                    ),
                    height: 50,
                    onPressed: () {
                      print(_brand);
                      print(_category);
                      int cid = categories.indexOf(_category);
                      int bid = brands.indexOf(_brand);

                      create_rent(
                          _imageURLController.text,
                          cid,
                          bid,
                          _modelController.text,
                          int.parse(_yearController.text),
                          _colorController.text,
                          _hpController.text,
                          _cityController.text,
                          _distController.text,
                          _neighController.text,
                          _contactNumberController.text,
                          int.parse(_priceController.text),
                          myUser.user_id,
                          context);
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

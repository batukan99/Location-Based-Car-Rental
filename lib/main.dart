import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/gestures.dart';
import 'home.dart';
import 'models.dart';
import 'connections.dart';
import 'home.dart';

void main() {
  runApp(MyApp());
}

//myUser is the user that logined or registered the system
late User myUser;
late List<User> users;
late List<Rent> rents;
late List<Created_Rent> c_rents;
late List<Order> orders;
late List<String> categories;
late List<String> brands;
late List<Vehicle> vehicles;
late List<Location> locations;

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: 'login',
      routes: {
        'login': (context) => LoginPage(),
        'register': (context) => RegisterPage(),
        'home': (context) => HomeScreen()
      },
    );
  }
}

TextStyle defaultStyle = TextStyle(color: Colors.black87, fontSize: 17.0);
TextStyle detailStyle = TextStyle(color: Colors.black87, fontSize: 14.0);
TextStyle headingStyle = TextStyle(color: Colors.black, fontSize: 20.0);
TextStyle linkStyle = TextStyle(color: Colors.blueAccent);

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController user = TextEditingController();
  TextEditingController pass = TextEditingController();
  //login function is used for communicate database and check if user exists and redirects to home page

  initState() {
    list_users(); // it is called from here because it must be ready for homepage
    list_brands();
    list_categories();
    list_vehicles();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Column(
        children: <Widget>[
          //text fields for user to enter username and password
          TextField(
            controller: user,
            decoration: InputDecoration(
              icon: Icon(Icons.mail_outline),
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
          SizedBox(height: 25),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.orange,
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              textStyle: TextStyle(fontSize: 20),
            ),
            child: Text('Login'),
            onPressed: () {
              login(user.text, pass.text, context);
              // Navigator.pop(context);
            },
          ),
          SizedBox(height: 15),
          RichText(
            text: TextSpan(
              style: defaultStyle,
              children: <TextSpan>[
                //show message to go to register page for user
                TextSpan(text: 'Do not have an account? '),
                TextSpan(
                    text: 'Register here.',
                    style: linkStyle,
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.pushNamed(context, 'register');
                      }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

//the register page
class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  //controllers for to enter details
  TextEditingController user = TextEditingController();
  TextEditingController pass = TextEditingController();
  TextEditingController mail = TextEditingController();
  TextEditingController age = TextEditingController();
  TextEditingController address = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Register"),
      ),
      body: Column(
        children: <Widget>[
          //text fields for to enter details
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
              icon: Icon(Icons.phone_android),
              hintText: "Age",
            ),
          ),
          TextField(
            controller: address,
            decoration: InputDecoration(
              icon: Icon(Icons.home),
              hintText: "Address",
            ),
          ),
          SizedBox(height: 25),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.orange,
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              textStyle: TextStyle(fontSize: 20),
            ),
            child: Text('Register'),
            onPressed: () {
              register(user.text, pass.text, mail.text, age.text,
                  context); // when button pressed, call register function
            },
          ),
          SizedBox(height: 15),
          RichText(
            text: TextSpan(
              style: defaultStyle,
              children: <TextSpan>[
                //show message to user for to redirect to login page
                TextSpan(text: 'Already have an account? '),
                TextSpan(
                    text: 'Login here.',
                    style: linkStyle,
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.pushNamed(
                            context, 'login'); // go to login page
                      }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

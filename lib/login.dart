import 'package:flutter/material.dart';
import 'package:animated_button/animated_button.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:to_do/signup.dart';

import 'home.dart';

class loginpage extends StatefulWidget {
  const loginpage({Key? key}) : super(key: key);

  @override
  State<loginpage> createState() => _loginpageState();
}

class _loginpageState extends State<loginpage> {
  late String _uname;
  String _pass = "";
  String _validation = "";

  addUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("user", _uname);
    prefs.setString("pass", _pass);
  }

  getUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String uname = prefs.getString("user") ?? "Null";
    String pass = prefs.getString("pass") ?? "Null";

    setState(() {
      if (_uname == uname && _pass == pass) {
        Navigator.push(context, SizeTransition5(Home()));
      } else {
        setState(() {
          _validation = "Username or Password is Wrong";
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Login",
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
          ),
        ),
        backgroundColor: Colors.brown,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(50),
        child: Column(
          children: [
            Container(
              height: 50,
              child: Text(
                _validation,
                style: TextStyle(
                    color: Colors.red,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
            TextField(
              decoration: InputDecoration(
                hintText: "Username",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              style: TextStyle(fontSize: 25, color: Colors.brown),
              onChanged: (value) {
                setState(() {
                  _uname = value;
                });
              },
            ),
            Container(
              height: 50,
            ),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                hintText: "Password",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              style: TextStyle(fontSize: 25, color: Colors.brown),
              onChanged: (value) {
                _pass = value;
              },
            ),
            Container(
              height: 50,
            ),
            AnimatedButton(
              child: Text(
                "Log in",
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
              onPressed: () => getUser(),
              color: Colors.brown,
              enabled: true,
              shadowDegree: ShadowDegree.dark,
            ),
            Container(
              height: 25,
            ),
          ],
        ),
      ),
    );
  }
}

class SizeTransition5 extends PageRouteBuilder {
  final Widget page;

  SizeTransition5(this.page)
      : super(
          pageBuilder: (context, animation, anotherAnimation) => page,
          transitionDuration: Duration(milliseconds: 1000),
          reverseTransitionDuration: Duration(milliseconds: 200),
          transitionsBuilder: (context, animation, anotherAnimation, child) {
            animation = CurvedAnimation(
                curve: Curves.fastLinearToSlowEaseIn,
                parent: animation,
                reverseCurve: Curves.fastOutSlowIn);
            return Align(
              alignment: Alignment.centerRight,
              child: SizeTransition(
                axis: Axis.horizontal,
                sizeFactor: animation,
                child: page,
                axisAlignment: 0,
              ),
            );
          },
        );
}

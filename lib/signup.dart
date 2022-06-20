import 'package:flutter/material.dart';
import 'package:animated_button/animated_button.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:to_do/login.dart';
import 'package:to_do/main.dart';

class signup extends StatefulWidget {
  const signup({Key? key}) : super(key: key);

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {

  late String _uname;
  String _pass = "";
  String _validation = "";

  addUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("user", _uname);
    prefs.setString("pass", _pass);
    setState(() {
      Navigator.push(context, SizeTransition5(loginpage()));
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Signup",
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
                "Sign up",
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
              onPressed: () => addUser(),
              color: Colors.brown,
              enabled: true,
              shadowDegree: ShadowDegree.dark,
            ),
            Container(
              height: 50,
              child: Text(_validation),
            )
          ],
        ),
      ),
    );
  }

  // void _validate() {
  //   if (_uname == "Anand" && _pass == "Arp") {
  //     print(_uname);
  //     print(_pass);
  //     setState(() {
  //       Navigator.push(context, SizeTransition5(login()));
  //     });
  //   } else {
  //     print("Else");
  //     print(_uname);
  //     print(_pass);
  //     setState(() {
  //       _validation = "Invalid User";
  //     });
  //   }
  // }
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
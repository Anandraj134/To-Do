import 'package:flutter/material.dart';
import 'package:animated_button/animated_button.dart';
import 'package:to_do/login.dart';
import 'package:to_do/signup.dart';

void main() {
  runApp(const MaterialApp(
    home: first(),
  ));
}

class first extends StatelessWidget {
  const first({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "To-Do App",
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
          ),
        ),
        backgroundColor: Colors.brown,
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
      child: Column(
        children: [
          Container(
            height: 170,
          ),
        Container(
              height: 40,
          child: const Text(
            "Already have Account?",
            style: TextStyle(
                color: Colors.blueAccent,
                fontSize: 25,
                fontWeight: FontWeight.bold),
          ),
            ),
            AnimatedButton(
              child: const Text(
                "Log in",
                style: TextStyle(fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold),
              ),
              onPressed: () {
                Navigator.push(context, SizeTransition5(LoginPage()));
              },
              color: Colors.brown,
              enabled: true,
              shadowDegree: ShadowDegree.dark,
            ),
            Container(
              height: 70,
            ),
            Container(
              height: 40,
              child: const Text(
                "Don't have Account?",
                style: TextStyle(
                    color: Colors.blueAccent,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
            ),
            AnimatedButton(
              child: const Text(
                "Sign up",
                style: TextStyle(fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold),
              ),
              onPressed: () {
                Navigator.push(context, SizeTransition5(const SignUp()));
              },
              color: Colors.brown,
              enabled: true,
              shadowDegree: ShadowDegree.dark,
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
          transitionDuration: const Duration(milliseconds: 1000),
          reverseTransitionDuration: const Duration(milliseconds: 200),
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

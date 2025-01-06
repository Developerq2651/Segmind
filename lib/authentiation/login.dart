import 'package:flutter/material.dart';
import 'package:try4/card/button.dart';
import 'package:try4/studio.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 150,
          ),
          Container(
            width: 400,
            height: 100,
            alignment: Alignment.bottomCenter,
            child: Center(
              child: Icon(
                Icons.star_half_rounded,
                size: 70,
              ),
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            "Welcome to Segmind",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 37, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 8,
          ),
          ButtonSection(
              icon1: Icons.login,
              label: "Login With Google",
              width: 370,
              backgroundColor: Colors.grey,
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Studio()));
              })
        ],
      ),
    ));
  }
}

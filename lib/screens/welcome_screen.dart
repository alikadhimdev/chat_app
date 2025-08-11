import 'package:chat_app/widgets/build_button.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: EdgeInsets.all(24),
            height: 180,
            child: Image(
              image: AssetImage("./images/logo.png"),
              fit: BoxFit.contain,
            ),
          ),
          Center(
            child: Text(
              "Message Me",
              style: Theme.of(context).textTheme.headlineLarge,
            ),
          ),

          SizedBox(height: 20),

          BuildButton(
            title: "دخول",
            bgColor: Colors.orange[700]!,
            handleClick: () {
              print("login");
            },
          ),

          BuildButton(
            title: "تسجيل",
            bgColor: Theme.of(context).colorScheme.primary,
            handleClick: () {
              print("");
            },
          ),
        ],
      ),
    );
  }
}

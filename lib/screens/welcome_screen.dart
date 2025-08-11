import 'package:chat_app/screens/login_screen.dart';
import 'package:chat_app/screens/registration_screen.dart';
import 'package:chat_app/widgets/build_button.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});
  static const screenRoute = "/welcome";
  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
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
                Navigator.of(context).pushNamed(LoginScreen.screenRoute);
              },
            ),
            SizedBox(height: 10),
            BuildButton(
              title: "تسجيل",
              bgColor: Theme.of(context).colorScheme.primary,
              handleClick: () {
                Navigator.of(context).pushNamed(RegistrationScreen.screenRoute);
              },
            ),
          ],
        ),
      ),
    );
  }
}

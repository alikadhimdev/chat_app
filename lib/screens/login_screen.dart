import 'package:chat_app/widgets/build_button.dart';
import 'package:chat_app/widgets/build_inputFiled.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  static const screenRoute = "/login";
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(height: 180, child: Image.asset("images/logo.png")),
            Center(
              child: Text(
                "مرحبا بك في تطبيق المراسلة",
                style: Theme.of(context).textTheme.headlineLarge,
              ),
            ),
            SizedBox(height: 30),

            BuildInputFiled(
              title: "ادخل البريد الاليكتروني",
              handleChange: (value) {
                print(value);
              },
            ),
            SizedBox(height: 10),
            BuildInputFiled(
              title: "ادخل كلمة المرور",
              handleChange: (value) {
                print(value);
              },
            ),
            SizedBox(height: 20),
            BuildButton(
              title: "دخول",
              bgColor: Colors.orange[700]!,
              handleClick: () {},
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:chat_app/widgets/build_button.dart';
import 'package:chat_app/widgets/build_inputFiled.dart';
import 'package:flutter/material.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
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
              title: "اسم المستخدم",
              handleChange: (value) {
                print(value);
              },
            ),
            SizedBox(height: 10),

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
              title: "تسجيل",
              bgColor: Theme.of(context).colorScheme.primary,
              handleClick: () {},
            ),
          ],
        ),
      ),
    );
  }
}

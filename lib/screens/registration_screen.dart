import 'package:chat_app/screens/chat_scree.dart';
import 'package:chat_app/widgets/build_button.dart';
import 'package:chat_app/widgets/build_input_filed.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});
  static const screenRoute = "/register";
  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _auth = FirebaseAuth.instance;

  late String username;
  late String email;
  late String password;
  bool _loading = false;
  void handleRegister(ctx) async {
    setState(() {
      _loading = true;
    });
    try {
      final newUser = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      Navigator.pushNamed(ctx, ChatScreen.screenRoute);
    } catch (e) {
      print(e);
    }
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ModalProgressHUD(
        inAsyncCall: _loading,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(height: 120, child: Image.asset("images/logo.png")),
              Center(
                child: Text(
                  "مرحبا بك في تطبيق المراسلة",
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
              SizedBox(height: 30),
              BuildInputFiled(
                title: "اسم المستخدم",
                handleChange: (value) {
                  username = value;
                },
                filedType: "username",
              ),
              SizedBox(height: 10),

              BuildInputFiled(
                title: "ادخل البريد الالكتروني",
                handleChange: (value) {
                  email = value;
                },
                filedType: "email",
              ),
              SizedBox(height: 10),
              BuildInputFiled(
                title: "ادخل كلمة المرور",
                handleChange: (value) {
                  password = value;
                },
                filedType: "password",
              ),
              SizedBox(height: 20),
              BuildButton(
                title: "تسجيل",
                bgColor: Theme.of(context).colorScheme.primary,
                handleClick: () => handleRegister(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

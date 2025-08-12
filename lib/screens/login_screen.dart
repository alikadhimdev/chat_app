import 'package:chat_app/screens/chat_scree.dart';
import 'package:chat_app/widgets/build_button.dart';
import 'package:chat_app/widgets/build_input_filed.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  static const screenRoute = "/login";
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = FirebaseAuth.instance;
  bool _loading = false;
  late String password;
  late String email;
  void _handleLogin() async {
    setState(() {
      _loading = true;
    });
    try {
      final currentUser = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (currentUser != null) {
        Navigator.pushNamed(context, ChatScreen.screenRoute);
      }
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
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ),
              SizedBox(height: 30),

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
                title: "دخول",
                bgColor: Colors.orange[700]!,
                handleClick: _handleLogin,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

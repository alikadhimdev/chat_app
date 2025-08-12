import 'package:flutter/material.dart';

class BuildInputFiled extends StatelessWidget {
  final String title;
  final Function handleChange;
  final String filedType;
  const BuildInputFiled({
    super.key,
    required this.title,
    required this.handleChange,
    required this.filedType,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: filedType == "password" ? true : false,
      keyboardType: filedType == "email"
          ? TextInputType.emailAddress
          : TextInputType.text,
      onChanged: (value) {
        handleChange(value);
      },

      decoration: InputDecoration(
        hint: Text(title, style: TextStyle(color: Colors.grey[500])),
        contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.orange, width: 2),
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
      ),
    );
  }
}

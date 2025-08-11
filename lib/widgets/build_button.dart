import 'package:flutter/material.dart';

class BuildButton extends StatelessWidget {
  final String title;
  final Color bgColor;
  final Function handleClick;

  const BuildButton({
    super.key,
    required this.title,
    required this.bgColor,
    required this.handleClick,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: bgColor,
      child: MaterialButton(
        height: 50,

        onPressed: () => handleClick(),
        child: Text(
          title,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

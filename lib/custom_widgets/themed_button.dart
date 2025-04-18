import 'package:flutter/material.dart';

class ThemedButoon extends StatelessWidget {
  final String buttonName;
  final Function() buttonFunction;

  const ThemedButoon({
    super.key,
    required this.buttonName,
    required this.buttonFunction,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: buttonFunction,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.blueAccent,
          boxShadow: [
            BoxShadow(
                offset: Offset(2.5, 3),
                blurRadius: 5,
                blurStyle: BlurStyle.normal,
                color: Colors.grey),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 15,
          ),
          child: Text(
            buttonName,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w900,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:password_generator_app/c_constants.dart';

class ThemedCardForPass extends StatelessWidget {
  const ThemedCardForPass({super.key});

  @override
  Widget build(BuildContext context) {
    double cardHeight = MediaQuery.of(context).size.height / 1000 * 290;
    double cardWidth = MediaQuery.of(context).size.width - 30;

    return Card(
      color: Colors.blue,
      elevation: 10,
      shadowColor: Colors.white,
      child: Stack(
        children: [
          Positioned(
            top: MediaQuery.of(context).size.height / 1000 * 21,
            child: SizedBox(
              height: cardHeight,
              width: cardWidth,
              child: Image.asset(
                'images/celebration.png',
                fit: BoxFit.fill,
              ),
            ),
          ),
          SizedBox(
            height: cardHeight,
            width: cardWidth,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height / 1000 * 22,
                ),
                Text(
                  'Your Password is',
                  style: cHeadingTextStyle,
                ),
                Container(
                  height: 5,
                  color: Colors.white,
                  width: cardWidth - 140,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 1000 * 40,
                ),
                Text(
                  'hello world!!',
                  style: cHeadingTextStyle,
                  // textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Second Page'),
        centerTitle: true,
      ),
      body: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text("route seconddpage")),
    );
  }
}

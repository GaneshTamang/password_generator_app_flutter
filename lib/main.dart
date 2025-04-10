import 'package:flutter/material.dart';
import 'package:password_generator_app/providers/form_literals_value.dart';
import 'package:password_generator_app/screens/login_page.dart';
import 'package:password_generator_app/screens/password_generator_page.dart';

import 'package:provider/provider.dart';

void main() {
  runApp(
    // here to ensure rerun for every value change
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => FormLiteralsValues(),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      // declaring theme for app for color
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.deepPurple, // Set the AppBar color explicitly
          foregroundColor:
              Colors.white, // Ensures the text/icon color is visible
        ),
      ),
      home: PasswordGeneratorPage(),
    );
  }
}

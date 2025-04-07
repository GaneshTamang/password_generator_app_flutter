import 'package:flutter/material.dart';
import 'package:password_generator_app/custom_widgets/themed_pass_generator_app_body.dart';

class PasswordGeneratorPage extends StatelessWidget {
  const PasswordGeneratorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(),
        body: ThemedPassGeneratorAppBody(),
      ),
    );
  }
}
// custom widgets

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  // The preferred size of the AppBar, using Flutter's default toolbar height.
  // you can either add custom height or constant size height given by flutter
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        "Password Generator",
        style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
      ),
      centerTitle: true,
    );
  }
}

// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:password_generator_app/custom_widgets/themed_text_from_field.dart';
import 'package:password_generator_app/custom_widgets/themed_button.dart';
import 'package:password_generator_app/screens/password_generator_page.dart';

import 'package:password_generator_app/modules/form_validator_reg_ex.dart';


class LoginPage extends StatelessWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus(); // Dismiss keyboard
      },
      child: Scaffold(
        backgroundColor: Colors.green,
        body: Form(
          key: formKey,
          child: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: LayoutBuilder(
              builder: (context, constraints) {
                return SingleChildScrollView(
                  child: ConstrainedBox(
                    constraints:
                        BoxConstraints(minHeight: constraints.maxHeight),
                    child: IntrinsicHeight(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(height: 45),
                          SizedBox(
                            height:
                                MediaQuery.of(context).size.height / 1000 * 400,
                            child: Image.asset('images/login.png'),
                          ),
                          const SizedBox(height: 45),
                          ThemedTextFormField(
                              hintText: 'abc@xyz.com',
                              labelText: 'Enter ID ',
                              leadingIcon: Icons.person,
                              trailingIcon: null,
                              controller: emailController,
                              validator: (value) {
                                String? emailValidationError =
                                    emailValidation(value!);
                                return emailValidationError;
                              }),
                          ThemedTextFormField(
                            hintText: 'Password@#!!',
                            labelText: 'Enter Password ',
                            obsecureText: true,
                            leadingIcon: Icons.password,
                            trailingIcon: Icons.remove_red_eye,
                            controller: passwordController,
                            validator: (value) {
                              String? error = passwordValidation(value!);
                              return error;
                            },
                          ),
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: ThemedButoon(
                              buttonName: 'Login',
                              buttonFunction: () {
                                if (formKey.currentState?.validate() ?? false) {
                                  // If the form is valid, process the data
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          PasswordGeneratorPage(),
                                    ),
                                  );
                                } else {
                                  // If the form is not valid, show a message or error
                                  print('Form is not valid');
                                }
                              },
                            ),
                          ),
                          const Spacer(), // Pushes everything up when needed
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

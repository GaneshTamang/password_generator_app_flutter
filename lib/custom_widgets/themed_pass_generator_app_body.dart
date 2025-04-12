// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:password_generator_app/custom_widgets/check_box_list_for_setting.dart';
import 'package:password_generator_app/custom_widgets/themed_button.dart';
import 'package:password_generator_app/custom_widgets/themed_card_for_pass.dart';
import 'package:password_generator_app/c_constants.dart';
import 'package:password_generator_app/modules/passowd_gen_module.dart';
import 'package:password_generator_app/providers/form_literals_value.dart';
import 'package:provider/provider.dart';

class ThemedPassGeneratorAppBody extends StatelessWidget {
  const ThemedPassGeneratorAppBody({super.key});

  @override
  Widget build(BuildContext context) {
    Map<String, Object> provideWatchValues =
        context.watch<FormLiteralsValuesProvider>().getpasswordStatus;

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus(); // Dismiss keyboard
      },
      child: Stack(
        children: [
          BackGroundImage(), //stack image background with color blending dark for nice view
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  context.watch<FormLiteralsValuesProvider>().getPasswordLength,
                  style: cHeadingTextStyle,
                ),
                // SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Generate pass |  Ex.8",
                      textAlign: TextAlign.center,
                      style: cHeadingTextStyle,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    //! text field
                    SizedBox(
                      width: 80,
                      height: 80,
                      child: TextField(
                        onChanged: (typedvalue) {
                          print('typed value:$typedvalue');
                          checkAndValidatePasswordLength(typedvalue, context);
                        },
                        decoration: cTextFieldDecoration,
                        style: TextStyle(color: Colors.white),
                      ),
                    )
                  ], //row children
                ),
                context
                            .watch<FormLiteralsValuesProvider>()
                            .getpasswordStatus['password_error'] as String ==
                        ""
                    ? SizedBox(
                        width: MediaQuery.of(context).size.height / 1000 * 30,
                      )
                    : Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Text(
                          context
                              .watch<FormLiteralsValuesProvider>()
                              .getpasswordStatus['password_error'] as String,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                (provideWatchValues["is_password_generated"] as bool)
                    ? ThemedCardForPass()
                    : SizedBox(
                        height: MediaQuery.of(context).size.height / 1000 * 250,
                        width: MediaQuery.of(context).size.width / 4,
                        child: Image.asset('images/write.png'),
                      ),
                CheckBoxListForSetting(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ThemedButoon(
                      buttonName: 'Generate Password',
                      buttonFunction: () {
                        checkAndCreatePassWord(context);
                      },
                    ),
                    ThemedButoon(
                        buttonName: 'reset Password',
                        buttonFunction: () {
                          context
                              .read<FormLiteralsValuesProvider>()
                              .resetPassword();
                        }),
                  ],
                )
              ], //column children for main body
            ),
          ),
        ],
      ),
    );
  }
}

class BackGroundImage extends StatelessWidget {
  const BackGroundImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ColorFiltered(
      colorFilter: ColorFilter.mode(
        Colors.black.withValues(
          alpha: 0.6,
        ), // Apply a dark overlay to decrease brightness
        BlendMode.darken, // Decreases brightness
      ),
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/genbackground.jpg'),
            fit: BoxFit.cover,
            opacity: 0.9,
          ),
        ),
      ),
    );
  }
}

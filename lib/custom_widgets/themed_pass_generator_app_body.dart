import 'package:flutter/material.dart';
import 'package:password_generator_app/custom_widgets/check_box_list_for_setting.dart';
import 'package:password_generator_app/custom_widgets/themed_button.dart';
// import 'package:password_generator_app/screens/second_page.dart';
import 'package:password_generator_app/k_constants.dart';
import 'package:password_generator_app/providers/form_literals_value.dart';
import 'package:provider/provider.dart';

class ThemedPassGeneratorAppBody extends StatelessWidget {
  const ThemedPassGeneratorAppBody({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus(); // Dismiss keyboard
      },
      child: Stack(
        children: [
          BackGroundImage(), //stack image background
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Generate pass |  Ex.8",
                      textAlign: TextAlign.center,
                      style: kHeadingTextStyle,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    SizedBox(
                      width: 80,
                      height: 80,
                      child: TextField(
                        onChanged: (typedvalue) {
                          debugPrint('typed value:$typedvalue');
                          context
                              .read<FormLiteralsValues>()
                              .changeValue(typedvalue);
                        },
                        decoration: kTextFieldDecoration,
                        style: TextStyle(color: Colors.white),
                      ),
                    )
                  ], //row children
                ),
                Text(
                  '${context.watch<FormLiteralsValues>().getPasswordLength}', //action type watch data for change
                  style: kHeadingTextStyle.copyWith(
                    color: Colors.purple,
                    fontSize: 100,
                  ),
                ),
                CheckBoxListForSetting(),
                ThemedButoon(
                    buttonName: 'Generate Password', buttonFunction: () {})
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

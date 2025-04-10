import 'package:flutter/material.dart';
import 'package:password_generator_app/c_constants.dart';
import 'package:password_generator_app/providers/form_literals_value.dart';
import 'package:provider/provider.dart';

class CheckBoxListForSetting extends StatelessWidget {
  const CheckBoxListForSetting({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // for loop according to map entries and create check box tile

    return SizedBox(
      height: MediaQuery.of(context).size.height / 1000 * 345,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Text(
            "Include :",
            textAlign: TextAlign.left,
            style: cHeadingTextStyle,
          ),
          Column(
            children: context
                .watch<FormLiteralsValues>()
                .getPasswordOptions
                .entries
                .map(
              (mapEntry) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        mapEntry.key,
                        style: cHeadingTextStyle.copyWith(fontSize: 20),
                      ),
                      Checkbox(
                        checkColor: Colors.white,
                        activeColor: Colors.green,
                        value: mapEntry.value,
                        onChanged: (changedValue) {
                          context
                              .read<FormLiteralsValues>()
                              .changePasswordSetting(
                                  mapEntry.key, changedValue!);
                        },
                      ),
                    ],
                  ),
                );
              },
            ).toList(),
          )
        ],
      ),
    );
  }
}

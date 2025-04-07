import 'package:flutter/material.dart';
import 'package:password_generator_app/k_constants.dart';
import 'package:password_generator_app/providers/form_literals_value.dart';
import 'package:provider/provider.dart';

class CheckBoxListForSetting extends StatelessWidget {
  const CheckBoxListForSetting({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // for loop according to map entries and create check box tile

    return Column(
      children:
          context.watch<FormLiteralsValues>().getPasswordOptions.entries.map(
        (mapEntry) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  mapEntry.key,
                  style: kHeadingTextStyle,
                ),
                Checkbox(
                  checkColor: Colors.white,
                  activeColor: Colors.green,
                  value: mapEntry.value,
                  onChanged: (changedValue) {
                    context
                        .read<FormLiteralsValues>()
                        .changePasswordSetting(mapEntry.key, changedValue!);
                  },
                )
              ],
            ),
          );
        },
      ).toList(),
    );
  }
}

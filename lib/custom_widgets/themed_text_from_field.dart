import 'package:flutter/material.dart';

class ThemedTextFormField extends StatefulWidget {
  final String labelText;
  final String hintText;
  final IconData? leadingIcon;
  final IconData? trailingIcon;
  final bool obsecureText;
  final TextEditingController controller;

  final String? Function(String?)? validator;

  const ThemedTextFormField({
    super.key,
    required this.labelText,
    required this.hintText,
    this.leadingIcon,
    this.trailingIcon,
    this.obsecureText = false,
    this.validator,
    required this.controller,
  });

  @override
  State<ThemedTextFormField> createState() => _ThemedTextFormFieldState();
}

class _ThemedTextFormFieldState extends State<ThemedTextFormField> {
  bool _obsecure = false;
  @override
  void initState() {
    _obsecure = widget.obsecureText;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        validator: widget.validator,
        obscureText: _obsecure,
        decoration: InputDecoration(
          labelText: widget.labelText,
          hintText: widget.hintText,
          border: OutlineInputBorder(),
          floatingLabelStyle: TextStyle(
            backgroundColor:
                Colors.grey[200], // Matches the text field background
            fontSize: 16, // Adjust font size if needed
            fontWeight: FontWeight.bold, // Optional for better visibility
          ),

          prefixIcon: widget.leadingIcon != null
              ? Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(widget.leadingIcon),
                      const SizedBox(width: 8.0), // Adds spacing
                      Container(
                        height: 24, // Height of the divider
                        width: 1, // Thickness of the divider
                        color: const Color.fromARGB(
                            255, 95, 94, 94), // Divider color
                      ),
                    ],
                  ),
                )
              : null, // Handle null safely

          suffixIcon: widget.trailingIcon != null
              ? InkWell(
                  onTap: () {
                    setState(() {
                      _obsecure = !_obsecure;
                    });
                  },
                  child: Icon(
                    _obsecure == true ? Icons.visibility : Icons.visibility_off,
                  ),
                )
              : null,
          filled: true,
          fillColor: Colors.grey[200],
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue, width: 2.0),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey, width: 1.0),
          ),
        ),
      ),
    );
  }
}

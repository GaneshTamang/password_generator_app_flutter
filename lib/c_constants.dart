import 'package:flutter/material.dart';

// ! header text styles
TextStyle cHeadingTextStyle = TextStyle(
  fontSize: 30,
  fontWeight: FontWeight.w800,
  color: Colors.white,
);
// ! input decoration for passwod length
InputDecoration cTextFieldDecoration = InputDecoration(
  border: OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.white, // Set the border color here
      width: 20.0, // Border width of 20.0
    ),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.green, // Focused border color
      width: 2.0,
    ),
  ),
  labelText: 'Ex.8', // Label text for the TextField
  labelStyle: TextStyle(
    color: Colors.amber, // Label text color
  ),
);
InputDecoration cTextFormFieldDecoration = InputDecoration(
  labelText: 'Enter ID Name',
  hintText: 'abc@xyz.com',
  border: OutlineInputBorder(), // Adds a border around the field
  prefixIcon: Icon(Icons.person), // Adds an icon before the text
  suffixIcon: Icon(Icons.check), // Adds an icon after the text
  filled: true,
  fillColor: Colors.grey[200], // Background color
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.blue, width: 2.0),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.grey, width: 1.0),
  ),
);

//! Function to scale size with media query
double kResponsiveSizeWidth(BuildContext context, double pixelSize) {
  double screenWidth = MediaQuery.of(context).size.width;

  if (screenWidth < 600) {
    return pixelSize * 0.8; // Scale down for small screens (mobile)
  } else if (screenWidth < 1200) {
    return pixelSize * 1.0; // Normal size for medium screens (tablets)
  } else {
    return pixelSize * 1.2; // Scale up for large screens (desktop)
  }
}

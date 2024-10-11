import 'package:flutter/material.dart';

extension CustomStyles on TextTheme {
  TextStyle get mainHeading {
    return TextStyle(
      fontSize: 30.0,
      color: Colors.blue.shade900,
      fontWeight: FontWeight.bold,
    );
  }

  TextStyle get mediumHeading {
    return const TextStyle(
      fontSize: 18.0,
      color: Colors.black,
      fontWeight: FontWeight.bold,
    );
  }

  TextStyle get smallHeadings {
    return TextStyle(
      fontSize: 13.0,
      color: Colors.grey.shade700,
      fontWeight: FontWeight.bold,
    );
  }
}

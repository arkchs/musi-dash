import 'package:flutter/material.dart';

extension CustomStyles on TextTheme {
  TextStyle get mainHeading {
    return const TextStyle(
      fontSize: 25.0,
      fontWeight: FontWeight.bold,
    );
  }

  TextStyle get mediumHeading {
    return const TextStyle(
      fontSize: 15.0,
      fontWeight: FontWeight.bold,
    );
  }

  TextStyle get smallHeadings {
    return const TextStyle(
      fontSize: 12.0,
      fontWeight: FontWeight.bold,
    );
  }
}

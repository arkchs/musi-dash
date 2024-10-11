import 'package:flutter/material.dart';

class NeuBox extends StatelessWidget {
  final Widget? child;
  final double height;
  final double width;
  final Color? color;
  const NeuBox(
      {super.key,
      required this.child,
      required this.height,
      required this.width,
      this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
          color: color ?? Colors.white,
          borderRadius: BorderRadius.circular(20.0),
          shape: BoxShape.rectangle,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade600,
              blurRadius: 20.0,
              offset: const Offset(4, 4),
            ),
            const BoxShadow(
              color: Colors.white,
              blurRadius: 20.0,
              offset: Offset(-4, -4),
            ),
          ]),
      child: child,
    );
  }
}

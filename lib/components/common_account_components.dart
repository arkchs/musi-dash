import 'package:flutter/material.dart';
import 'package:musi/constants/theme/text_theme.dart';

class MyTextFormField extends StatelessWidget {
  final String labelText;
  final TextEditingController controller;
  final TextInputType inputType;
  String? Function(String?)? onFieldSubmitted;
  String? Function(String?)? validator;
  MyTextFormField(
      {super.key,
      required this.labelText,
      required this.controller,
      required this.inputType,
      this.onFieldSubmitted,
      this.validator});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: TextFormField(
        onFieldSubmitted: onFieldSubmitted,
        validator: validator,
        controller: controller,
        keyboardType: inputType,
        enabled: true,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.inversePrimary),
              borderRadius: const BorderRadius.all(Radius.circular(25.0))),
          labelText: labelText,
          contentPadding:
              const EdgeInsets.only(left: 20.0, top: 25.0, bottom: 25.0),
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(25.0))),
        ),
      ),
    );
  }
}

class MyButton extends StatelessWidget {
  final void Function()? onPressed;
  final String labelText;
  const MyButton({super.key, required this.labelText, this.onPressed});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
          shape: WidgetStatePropertyAll(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          )),
          fixedSize: WidgetStateProperty.all(
              Size(size.width - 48, size.height * .1)),
          backgroundColor:
              WidgetStateProperty.all(Theme.of(context).colorScheme.tertiary),
          padding: WidgetStateProperty.all(const EdgeInsets.all(16.0))),
      child: Text(
        labelText,
        style: Theme.of(context)
            .textTheme
            .mediumHeading
            .copyWith(color: Colors.white),
      ),
    );
  }
}

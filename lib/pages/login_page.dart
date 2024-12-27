import 'package:flutter/material.dart';
import 'package:musi/components/app_bar.dart';
import 'package:musi/components/common_account_components.dart';
import 'package:musi/constants/theme/text_theme.dart';
import 'package:musi/pages/register_page.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  void _submit() {
    final isValid = formKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    formKey.currentState!.save();
  }

  @override
  Widget build(BuildContext context) {
    final TextEditingController nameController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: const MyAppBar(title: 'Musi Dash'),
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: size.height * 0.02,
              ),
              Text("Sign In", style: Theme.of(context).textTheme.mainHeading),
              SizedBox(
                height: size.height * 0.04,
              ),
              MyTextFormField(
                  labelText: "Enter a Username",
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Enter a Username';
                    }
                    return null;
                  },
                  controller: nameController,
                  inputType: TextInputType.text),
              MyTextFormField(
                  labelText: "Password",
                  validator: (value) {
                    if (value!.isEmpty ||
                        !RegExp(r"^(?=.*[0-9])").hasMatch(value)) {
                      return 'Password must have digits';
                    } else if (!RegExp(r"(?=.*[a-z])").hasMatch(value)) {
                      return 'Must have a lowercase letter';
                    } else if (!RegExp(r"(?=.*[A-Z])").hasMatch(value)) {
                      return 'Must have a uppercase letter';
                    } else if (!RegExp(r"(?=.*[A-Z])").hasMatch(value)) {
                      return 'Must have a uppercase letter';
                    } else if (!RegExp(r"(?=.*[@#$%^&+=])").hasMatch(value)) {
                      return 'Must have a special character';
                    } else if (!RegExp(r"(?=\S+$).{8,20}$").hasMatch(value)) {
                      return 'Must be between 8 and 20 characters long';
                    }
                    return null;
                  },
                  controller: passwordController,
                  inputType: TextInputType.visiblePassword),
              SizedBox(
                height: size.height * 0.02,
              ),
              MyButton(
                labelText: "Sign In",
                onPressed: _submit,
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              const Expanded(
                child: SizedBox(),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 40.0),
                child: _signupText(context),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Row _signupText(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Not a member?", style: Theme.of(context).textTheme.smallHeadings),
        GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const SignUpScreen()));
          },
          child: Text(" Sign Up",
              style: Theme.of(context)
                  .textTheme
                  .smallHeadings
                  .copyWith(color: Theme.of(context).colorScheme.primary)),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:musi/components/app_bar.dart';
import 'package:musi/components/common_account_components.dart';
import 'package:musi/constants/theme/text_theme.dart';
import 'package:musi/pages/login_page.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void _submit() async {
    final isValid = formKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    formKey.currentState!.save();

    try {
      final response = await http.post(
        Uri.parse('http://localhost:8000/api/auth/register'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'username': nameController.text,
          'email': emailController.text,
          'password': passwordController.text,
        }),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        // Handle successful registration
        print('Registration successful: ${data['token']}');
        // Navigate to login page
        if (mounted) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const LoginScreen()),
          );
        }
      } else {
        final error = json.decode(response.body);
        // Show error message to user
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(error['msg'] ?? 'Registration failed')),
          );
        }
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Connection error. Please try again. $e')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
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
              Text("Register", style: Theme.of(context).textTheme.mainHeading),
              SizedBox(
                height: size.height * 0.04,
              ),
              MyTextFormField(
                  labelText: 'Enter a Username',
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Enter a Username';
                    }
                    return null;
                  },
                  controller: nameController,
                  inputType: TextInputType.text),
              MyTextFormField(
                  labelText: 'Enter Your Email',
                  validator: (value) {
                    if (value!.isEmpty ||
                        !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(value)) {
                      return 'Enter a valid email';
                    }
                    return null;
                  },
                  controller: emailController,
                  inputType: TextInputType.emailAddress),
              MyTextFormField(
                  labelText: 'Password',
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
                labelText: "Sign Up",
                onPressed: _submit,
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              const Expanded(
                child: SizedBox(),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 30.0),
                child: _signupText(context),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    nameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Row _signupText(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Already a member?",
            style: Theme.of(context).textTheme.smallHeadings),
        GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const LoginScreen()));
          },
          child: Text(" Sign In",
              style: Theme.of(context)
                  .textTheme
                  .smallHeadings
                  .copyWith(color: Theme.of(context).colorScheme.primary)),
        ),
      ],
    );
  }
}

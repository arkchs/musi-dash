import 'package:flutter/material.dart';
import 'package:musi/constants/theme/text_theme.dart';
import 'package:musi/pages/register_page.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: _basicAppBar(context),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Form(
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
              _userName(context),
              _password(context),
              SizedBox(
                height: size.height * 0.02,
              ),
              _button(size, context),
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

  AppBar _basicAppBar(BuildContext context) {
    return AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        title: ShaderMask(
          shaderCallback: (bounds) => const LinearGradient(
            colors: [Colors.blue, Colors.green],
            tileMode: TileMode.mirror,
          ).createShader(bounds),
          child: Hero(
            flightShuttleBuilder: (flightContext, animation, flightDirection,
                fromHeroContext, toHeroContext) {
              return Container(
                width: 10.0,
                height: 10.0,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.blue,
                ),
              );
            },
            tag: 'title',
            child: Text(
              "Musi Dash",
              style: Theme.of(context)
                  .textTheme
                  .mainHeading
                  .copyWith(color: Colors.white),
            ),
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, size: 15),
          onPressed: () {
            Navigator.pop(context);
          },
        ));
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

  Padding _password(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: TextFormField(
        enabled: true,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.inversePrimary),
              borderRadius: const BorderRadius.all(Radius.circular(25.0))),
          labelText: 'Password',
          contentPadding:
              const EdgeInsets.only(left: 20.0, top: 25.0, bottom: 25.0),
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(25.0))),
        ),
      ),
    );
  }

  Padding _userName(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: TextFormField(
        enabled: true,
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: Theme.of(context).colorScheme.inversePrimary),
                borderRadius: const BorderRadius.all(Radius.circular(25.0))),
            labelText: 'Enter Email or Username',
            contentPadding:
                const EdgeInsets.only(left: 20.0, top: 25.0, bottom: 25.0),
            border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(25.0)))),
      ),
    );
  }

  TextButton _button(Size size, BuildContext context) {
    return TextButton(
      onPressed: () {},
      style: ButtonStyle(
          shape: MaterialStatePropertyAll(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          )),
          fixedSize: MaterialStateProperty.all(
              Size(size.width - 48, size.height * .1)),
          backgroundColor:
              MaterialStateProperty.all(Theme.of(context).colorScheme.tertiary),
          padding: MaterialStateProperty.all(const EdgeInsets.all(16.0))),
      child: Text(
        "Sign In",
        style: Theme.of(context).textTheme.mediumHeading,
      ),
    );
  }
}

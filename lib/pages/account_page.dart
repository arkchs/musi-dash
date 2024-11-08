import 'package:flutter/material.dart';
import 'package:musi/constants/theme/text_theme.dart';
import 'package:musi/pages/login_page.dart';
import 'package:musi/pages/register.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(Icons.arrow_back_ios),
      )),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ShaderMask(
              shaderCallback: (bounds) => const LinearGradient(
                colors: [Colors.blue, Colors.green],
                tileMode: TileMode.mirror,
              ).createShader(bounds),
              child: Text(
                "Musi Dash",
                style: Theme.of(context)
                    .textTheme
                    .mainHeading
                    .copyWith(color: Colors.white, fontSize: 40),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Text("Enjoy listening to Music?",
                style: Theme.of(context).textTheme.mainHeading),
            Text("Never Miss a Song!",
                style: Theme.of(context).textTheme.mainHeading),
            const SizedBox(
              height: 10.0,
            ),
            Text(
                "Musi Dash a foss youtube-music client. \n Choose from a massive collection of songs",
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .mediumHeading
                    .copyWith(fontWeight: FontWeight.w500)),
            const SizedBox(
              height: 20.0,
            ),
            _buttons(context)
          ],
        ),
      ),
    );
  }

  Padding _buttons(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 1,
            child: TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SignUpScreen()));
              },
              style: ButtonStyle(
                  shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  )),
                  backgroundColor: MaterialStateProperty.all(
                      Theme.of(context).colorScheme.primary),
                  padding:
                      MaterialStateProperty.all(const EdgeInsets.all(16.0))),
              child: Text(
                "Register",
                style: Theme.of(context)
                    .textTheme
                    .mediumHeading
                    .copyWith(color: Colors.white),
              ),
            ),
          ),
          const SizedBox(
            width: 10.0,
          ),
          Expanded(
            flex: 1,
            child: TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LoginScreen()));
              },
              style: ButtonStyle(
                  shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  )),
                  backgroundColor: MaterialStateProperty.all(
                      Theme.of(context).colorScheme.background),
                  padding:
                      MaterialStateProperty.all(const EdgeInsets.all(16.0))),
              child: Text(
                "Sign In",
                style: Theme.of(context)
                    .textTheme
                    .mediumHeading
                    .copyWith(color: Colors.black),
              ),
            ),
          )
        ],
      ),
    );
  }
}

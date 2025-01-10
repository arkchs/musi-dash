import 'package:flutter/material.dart';
import 'package:musi/constants/theme/text_theme.dart';
import 'package:musi/pages/login_page.dart';
import 'package:musi/pages/register_page.dart';

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
          backgroundColor: Theme.of(context).colorScheme.surface,
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
              child: Hero(
                flightShuttleBuilder: (flightContext, animation,
                    flightDirection, fromHeroContext, toHeroContext) {
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
                      .copyWith(color: Colors.white, fontSize: 40),
                ),
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
                  shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  )),
                  backgroundColor: WidgetStateProperty.all(
                      Theme.of(context).colorScheme.tertiary),
                  padding:
                      WidgetStateProperty.all(const EdgeInsets.all(16.0))),
              child: Text("Register",
                  style: Theme.of(context).textTheme.mediumHeading),
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
                  shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  )),
                  backgroundColor: WidgetStateProperty.all(
                      Theme.of(context).colorScheme.surface),
                  padding:
                      WidgetStateProperty.all(const EdgeInsets.all(16.0))),
              child: Text(
                "Sign In",
                style: Theme.of(context).textTheme.mediumHeading,
              ),
            ),
          )
        ],
      ),
    );
  }
}

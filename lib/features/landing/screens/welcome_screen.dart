import 'package:flutter/material.dart';
import 'package:my_chat_app/colors.dart';
import 'package:my_chat_app/common/widgets/custom_button.dart';
import 'package:my_chat_app/features/auth/pages/login_page.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  void navigateToLoginPage(BuildContext context) {
    Navigator.pushNamed(context, LoginPage.routeName);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/welcome_screen.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SafeArea(
            child: Center(
              child: Column(
                children: [
                  const SizedBox(height: 50),
                  const Text(
                    'Welcome!',
                    style: TextStyle(
                      fontFamily: 'BigShouldersStencil',
                      fontSize: 55,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      shadows: [
                        Shadow(
                          blurRadius: 10,
                          color: Colors.black,
                          offset: Offset(2, 2),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  const Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Text(
                      'Read our Privacy Policy. Tap "Agree and continue" to accept the Terms of Service.',
                      style:
                          TextStyle(color: Color.fromARGB(255, 216, 215, 215)),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: size.width * 0.75,
                    child: GradientButton(
                      onPressed: () => navigateToLoginPage(context),
                      buttonWidth: 350,
                      buttonHeight: 60,
                      firstGradientColor: gradientColor1,
                      secondGradientColor: gradientColor2,
                      buttonText: "Agree and continue",
                    ),
                  ),
                  const SizedBox(height: 50),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

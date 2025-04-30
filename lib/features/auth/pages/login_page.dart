import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_chat_app/colors.dart';
import 'package:my_chat_app/common/widgets/custom_button.dart';
import 'package:my_chat_app/features/auth/controller/auth_controller.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});
  static const routeName = '/login-page';

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final phoneController = TextEditingController();
  CountryCode? selectedCountry = CountryCode.fromCountryCode('RU');

  @override
  void dispose() {
    super.dispose();
    phoneController.dispose();
  }

  void sendPhoneNumber() {
    String phoneNumber = phoneController.text.trim();
    if (selectedCountry != null && phoneNumber.isNotEmpty) {
      ref.read(authControllerProvider).singInWithPhone(context, phoneNumber);
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Enter your phone number',
          style: TextStyle(
            fontFamily: 'BigShouldersStencil',
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        elevation: 0,
        backgroundColor: backgroundColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'We will need to verify your phone number!',
              style: TextStyle(fontSize: 15),
            ),
            const SizedBox(
              height: 10,
            ),
            CountryCodePicker(
              onChanged: (CountryCode country) {
                setState(() {
                  selectedCountry = country;
                });
              },
              initialSelection: 'RU',
              favorite: const ['US', 'IN', 'BR', 'RU'],
              showCountryOnly: false,
              showOnlyCountryWhenClosed: false,
              alignLeft: false,
              showFlag: true,
              flagWidth: 30,
              padding: EdgeInsets.zero,
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              children: [
                if (selectedCountry != null)
                  Text(
                    selectedCountry!.dialCode ?? '',
                    style: const TextStyle(fontSize: 18),
                  ),
                const SizedBox(
                  width: 10,
                ),
                SizedBox(
                  width: size.width * 0.7,
                  child: TextField(
                    style: const TextStyle(fontSize: 18),
                    controller: phoneController,
                    decoration: const InputDecoration(
                      hintText: 'phone number',
                      hintStyle: TextStyle(fontSize: 18),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: size.height * 0.6),
            GradientButton(
              onPressed: () {},
              buttonWidth: 90,
              buttonHeight: 60,
              firstGradientColor: gradientColor1,
              secondGradientColor: gradientColor2,
              buttonText: "NEXT",
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:my_chat_app/common/widgets/error.dart';
import 'package:my_chat_app/features/auth/pages/login_page.dart';
import 'package:my_chat_app/features/auth/pages/otp_page.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case LoginPage.routeName:
      return MaterialPageRoute(
        builder: (context) => const LoginPage(),
      );
    case OTPPage.routeName:
      return MaterialPageRoute(
        builder: (context) => const OTPPage(),
      );
    default:
      return MaterialPageRoute(
        builder: (context) => const Scaffold(
          body: ErrorPage(error: "This page doesn't exist"),
        ),
      );
  }
}

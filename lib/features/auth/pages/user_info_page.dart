import 'package:flutter/material.dart';

class UserInfoPage extends StatelessWidget {
  static const String routeName = '/user-info';
  const UserInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Stack(
                children: [
                  const CircleAvatar(
                    backgroundImage: NetworkImage(''),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.add_a_photo),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

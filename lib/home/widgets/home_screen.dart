import 'package:flutter/material.dart';

final class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text('Welcome to the Home Screen!'),
          SizedBox(height: 20),
          Text('This is where you can find various features and information.'),
        ],
      ),
    );
  }
}

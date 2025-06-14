import 'package:flutter/material.dart';

final class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Enter the VIN of the vehicle you are looking for',
              border: const OutlineInputBorder(),
            ),
            keyboardType: TextInputType.text,
            maxLength: 17,
            buildCounter: (context, {required currentLength, required isFocused, required maxLength}) => const SizedBox.shrink(),
          ),
        ),
      ],
    );
  }
}

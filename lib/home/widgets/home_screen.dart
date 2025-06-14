import 'package:cos/home/view_model/home_view_model.dart';
import 'package:flutter/material.dart';

final class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
    required this.viewModel,
  });

  final HomeViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: viewModel,
      builder: (context, child) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Enter the VIN of the vehicle you are looking for',
                  border: const OutlineInputBorder(),
                  suffixIcon: Icon(Icons.search),
                  errorText: viewModel.vniError,
                ),
                keyboardType: TextInputType.text,
                onChanged: viewModel.onVniChanged,
                maxLength: 17,
              ),
            ),
          ],
        );
      },
    );
  }
}

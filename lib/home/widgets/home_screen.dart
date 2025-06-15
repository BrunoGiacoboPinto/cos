import 'package:cos/home/view_model/home_view_model.dart';
import 'package:flutter/material.dart';

final class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
    required this.viewModel,
  });

  final HomeViewModel viewModel;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final TextEditingController _textController;

  @override
  void initState() {
    super.initState();
    _textController = TextEditingController();
    widget.viewModel.addListener(_onValidVNI);
  }

  @override
  void dispose() {
    _textController.dispose();
    widget.viewModel.removeListener(_onValidVNI);
    super.dispose();
  }

  void _onValidVNI() {
    if (widget.viewModel.state is HomeScreenVNIValid || widget.viewModel.state is HomeScreenInitial) {
      _textController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: widget.viewModel,
      builder: (context, child) {
        final state = widget.viewModel.state;

        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: _textController,
                decoration: InputDecoration(
                  hintText: 'Enter the VIN of the vehicle you are looking for',
                  border: const OutlineInputBorder(),
                  suffixIcon: Icon(Icons.search),
                  errorText: state is HomeScreenVNIError ? state.error : null,
                ),
                keyboardType: TextInputType.text,
                onChanged: widget.viewModel.onVniChanged,
                maxLength: 17,
              ),
            ),

            AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child: switch (state) {
                HomeScreenInitial() => const SizedBox.shrink(),
                HomeScreenVNIValid() => const Text('VIN is valid!'),
                HomeScreenVNIError(error: final error) => Text('Error: $error'),
                HomeScreenCarAuctionLoaded(data: final data, choices: final choices) => Column(
                  children: [
                    Text('Car Auction Data: ${data.make} ${data.model}'),
                    ...choices.map((choice) => Text('Choice: ${choice.make} ${choice.model}')),
                  ],
                ),
                HomeScreenError(error: final error) => Text('Error: $error'),
                HomeScreenLoading() => Center(
                  child: CircularProgressIndicator(),
                ),
              },
            ),
          ],
        );
      },
    );
  }
}

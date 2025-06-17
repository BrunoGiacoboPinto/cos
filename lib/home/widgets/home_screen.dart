import 'package:cos/domain/model/car_auction.dart';
import 'package:cos/home/view_model/home_view_model.dart';
import 'package:cos/ui/core/ui/theme/spacing.dart';
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
    return Column(
      children: [
        spacing2Xl,
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListenableBuilder(
            listenable: widget.viewModel,
            builder: (context, child) {
              return TextField(
                controller: _textController,
                decoration: InputDecoration(
                  hintText: 'Enter the VIN of the vehicle you are looking for',
                  border: const OutlineInputBorder(),
                  suffixIcon: Icon(Icons.search),
                  errorText: switch (widget.viewModel.state) {
                    HomeScreenVNIError(error: final error) => error,
                    _ => null,
                  },
                ),
                keyboardType: TextInputType.text,
                onChanged: widget.viewModel.onVniChanged,
                maxLength: 17,
              );
            },
          ),
        ),
        Expanded(
          child: ListenableBuilder(
            listenable: widget.viewModel,
            builder: (context, child) {
              return AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                child: switch (widget.viewModel.state) {
                  HomeScreenInitial() || HomeScreenVNIValid() || HomeScreenVNIError() => const SizedBox.shrink(),
                  HomeScreenLoading() => Center(child: const CircularProgressIndicator()),
                  HomeScreenError(error: final error) => Text(error.message, style: TextStyle(color: Colors.red)),
                  HomeScreenCarAuctionLoaded(data: final data) => HomeScreenCarAuctionView(model: data),
                },
              );
            },
          ),
        ),
      ],
    );
  }
}

@visibleForTesting
final class HomeScreenCarAuctionView extends StatelessWidget {
  const HomeScreenCarAuctionView({
    super.key,
    required this.model,
  });

  final CarAuctionModel model;

  @override
  Widget build(BuildContext context) {
    return switch (model) {
      CarAuctionWithData(data: final CarAuctionWithDataModel data) => Text(
        'CarAuctionWithDataModel: ${data.make} ${data.model} - \$${data.price}',
        style: TextStyle(color: Colors.red),
      ),
      CarAuctionWithChoices(choices: final choices) => Center(
        child: ListView.builder(
          itemCount: choices.length, // No choices available
          itemBuilder: (context, index) {
            final choice = choices.elementAt(index);
            return ListTile(
              title: Text(
                '${choice.make} ${choice.model}',
                style: TextStyle(color: Colors.red),
              ),
            );
          },
        ),
      ),
      CarAuctionWithError(error: final error) => Center(
        child: Text(error.message, style: TextStyle(color: Colors.red)),
      ),
      CarAuctionModel() => throw UnimplementedError(),
    };
  }
}

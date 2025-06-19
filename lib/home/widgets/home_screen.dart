import 'package:cos/domain/model/car_auction.dart';
import 'package:cos/home/view_model/home_view_model.dart';
import 'package:cos/ui/core/ui/auction_card.dart';
import 'package:cos/ui/core/ui/vehicle_auction_list.dart';
import 'package:cos/ui/core/ui/theme/colors.dart';
import 'package:cos/ui/core/ui/theme/spacing.dart';
import 'package:cos/ui/core/ui/vehicle_similarity_list.dart';
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
  late final FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _textController = TextEditingController();
    widget.viewModel.addListener(_onValidVNI);
    _textController.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _textController.removeListener(_onFocusChange);
    _textController.dispose();
    widget.viewModel.removeListener(_onValidVNI);
    super.dispose();
  }

  void _onFocusChange() {
    if (_focusNode.hasFocus && _textController.text.isEmpty) {
      _focusNode.unfocus();
    }
  }

  void _onValidVNI() {
    if (widget.viewModel.state is HomeScreenVNIValid || widget.viewModel.state is HomeScreenInitial) {
      _textController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        spacing2Xl,
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListenableBuilder(
            listenable: widget.viewModel,
            builder: (context, child) {
              return TextField(
                focusNode: _focusNode,
                controller: _textController,
                decoration: InputDecoration(
                  hintText: 'Enter the VIN of the vehicle you are looking for',
                  border: const OutlineInputBorder(),
                  suffixIcon: Icon(Icons.search, color: orange),
                  errorStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: orange,
                    fontWeight: FontWeight.w500,
                    height: 1.4,
                  ),
                  errorText: switch (widget.viewModel.state) {
                    HomeScreenVNIError(error: final error) => error,
                    _ => null,
                  },
                ),
                keyboardType: TextInputType.text,
                onChanged: widget.viewModel.onVniChanged,
                maxLength: 17,
                onTapOutside: (event) => _focusNode.unfocus(),
                onTapUpOutside: (event) => _focusNode.unfocus(),
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
                  HomeScreenVNIValid() || HomeScreenVNIError() => const HomeScreenSearchView(),
                  HomeScreenInitial(data: final data) => HomeScreenInitialView(initialData: data),
                  HomeScreenLoading() => Center(child: const CircularProgressIndicator()),
                  HomeScreenError(error: final error) => HomeScreenErrorView(error: error.message),
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
final class HomeScreenInitialView extends StatelessWidget {
  const HomeScreenInitialView({
    super.key,
    required this.initialData,
  });

  final Map<String, CarAuctionModel> initialData;

  @override
  Widget build(BuildContext context) {
    return initialData.isEmpty //
        ? const HomeScreenSearchView()
        : VehicleAuctionList(models: initialData);
  }
}

@visibleForTesting
final class HomeScreenSearchView extends StatelessWidget {
  const HomeScreenSearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/car_search.png',
            width: 135,
            height: 135,
            fit: BoxFit.cover,
            color: lightBlue,
          ),
          spacingMd,
          Text(
            'Search for a car by VIN',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w500,
              color: lightBlue,
            ),
          ),
        ],
      ),
    );
  }
}

@visibleForTesting
final class HomeScreenErrorView extends StatelessWidget {
  const HomeScreenErrorView({super.key, required this.error});

  final String error;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/car_broken.png',
            width: 135,
            height: 135,
            fit: BoxFit.fitWidth,
            color: lightBlue,
          ),
          spacingMd,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: spaceLg),
            child: Text(
              'Oops! Something went wrong.',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: lightBlue,
              ),
            ),
          ),
          spacingSm,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: space2Xl),
            child: Text(
              error,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w500,
                color: lightBlue,
              ),
            ),
          ),
          spacingSm,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: space2Xl),
            child: Text(
              'Please try again later.',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w400,
                color: lightBlue,
              ),
            ),
          ),
        ],
      ),
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
      CarAuctionWithData(data: final CarAuctionWithDataModel data) => AuctionCard(model: data),
      CarAuctionWithChoices(choices: final choices) => VehicleSimilarityList(choices: choices),
      CarAuctionWithError(error: final error) => Center(
        child: Column(
          children: [
            Image.asset(
              'assets/images/car_broken.png',
              width: 135,
              height: 135,
              fit: BoxFit.fitWidth,
              color: lightBlue,
            ),
            spacingMd,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: spaceLg),
              child: Text(
                'Oops! Something went wrong.',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: lightBlue,
                ),
              ),
            ),
            spacingSm,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: space2Xl),
              child: Text(
                error.message,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w500,
                  color: lightBlue,
                ),
              ),
            ),
          ],
        ),
      ),
      CarAuctionModel() => const SizedBox.shrink(),
    };
  }
}

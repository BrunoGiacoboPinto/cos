import 'package:cos/domain/model/car_auction.dart';
import 'package:cos/home/view_model/home_view_model.dart';
import 'package:cos/ui/core/widgets/vechicle_auction_card.dart';
import 'package:cos/ui/core/widgets/vehicle_auction_list.dart';
import 'package:cos/ui/core/ui/theme/colors.dart';
import 'package:cos/ui/core/ui/theme/spacing.dart';
import 'package:cos/ui/core/widgets/vehicle_similarity_list.dart';
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
        return AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          child: switch (viewModel.state) {
            HomeScreenVNIValid() || HomeScreenVNIError() => const HomeScreenSearchView(),
            HomeScreenInitial(data: final data) => HomeScreenInitialView(initialData: data),
            HomeScreenLoading() => Center(child: const CircularProgressIndicator()),
            HomeScreenError(error: final error) => HomeScreenErrorView(error: error.message),
            HomeScreenCarAuctionLoaded(data: final data) => HomeScreenCarAuctionView(model: data),
          },
        );
      },
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
      CarAuctionWithData(data: final CarAuctionWithDataModel data) => VehicleAuctionCard(model: data),
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

import 'package:cos/ui/core/ui/theme/colors.dart';
import 'package:cos/ui/core/ui/theme/spacing.dart';
import 'package:cos/ui/core/ui/vehicle_auction_list.dart';
import 'package:cos/vehicle_auction/view_model/vehicle_auction_view_model.dart';
import 'package:flutter/material.dart';

final class VehicleAuctionScreen extends StatelessWidget {
  const VehicleAuctionScreen({
    super.key,
    required this.viewModel,
  });

  final VehicleAuctionViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        spacing2Xl,
        Center(
          child: Text(
            'Last vehicles auctioned',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: lightBlue,
            ),
          ),
        ),
        spacingSm,
        Expanded(
          child: ListenableBuilder(
            listenable: viewModel,
            builder: (context, child) {
              return DefaultTextStyle(
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: lightBlue,
                ),
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  child: switch (viewModel.state) {
                    VehicleAuctionScreenStateInitial() => const Center(child: Text('No Vehicle Auction has been made yet')),
                    VehicleAuctionScreenStateLoading() => const Center(child: CircularProgressIndicator()),
                    VehicleAuctionScreenStateLoaded(data: final data) => VehicleAuctionList(models: data),
                    VehicleAuctionScreenStateError(error: final error) => Center(child: Text('Error: $error')),
                  },
                ),
              );
            }, 
          ),
        ),
      ],
    );
  }
}

import 'package:cos/ui/core/ui/theme/colors.dart';
import 'package:cos/ui/core/widgets/vehicle_auction_list.dart';
import 'package:cos/vehicle_auction/view_model/vehicle_auction_view_model.dart';
import 'package:flutter/material.dart';

final class VehicleAuctionScreen extends StatefulWidget {
  const VehicleAuctionScreen({
    super.key,
    required this.viewModel,
  });

  final VehicleAuctionViewModel viewModel;

  @override
  State<VehicleAuctionScreen> createState() => _VehicleAuctionScreenState();
}

class _VehicleAuctionScreenState extends State<VehicleAuctionScreen> {
  @override
  void initState() {
    super.initState();
    widget.viewModel.loadVehicleAuctionData();
  }

  @override
  void didUpdateWidget(covariant VehicleAuctionScreen oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.viewModel != oldWidget.viewModel) {
      widget.viewModel.loadVehicleAuctionData();
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: widget.viewModel,
      builder: (context, child) {
        return DefaultTextStyle(
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            color: lightBlue,
          ),
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: switch (widget.viewModel.state) {
              VehicleAuctionScreenStateInitial() => const Center(child: Text('No Vehicle Auction has been made yet')),
              VehicleAuctionScreenStateLoading() => const Center(child: CircularProgressIndicator()),
              VehicleAuctionScreenStateLoaded(data: final data) =>
                data.isEmpty //
                    ? const Center(child: Text('No Vehicle Auction has been made yet'))
                    : VehicleAuctionList(models: data),
              VehicleAuctionScreenStateError(error: final error) => Center(child: Text('Error: $error')),
            },
          ),
        );
      },
    );
  }
}

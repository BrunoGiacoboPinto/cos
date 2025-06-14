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
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text('Welcome to the Vehicle Auction!'),
          SizedBox(height: 20),
          Text('Here you can bid on various vehicles.'),
        ],
      ),
    );
  }
}

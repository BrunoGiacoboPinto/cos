import 'package:cos/domain/model/car_auction.dart';
import 'package:cos/ui/core/ui/theme/colors.dart';
import 'package:cos/ui/core/ui/theme/spacing.dart';
import 'package:flutter/material.dart';

final class VehicleAuctionDetail extends StatelessWidget {
  const VehicleAuctionDetail({
    super.key,
    required this.model,
  });

  final CarAuctionWithDataModel model;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.onSurface,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.onSurface,
        iconTheme: IconThemeData(color: lightBlue),
        title: Text(
          '${model.make} ${model.model}',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
            color: lightBlue,
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Hero(
              tag: 'vehidle_auction_image_${model.id}',
              child: Image.asset(
                'assets/images/toyota_gt_86.png',
                fit: BoxFit.cover,
              ),
            ),
            spacingSm,
            Card(
              elevation: 4.0,
              child: SizedBox(
                width: MediaQuery.of(context).size.width - spaceXl,
                child: Padding(
                  padding: const EdgeInsets.all(spaceMd),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Market price:',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        '\$${model.price.toStringAsFixed(2)}',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:cos/domain/model/car_auction.dart';
import 'package:cos/routing/routes.dart';
import 'package:cos/ui/core/ui/theme/spacing.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final class VehicleAuctionCard extends StatelessWidget {
  const VehicleAuctionCard({
    super.key,
    required this.model,
  });

  final CarAuctionWithDataModel model;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      child: SizedBox(
        width: MediaQuery.of(context).size.width - spaceXl,
        child: Padding(
          padding: const EdgeInsets.all(spaceMd),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  Text(
                    '${model.make} ${model.model}',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Hero(
                    tag: 'vehidle_auction_image_${model.id}',
                    child: Image.asset(
                      'assets/images/toyota_gt_86.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
              Column(
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
              spacingMd,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Customer experience:',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    model.positiveCustomerFeedback ? 'Positive' : 'Negative',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: const CircleBorder(),
                        backgroundColor: Theme.of(context).colorScheme.secondary,
                      ),
                      onPressed: () {
                        context.push(AppRoutes.details.path, extra: model);
                      },
                      child: Icon(Icons.arrow_forward),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

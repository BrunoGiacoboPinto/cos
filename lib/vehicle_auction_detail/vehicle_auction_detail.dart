import 'package:cos/domain/model/car_auction.dart';
import 'package:cos/ui/core/ui/theme/colors.dart';
import 'package:cos/ui/core/ui/theme/spacing.dart';
import 'package:cos/ui/core/widgets/vehicle_detail_item.dart';
import 'package:flutter/material.dart';
import 'package:intersperse/intersperse.dart';
import 'package:intl/intl.dart';

final class VehicleAuctionDetail extends StatelessWidget {
  const VehicleAuctionDetail({
    super.key,
    required this.model,
  });

  final CarAuctionWithDataModel model;
  static final _dateFormat = DateFormat.yMd('en_US');

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
        actions: [
          IconButton(
            icon: const Icon(Icons.share),
            onPressed: () {},
          ),
        ],
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
                      ...intersperse(
                        spacingSm,
                        [
                          VehicleDetailItem(
                            title: 'Identifier',
                            subtitle: model.externalId,
                          ),
                          VehicleDetailItem(
                            title: 'Market price',
                            subtitle: '\$${model.price.toStringAsFixed(2)}',
                          ),
                          VehicleDetailItem(
                            title: 'Customer experience',
                            subtitle: model.positiveCustomerFeedback ? 'Positive' : 'Negative',
                          ),
                          VehicleDetailItem(
                            title: 'Origin',
                            subtitle: model.origin,
                          ),
                          VehicleDetailItem(
                            title: 'Inspection date',
                            subtitle: _dateFormat.format(model.inspectorRequestedAt),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: spaceMd),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.secondary,
                  foregroundColor: lightBlue,
                  minimumSize: const Size.fromHeight(50),
                ),
                onPressed: () {},
                child: const Text('Place bid'),
              ),
            ),
            SizedBox(
              height: MediaQuery.viewInsetsOf(context).bottom + spaceMd,
            ),
          ],
        ),
      ),
    );
  }
}

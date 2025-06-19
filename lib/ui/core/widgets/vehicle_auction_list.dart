import 'package:cos/domain/model/car_auction.dart';
import 'package:cos/ui/core/widgets/vechicle_auction_card.dart';
import 'package:cos/ui/core/ui/theme/spacing.dart';
import 'package:flutter/widgets.dart';

final class VehicleAuctionList extends StatelessWidget {
  const VehicleAuctionList({
    super.key,
    required this.models,
  });

  final Map<String, CarAuctionModel> models;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(spaceSm),
      itemCount: models.length,
      itemBuilder: (context, index) {
        final key = models.keys.elementAt(index);
        final model = models[key];
        if (model case CarAuctionWithData(data: final CarAuctionWithDataModel data)) {
          return VehicleAuctionCard(model: data);
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}

import 'package:cos/domain/model/car_auction.dart';
import 'package:cos/ui/core/ui/theme/colors.dart';
import 'package:cos/ui/core/ui/theme/spacing.dart';
import 'package:flutter/material.dart';

final class VehicleSimilarityList extends StatelessWidget {
  const VehicleSimilarityList({super.key, required this.choices});

  final Set<CarAuctionChoiceModel> choices;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Similar Vehicles',
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.w600,
            color: lightBlue,
          ),
        ),
        spacingXl,
        Card(
          elevation: 4,
          child: SizedBox(
            width: MediaQuery.of(context).size.width - spaceXl,
            child: ListView.separated(
              shrinkWrap: true,
              itemCount: choices.length,
              itemBuilder: (context, index) {
                final choice = choices.elementAt(choices.length - index - 1);
                return ListTile(
                  title: Text(
                    '${choice.make} ${choice.model}',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w500,
                      color: pureBlack,
                    ),
                  ),
                  subtitle: Row(
                    children: [
                      Text(
                        'Similarity:',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w400,
                          color: darkGray.withValues(alpha: 0.7),
                        ),
                      ),
                      spacingSm,
                      DecoratedBox(
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.tertiary,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0),
                          child: Text(
                            '${choice.similarity.toStringAsFixed(2)}%',
                            style: Theme.of(context).textTheme.labelMedium?.copyWith(
                              fontWeight: FontWeight.w400,
                              color: pureWhite,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    color: Theme.of(context).colorScheme.secondary.withValues(alpha: 0.7),
                  ),
                  //subtitle: Text(choice.description),
                  onTap: () {
                    // Handle tap on the choice
                  },
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return Divider(
                  color: darkGray.withValues(alpha: 0.5),
                  height: 1,
                  thickness: 1,
                  endIndent: spaceSm,
                  indent: spaceSm,
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}

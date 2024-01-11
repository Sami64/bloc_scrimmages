import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/util/medication_helper.dart';
import '../../domain/entities/medication.dart';

/// Medication Card
class MedicationCard extends StatelessWidget {
  /// Constructor
  const MedicationCard(
      {required this.title,
      required this.dosage,
      required this.consumptionPeriods,
      required this.frequency,
      super.key});

  /// Title
  final String title;

  /// Dosage
  final String dosage;

  /// Frequency
  final String frequency;

  /// Consumption Periods
  final List<MedicationConsumptionPeriod> consumptionPeriods;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('$title,$dosage',
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(fontWeight: FontWeight.w900)),
            Text(frequency,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(fontWeight: FontWeight.w500)),
            const Spacer(),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: MedicationConsumptionPeriod.values
                  .map((e) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 2),
                        child: CircleAvatar(
                          radius: 15,
                          backgroundColor: consumptionPeriods.contains(e)
                              ? Theme.of(context).primaryColor.withOpacity(0.2)
                              : Colors.transparent,
                          child: SvgPicture.asset(
                            MedicationHelper.iconForConsumptionPeriod(e),
                            color: consumptionPeriods.contains(e)
                                ? Theme.of(context).primaryColor
                                : Colors.grey,
                          ),
                        ),
                      ))
                  .toList(),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

/// Tracking Card
class TrackingCard extends StatelessWidget {
  /// Constructor
  const TrackingCard({super.key});

  @override
  Widget build(BuildContext context) {
    /// Input Value
    const value = 20;
    const underweightUpperLimit = 30;
    const optimalUpperLimit = 50;
    const overweightUpperLimit = 100;
    const totalRange = overweightUpperLimit;

    return Card(
      // clipBehavior: Clip.antiAlias,
      margin: const EdgeInsets.all(8),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Feb 15, 2023',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'B12',
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                Text(
                  '173 pg/ml',
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(color: Colors.red),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 10),
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color: Colors.red[100],
                      borderRadius: BorderRadius.circular(15)),
                  child: const Text(
                    'Off Track',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.red, // Change as per your color requirement
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 35,
              // padding: const EdgeInsets.symmetric(vertical: 10),
              child: LayoutBuilder(builder: (context, constraints) {
                final maxWidth = constraints
                    .maxWidth; // The maximum width available for the colored containers

                // Calculate the widths of the colored containers as a fraction of the total width
                final underweightWidth =
                    (underweightUpperLimit / totalRange) * maxWidth;
                final optimalWidth =
                    ((optimalUpperLimit - underweightUpperLimit) / totalRange) *
                        maxWidth;
                final overweightWidth =
                    maxWidth - underweightWidth - optimalWidth;

                // Calculate the position of the circle.
                final circlePosition = (value / totalRange) * maxWidth;

                return Stack(
                  alignment: Alignment.centerLeft,
                  children: [
                    Row(
                      children: <Widget>[
                        Container(
                          height: 3,
                          width: underweightWidth,
                          color: Colors.red,
                        ),
                        Container(
                          height: 3,
                          width: optimalWidth,
                          color: Colors.green,
                        ),
                        Container(
                          height: 3,
                          width: overweightWidth,
                          color: Colors.red,
                        ),
                      ],
                    ),
                    Positioned(
                      left:
                          circlePosition - 10, // Adjusted to center the circle
                      child: Tooltip(
                        message: 'Your B12 level is low',
                        triggerMode: TooltipTriggerMode.tap,
                        preferBelow: false,
                        child: Container(
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.grey),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              }),
            ),
            const Spacer(),
            Text(
              'Last test result: 154 pg/ml (90 days ago)',
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: Colors.grey,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}

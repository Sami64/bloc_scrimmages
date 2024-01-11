import 'package:flutter/material.dart';

import '../../../../core/activity/domain/entities/activity.dart';
import '../../../../core/util/extensions.dart';
import 'card.dart';

/// Home Menu Item
class HomeMenuItem extends StatelessWidget {
  /// Constructor
  const HomeMenuItem(
      {required this.activity,
      required this.icon,
      required this.color,
      super.key});

  /// Activity
  final Activity activity;

  /// Icon
  final String icon;

  /// Color
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ActivityCard(color: color, icon: icon, activity: activity),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Text('${activity.type.name.toCapitalized()}s',
              style: Theme.of(context).textTheme.bodyMedium),
        )
      ],
    );
  }
}

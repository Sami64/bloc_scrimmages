import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/activity/domain/entities/activity.dart';

/// Activity Card
class ActivityCard extends StatelessWidget {
  /// Constructor
  const ActivityCard(
      {required this.color,
      required this.icon,
      required this.activity,
      this.isListTile = false,
      super.key});

  /// Color
  final Color color;

  /// Activity
  final Activity activity;

  /// Icon
  final String icon;

  /// Is List Tile
  final bool isListTile;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: isListTile ? 50 : 90,
      width: isListTile ? 50 : 90,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: color, // This is the background color of the icon
      ),
      child: Stack(
        children: [
          Positioned(
            bottom: -10,
            left: 0,
            child: Transform.rotate(
              angle: 45 * pi / 180,
              child: Container(
                color: Colors.black.withOpacity(0.2),
                height: isListTile ? 35 : 65,
                width: isListTile ? 25 : 50,
              ),
            ),
          ),
          Center(
              child: SvgPicture.asset(
            icon,
            width: activity.type == ActivityType.medication
                ? isListTile
                    ? 20
                    : 40
                : isListTile
                    ? 30
                    : 55,
          ))
        ],
      ),
    );
  }
}

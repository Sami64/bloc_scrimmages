import 'dart:ui';

import '../activity/domain/entities/activity.dart';

/// Activity entity helper
class ActivityHelper {
  /// Return color for activity type
  static Color colorForType(ActivityType type) {
    switch (type) {
      case ActivityType.visit:
        return const Color(0xff22D3EE);
      case ActivityType.medication:
        return const Color(0xff60A5FA);
      case ActivityType.vaccination:
        return const Color(0xffFACC15);
      case ActivityType.lab:
        return const Color(0xffF87171);
      case ActivityType.procedure:
        return const Color(0xffA78BFA);
      case ActivityType.allergy:
        return const Color(0xffFBBF24);
      case ActivityType.condition:
        return const Color(0xff34D399);
      case ActivityType.observation:
        return const Color(0xffF472B6);
      case ActivityType.immunization:
        return const Color(0xff6EE7B7);
    }
  }

  /// Return icon for activity type
  static String iconForType(ActivityType type) {
    switch (type) {
      case ActivityType.visit:
        return 'assets/icons/visits.svg';
      case ActivityType.medication:
        return 'assets/icons/medications.svg';
      case ActivityType.vaccination:
        return 'assets/icons/vaccinations.svg';
      case ActivityType.lab:
        return 'assets/icons/labs.svg';
      case ActivityType.procedure:
        return 'assets/icons/procedures.svg';
      case ActivityType.allergy:
        return 'assets/icons/allergies.svg';
      case ActivityType.condition:
        return 'assets/icons/conditions.svg';
      case ActivityType.observation:
        return 'assets/icons/observations.svg';
      case ActivityType.immunization:
        return 'assets/icons/immunizations.svg';
    }
  }
}

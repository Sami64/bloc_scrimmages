import '../../src/medication/domain/entities/medication.dart';
import '../data/svgs.dart';

/// Medication Helper
class MedicationHelper {
  /// Return medication consumption period icon
  static String iconForConsumptionPeriod(MedicationConsumptionPeriod period) {
    switch (period) {
      case MedicationConsumptionPeriod.sunrise:
        return SvgAssets.sunrise;
      case MedicationConsumptionPeriod.afternoon:
        return SvgAssets.sun;
      case MedicationConsumptionPeriod.evening:
        return SvgAssets.moon;
    }
  }
}

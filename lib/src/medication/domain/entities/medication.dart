import 'package:freezed_annotation/freezed_annotation.dart';

part 'medication.freezed.dart';
part 'medication.g.dart';

/// Medication
@freezed
class Medication with _$Medication {
  /// Constructor
  factory Medication(
          {required String id,
          required String name,
          required String dosage,
          required String frequency,
          required List<MedicationConsumptionPeriod> consumptionPeriod}) =
      _Medication;

  const Medication._();

  /// Initial Medication with dummy data
  factory Medication.initial() => Medication(
      id: '1',
      name: '',
      dosage: '',
      frequency: '',
      consumptionPeriod: [MedicationConsumptionPeriod.sunrise]);

  /// json to model
  factory Medication.fromJson(Map<String, dynamic> json) =>
      _$MedicationFromJson(json);
}

/// Medication Consumption Period
enum MedicationConsumptionPeriod {
  /// Sunrise
  sunrise,

  /// Afternoon
  afternoon,

  /// Evening
  evening
}

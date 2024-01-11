import '../../domain/entities/medication.dart';

/// Medication remote database
abstract class MedicationRemoteDatabase {
  /// Get list of medications from remote data source
  Future<List<Medication>> list();
}

/// Implements [MedicationRemoteDatabase]
class MedicationRemoteDatabaseImpl implements MedicationRemoteDatabase {
  /// Constructor
  MedicationRemoteDatabaseImpl();

  @override
  Future<List<Medication>> list() async {
    final medications = <Medication>[
      Medication(
          id: 'md1',
          name: 'Paracetamol',
          dosage: '500mg',
          frequency: '4/day',
          consumptionPeriod: [MedicationConsumptionPeriod.afternoon]),
      Medication(
          id: 'md2',
          name: 'Ibuprofen',
          dosage: '200mg',
          frequency: '3/day',
          consumptionPeriod: [
            MedicationConsumptionPeriod.sunrise,
            MedicationConsumptionPeriod.evening
          ]),
      Medication(
          id: 'md3',
          name: 'Aspirin',
          dosage: '300mg',
          frequency: '2/day',
          consumptionPeriod: [
            MedicationConsumptionPeriod.sunrise,
            MedicationConsumptionPeriod.afternoon
          ]),
      Medication(
          id: 'md4',
          name: 'Amoxicillin',
          dosage: '500mg',
          frequency: '1/day',
          consumptionPeriod: [
            MedicationConsumptionPeriod.sunrise,
            MedicationConsumptionPeriod.afternoon,
            MedicationConsumptionPeriod.evening
          ]),
      Medication(
          id: 'md5',
          name: 'Omeprazole',
          dosage: '20mg',
          frequency: '1/day',
          consumptionPeriod: [MedicationConsumptionPeriod.evening]),
      Medication(
          id: 'md6',
          name: 'Codeine',
          dosage: '30mg',
          frequency: '1/day',
          consumptionPeriod: [
            MedicationConsumptionPeriod.afternoon,
            MedicationConsumptionPeriod.evening
          ]),
      Medication(
          id: 'md7',
          name: 'Morphine',
          dosage: '10mg',
          frequency: '1/day',
          consumptionPeriod: [
            MedicationConsumptionPeriod.sunrise,
            MedicationConsumptionPeriod.afternoon,
          ]),
    ];

    return Future.delayed(const Duration(seconds: 3), () => medications);
  }
}

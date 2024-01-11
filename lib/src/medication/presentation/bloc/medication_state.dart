part of 'medication_bloc.dart';

/// Medication State
@immutable
sealed class MedicationState {}

/// Initial Medication State
class MedicationInitial extends MedicationState {}

/// Medication Data Loading
class MedicationDataLoading extends MedicationState {}

/// Medication Data Loaded
class MedicationDataLoaded extends MedicationState {
  /// Constructor
  MedicationDataLoaded(
    this.medications,
  );

  /// List of Medication
  final List<Medication> medications;
}

/// Medication Data Error
class MedicationDataError extends MedicationState {
  /// Constructor
  MedicationDataError(
    this.message,
  );

  /// Message
  final String message;
}

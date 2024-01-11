part of 'medication_bloc.dart';

/// Medication Event
@immutable
sealed class MedicationEvent {}

/// Initial Medication Event
final class MedicationDataRequested extends MedicationEvent {}

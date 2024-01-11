import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/usecases/usecase.dart';
import '../../domain/entities/medication.dart';
import '../../domain/usecases/list.dart';

part 'medication_event.dart';
part 'medication_state.dart';

/// Medication Bloc
class MedicationBloc extends Bloc<MedicationEvent, MedicationState> {
  /// Constructor
  MedicationBloc({required this.listMedications}) : super(MedicationInitial()) {
    on<MedicationDataRequested>(_onMedicationDataRequested);
  }

  /// List Medications
  final ListMedications listMedications;

  Future<void> _onMedicationDataRequested(
      MedicationDataRequested event, Emitter<MedicationState> emit) async {
    emit(MedicationDataLoading());
    try {
      final result = await listMedications(NoParams());
      return result.fold(
        (failure) => emit(MedicationDataError(failure.message)),
        (medications) => emit(MedicationDataLoaded(medications)),
      );
    } catch (e) {
      return emit(MedicationDataError(e.toString()));
    }
  }
}

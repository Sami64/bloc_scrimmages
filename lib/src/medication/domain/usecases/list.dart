import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/medication.dart';
import '../repositories/medication_repository.dart';

/// List medications usecase
class ListMedications implements UseCase<List<Medication>, NoParams> {
  /// Constructor
  ListMedications(this.repository);

  /// Medication repository
  final MedicationRepository repository;

  @override
  Future<Either<Failure, List<Medication>>> call(NoParams params) =>
      repository.list();
}

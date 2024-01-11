import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../entities/medication.dart';

/// Medication repository
abstract class MedicationRepository {
  /// List medications
  Future<Either<Failure, List<Medication>>> list();
}

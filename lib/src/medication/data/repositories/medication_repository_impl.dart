import 'package:dartz/dartz.dart';

import '../../../../core/errors/exception.dart';
import '../../../../core/errors/failure.dart';
import '../../domain/entities/medication.dart';
import '../../domain/repositories/medication_repository.dart';
import '../databases/medication_remote_database.dart';

/// Medication repository implementation
class MedicationRepositoryImpl implements MedicationRepository {
  /// Constructor
  MedicationRepositoryImpl({
    required this.remoteDatabase,
  });

  /// Remote database
  final MedicationRemoteDatabase remoteDatabase;

  @override
  Future<Either<Failure, List<Medication>>> list() async {
    try {
      final remoteMedications = await remoteDatabase.list();
      return Right(remoteMedications);
    } on DeviceException catch (e) {
      return Left(Failure(e.message));
    }
  }
}

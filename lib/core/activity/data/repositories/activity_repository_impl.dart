import 'package:dartz/dartz.dart';

import '../../../errors/exception.dart';
import '../../../errors/failure.dart';
import '../../domain/entities/activity.dart';
import '../../domain/repositories/activity_repository.dart';
import '../databases/activity_remote_database.dart';

/// Implements [ActivityRepository]
class ActivityRepositoryImpl implements ActivityRepository {
  /// Constructor
  ActivityRepositoryImpl({required this.remoteDatabase});

  /// Activity remote database
  final ActivityRemoteDatabase remoteDatabase;

  @override
  Future<Either<Failure, List<Activity>>> list() async {
    try {
      final activities = await remoteDatabase.list();
      return Right(activities);
    } on DeviceException catch (e) {
      return Left(Failure(e.message));
    }
  }
}

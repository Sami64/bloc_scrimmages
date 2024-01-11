import 'package:dartz/dartz.dart';

import '../../../errors/failure.dart';
import '../../../usecases/usecase.dart';
import '../entities/activity.dart';
import '../repositories/activity_repository.dart';

/// List activities usecase
class ListActivities implements UseCase<List<Activity>, NoParams> {
  /// Constructor
  ListActivities(this.repository);

  /// Activity repository
  final ActivityRepository repository;

  @override
  Future<Either<Failure, List<Activity>>> call(NoParams params) =>
      repository.list();
}

import 'package:dartz/dartz.dart';

import '../../../errors/failure.dart';
import '../entities/activity.dart';

/// Activity repository
abstract class ActivityRepository {
  /// Get list of activities
  Future<Either<Failure, List<Activity>>> list();
}

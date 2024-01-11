import '../../domain/entities/activity.dart';

/// Activity remote data source
abstract class ActivityRemoteDatabase {
  /// Get list of activities from remote data source
  Future<List<Activity>> list();
}

/// Implements [ActivityRemoteDatabase]
class ActivityRemoteDatabaseImpl implements ActivityRemoteDatabase {
  /// Constructor
  ActivityRemoteDatabaseImpl();

  @override
  Future<List<Activity>> list() async {
    final activities = <Activity>[
      Activity(id: 'ad2', type: ActivityType.vaccination),
      Activity(id: 'ad3', type: ActivityType.medication),
      Activity(id: 'ad4', type: ActivityType.visit),
      Activity(id: 'ad5', type: ActivityType.medication),
      Activity(id: 'ad6', type: ActivityType.visit),
      Activity(id: 'ad7', type: ActivityType.medication),
    ];

    return Future.delayed(const Duration(seconds: 3), () => activities);
  }
}

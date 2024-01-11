part of 'activity_bloc.dart';

/// Activity State
@immutable
sealed class ActivityState {}

/// Initial Activity State
class ActivityInitial extends ActivityState {}

/// Activity Data Loading
class ActivityDataLoading extends ActivityState {}

/// Activity Data Loaded
class ActivityDataLoaded extends ActivityState {
  /// Constructor
  ActivityDataLoaded(
    this.activities,
  );

  /// List of Activity
  final Map<ActivityType, List<Activity>> activities;
}

/// Activity Data Error
class ActivityDataError extends ActivityState {
  /// Constructor
  ActivityDataError(
    this.message,
  );

  /// Message
  final String message;
}

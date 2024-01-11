part of 'activity_bloc.dart';

/// Activity Event
@immutable
sealed class ActivityEvent {}

/// Activity Data Requested
final class ActivityDataRequested extends ActivityEvent {}

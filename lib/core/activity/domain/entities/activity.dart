import 'package:freezed_annotation/freezed_annotation.dart';

part 'activity.freezed.dart';
part 'activity.g.dart';

/// Activity
@freezed
class Activity with _$Activity {
  /// Constructor
  factory Activity({
    /// The id of the activity
    required String id,

    /// The type of the activity
    required ActivityType type,
  }) = _Activity;

  const Activity._();

  /// Initial Activity with dummy data
  factory Activity.initial() => Activity(
        id: '1',
        type: ActivityType.visit,
      );

  /// Convert json to Activity
  factory Activity.fromJson(Map<String, dynamic> json) =>
      _$ActivityFromJson(json);
}

/// Activity Type
enum ActivityType {
  /// Visit
  visit,

  /// Medication
  medication,

  /// Vaccination
  vaccination,

  /// Lab
  lab,

  /// Procedure
  procedure,

  /// Allergy
  allergy,

  /// Condition
  condition,

  /// Observation
  observation,

  /// Immunization
  immunization,
}

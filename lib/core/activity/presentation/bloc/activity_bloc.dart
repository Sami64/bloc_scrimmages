import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../usecases/usecase.dart';
import '../../domain/entities/activity.dart';
import '../../domain/usecases/list.dart';

part 'activity_event.dart';
part 'activity_state.dart';

/// Activity bloc
class ActivityBloc extends Bloc<ActivityEvent, ActivityState> {
  /// Constructor
  ActivityBloc({required this.listActivities}) : super(ActivityInitial()) {
    on<ActivityDataRequested>(_onActivityDataRequested);
  }

  /// List activities usecase
  final ListActivities listActivities;

  Future<void> _onActivityDataRequested(
      ActivityDataRequested event, Emitter<ActivityState> emit) async {
    emit(ActivityDataLoading());
    try {
      final result = await listActivities(NoParams());
      return result.fold(
        (failure) => emit(ActivityDataError(failure.message)),
        (activities) =>
            emit(ActivityDataLoaded(groupBy(activities, (p0) => p0.type))),
      );
    } catch (e) {
      return emit(ActivityDataError(e.toString()));
    }
  }
}

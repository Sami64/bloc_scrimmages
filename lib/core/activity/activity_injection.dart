import 'package:get_it/get_it.dart';

import 'data/databases/activity_remote_database.dart';
import 'data/repositories/activity_repository_impl.dart';
import 'domain/repositories/activity_repository.dart';
import 'domain/usecases/list.dart';
import 'presentation/bloc/activity_bloc.dart';

/// Inject dependencies for activity feature
void initActivity() {
  final sl = GetIt.instance;

  sl
    ..registerFactory(() => ActivityBloc(listActivities: sl()))
    // Use cases
    ..registerLazySingleton(() => ListActivities(sl()))
    // Repositories
    ..registerLazySingleton<ActivityRepository>(
        () => ActivityRepositoryImpl(remoteDatabase: sl()))
    // Data sources
    ..registerLazySingleton<ActivityRemoteDatabase>(
        ActivityRemoteDatabaseImpl.new);
}

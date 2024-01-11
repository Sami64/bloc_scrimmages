import 'package:get_it/get_it.dart';

import 'data/databases/medication_remote_database.dart';
import 'data/repositories/medication_repository_impl.dart';
import 'domain/repositories/medication_repository.dart';
import 'domain/usecases/list.dart';
import 'presentation/bloc/medication_bloc.dart';

/// Initialize Medication Dependencies
void initMedication() {
  final sl = GetIt.instance;

  sl
    ..registerFactory(() => MedicationBloc(listMedications: sl()))

    /// Use cases
    ..registerLazySingleton(() => ListMedications(sl()))

    /// Repositories
    ..registerLazySingleton<MedicationRepository>(
        () => MedicationRepositoryImpl(remoteDatabase: sl()))

    /// Databases
    ..registerLazySingleton<MedicationRemoteDatabase>(
        MedicationRemoteDatabaseImpl.new);
}

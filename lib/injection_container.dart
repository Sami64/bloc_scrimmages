import 'package:get_it/get_it.dart';

import 'core/activity/activity_injection.dart';
import 'src/medication/medication_injection.dart';

///Get it initialization
final sl = GetIt.instance;

/// Configure dependencies
void configureDependencies() {
  initActivity();
  initMedication();
}

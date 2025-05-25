import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';
import '../../features/home_page/repositories/service_repository.dart';
import '../../features/home_page/viewmodels/home_viewmodel.dart';
import '../../features/home_page/viewmodels/home_navigation_viewmodel.dart';

final GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton<FirebaseFirestore>(
    () => FirebaseFirestore.instance,
  );

  locator.registerLazySingleton<ServiceRepository>(
    () => ServiceRepository(firestore: locator<FirebaseFirestore>()),
  );

  locator.registerFactory<HomeViewModel>(
    () => HomeViewModel(serviceRepository: locator<ServiceRepository>()),
  );

  locator.registerFactory<HomeNavigationViewModel>(
    () => HomeNavigationViewModel(),
  );
}

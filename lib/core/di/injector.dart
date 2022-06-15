import 'package:get_it/get_it.dart';

import '../folder/data/repo/repo.dart';
import '../folder/data/service/ins_service.dart';
import '../folder/data/source/ins_source.dart';
import '../network/app_config.dart';
import '../network/network_service.dart';

final inject = GetIt.instance;
// final sessionManager = SessionManager();
// final hiveManager = HiveManager();

Future<void> initializeCore({required Environment environment}) async {
  AppConfig.environment = environment;
  await _initializeCore();
  _initServices();
  _initProviders();
  _initBloc();
  _initDataSources();
  _initDataRepositories();
  _initializeUsecase();
}

/// Initialize the core functions here
Future<void> _initializeCore() async {
//   await hiveManager.initializeDatabase();
  // await sessionManager.initializeSession();
//   inject.registerLazySingleton<HiveManager>(() => hiveManager);
  // inject.registerLazySingleton<SessionManager>(() => sessionManager);
}

/// Initialize providers here
void _initProviders() {}

/// Initialize bloc's here
void _initBloc() {
  // inject.registerLazySingleton<BlocSigninBloc>(() => BlocSigninBloc(inject()));
}

/// Initialize data sources implementations
void _initDataSources() {
  inject.registerLazySingleton<AuthorizationSourcesImpl>(
      () => AuthorizationSourcesImpl(authorizationService: inject()));
}

/// Initialize data repositories implementations
void _initDataRepositories() {
  inject.registerLazySingleton<AuthorizationRepositoryImpl>(
      () => AuthorizationRepositoryImpl(inject()));
}

/// Initialize services's here
void _initServices() {
  inject.registerLazySingleton<NetworkService>(
      () => NetworkService(baseUrl: AppConfig.coreBaseUrl));
  inject.registerLazySingleton<AuthorizationService>(
      () => AuthorizationService(networkService: inject()));
}

/// Initialize usecases here
void _initializeUsecase() {
  // inject.registerLazySingleton<LoginUseCase>(() => LoginUseCase(inject()));
}

import 'package:get_it/get_it.dart';
import 'package:notes_app/core/theme/domain/usecases/set_thme_usecase.dart';
import 'package:notes_app/core/utils/cache_heper.dart';
import '../theme/data/theme_repository_impl.dart';
import '../theme/domain/repositories/theme_repository.dart';
import '../theme/domain/usecases/get_theme_usecase.dart';
import '../theme/presentation/manager/theme_cubit/theme_cubit.dart';

final get = GetIt.instance;

Future<void> initServiceLocator() async {
  final cacheHelper = CacheHelper();
  await cacheHelper.init();
  get.registerLazySingleton<CacheHelper>(() => cacheHelper);

  get.registerLazySingleton<ThemeRepository>(
    () => ThemeRepositoryImpl(get<CacheHelper>()),
  );

  get.registerLazySingleton(
    () => GetThemeUseCase(get<ThemeRepository>()),
  );
  get.registerLazySingleton(
    () => SetThemeUseCase(get<ThemeRepository>()),
  );

  get.registerLazySingleton<ThemeCubit>(
    () => ThemeCubit(get<GetThemeUseCase>(), get<SetThemeUseCase>()),
  );
}

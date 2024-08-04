import 'package:get_it/get_it.dart';
import 'package:spotify_clone/data/datasources/auth/auth_firebase_service.dart';
import 'package:spotify_clone/data/repositories/auth/auth_repository_impl.dart';
import 'package:spotify_clone/domain/repositories/auth/auth.dart';
import 'package:spotify_clone/domain/usecases/auth/signin.dart';
import 'package:spotify_clone/domain/usecases/auth/signup.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  sl.registerSingleton<AuthFirebaseService>(
    AuthFirebaseServiceImpl(),
  );

  sl.registerSingleton<AuthRepository>(
    AuthRepositoryImpl(),
  );

  sl.registerSingleton<SignupUsecase>(
    SignupUsecase(),
  );

  sl.registerSingleton<SigninUsecase>(
    SigninUsecase(),
  );
}

import 'package:get_it/get_it.dart';
import 'package:spotify_clone/data/datasources/auth/auth_firebase_service.dart';
import 'package:spotify_clone/data/datasources/song/song_firebase_service.dart';
import 'package:spotify_clone/data/repositories/auth/auth_repository_impl.dart';
import 'package:spotify_clone/data/repositories/song/song_repository_impl.dart';
import 'package:spotify_clone/domain/repositories/auth/auth.dart';
import 'package:spotify_clone/domain/repositories/song/song.dart';
import 'package:spotify_clone/domain/usecases/auth/signin.dart';
import 'package:spotify_clone/domain/usecases/auth/signup.dart';
import 'package:spotify_clone/domain/usecases/song/add_or_remove_favorite_song.dart';
import 'package:spotify_clone/domain/usecases/song/get_new_songs.dart';
import 'package:spotify_clone/domain/usecases/song/get_play_list.dart';
import 'package:spotify_clone/domain/usecases/song/is_favorite_song.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  sl.registerSingleton<AuthFirebaseService>(
    AuthFirebaseServiceImpl(),
  );

  sl.registerSingleton<SongFirebaseService>(
    SongFirebaseServiceImpl(),
  );

  sl.registerSingleton<AuthRepository>(
    AuthRepositoryImpl(),
  );

  sl.registerSingleton<SongRepository>(
    SongRepositoryImpl(),
  );

  sl.registerSingleton<SignupUsecase>(
    SignupUsecase(),
  );

  sl.registerSingleton<SigninUsecase>(
    SigninUsecase(),
  );

  sl.registerSingleton<GetNewSongsUsecase>(
    GetNewSongsUsecase(),
  );

  sl.registerSingleton<GetPlayListUsecase>(
    GetPlayListUsecase(),
  );

  sl.registerSingleton<AddOrRemoveFavoriteSongUsecase>(
    AddOrRemoveFavoriteSongUsecase(),
  );

  sl.registerSingleton<IsFavoriteSongUsecase>(
    IsFavoriteSongUsecase(),
  );
}

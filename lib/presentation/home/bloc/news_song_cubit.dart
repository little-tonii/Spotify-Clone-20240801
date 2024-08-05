import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_clone/domain/usecases/song/get_new_songs.dart';
import 'package:spotify_clone/presentation/home/bloc/new_songs_state.dart';
import 'package:spotify_clone/service_locator.dart';

class NewSongsCubit extends Cubit<NewSongsState> {
  NewSongsCubit(super.initialState);

  Future<void> getNewSongs() async {
    final returnedSongs = await sl<GetNewSongsUsecase>().call();

    returnedSongs.fold(
      (left) {
        emit(NewSongsLoadFailure());
      },
      (right) {
        emit(NewSongsLoaded(songs: right));
      },
    );
  }
}

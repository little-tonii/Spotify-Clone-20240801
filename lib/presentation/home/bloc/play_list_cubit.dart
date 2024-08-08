import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_clone/domain/usecases/song/get_play_list.dart';
import 'package:spotify_clone/presentation/home/bloc/play_list_state.dart';
import 'package:spotify_clone/service_locator.dart';

class PlayListCubit extends Cubit<PlayListState> {
  PlayListCubit() : super(PlayListLoading());

  void getPlayList() async {
    final returnedSongs = await sl<GetPlayListUsecase>().call();

    returnedSongs.fold(
      (left) {
        emit(PlayListFailure());
      },
      (right) {
        emit(PlayListLoaded(songs: right));
      },
    );
  }
}

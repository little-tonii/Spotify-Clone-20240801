import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_clone/common/bloc/favorite_button/favorite_button_state.dart';
import 'package:spotify_clone/domain/usecases/song/add_or_remove_favorite_song.dart';
import 'package:spotify_clone/service_locator.dart';

class FavoriteButtonCubit extends Cubit<FavoriteButtonState> {
  FavoriteButtonCubit() : super(FavoriteButtonInitlal());

  void favoriteButtonUpdated(String songId) async {
    final result =
        await sl<AddOrRemoveFavoriteSongUsecase>().call(params: songId);

    result.fold(
      (l) {},
      (r) {
        emit(FavoriteButtonUpdated(isFavorite: r));
      },
    );
  }
}

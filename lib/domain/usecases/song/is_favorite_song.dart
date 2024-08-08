import 'package:spotify_clone/core/usecase/usecase.dart';
import 'package:spotify_clone/domain/repositories/song/song.dart';
import 'package:spotify_clone/service_locator.dart';

class IsFavoriteSongUsecase implements Usecase<bool, String> {
  @override
  Future<bool> call({String? params}) async {
    return await sl<SongRepository>().isFavoriteSong(params!);
  }
}

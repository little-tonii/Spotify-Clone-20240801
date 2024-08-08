import 'package:dartz/dartz.dart';
import 'package:spotify_clone/core/usecase/usecase.dart';
import 'package:spotify_clone/domain/repositories/song/song.dart';
import 'package:spotify_clone/service_locator.dart';

class AddOrRemoveFavoriteSongUsecase implements Usecase<Either, String> {
  @override
  Future<Either> call({String? params}) async {
    return await sl<SongRepository>().addOrRemoveFavoriteSongs(params!);
  }
}

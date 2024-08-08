import 'package:dartz/dartz.dart';
import 'package:spotify_clone/data/datasources/song/song_firebase_service.dart';
import 'package:spotify_clone/domain/repositories/song/song.dart';
import 'package:spotify_clone/service_locator.dart';

class SongRepositoryImpl implements SongRepository {
  @override
  Future<Either> getNewSongs() async {
    return await sl<SongFirebaseService>().getNewSongs();
  }
  
  @override
  Future<Either> getPlayList() async {
    return await sl<SongFirebaseService>().getPlayList();
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:spotify_clone/data/models/song/song.dart';
import 'package:spotify_clone/domain/entities/song/song.dart';
import 'package:spotify_clone/domain/usecases/song/is_favorite_song.dart';
import 'package:spotify_clone/service_locator.dart';

abstract class SongFirebaseService {
  Future<Either> getNewSongs();
  Future<Either> getPlayList();
  Future<Either> addOrRemoveFavoriteSong(String songId);
  Future<bool> isFavoriteSong(String songId);
}

class SongFirebaseServiceImpl implements SongFirebaseService {
  @override
  Future<Either> getNewSongs() async {
    try {
      List<SongEntity> songs = [];

      final data = await FirebaseFirestore.instance
          .collection('Songs')
          .orderBy('releaseDate', descending: true)
          .limit(3)
          .get();

      for (var doc in data.docs) {
        final songModel = SongModel.fromJson(doc.data());

        var isFavorite = await sl<IsFavoriteSongUsecase>().call(params: doc.id);

        songModel.isFavorite = isFavorite;
        songModel.songId = doc.reference.id;

        songs.add(
          songModel.toEntity(),
        );
      }

      return Right(songs);
    } catch (e) {
      return const Left('An error occurred, please try again.');
    }
  }

  @override
  Future<Either> getPlayList() async {
    try {
      List<SongEntity> songs = [];

      final data = await FirebaseFirestore.instance
          .collection('Songs')
          .orderBy('releaseDate', descending: true)
          .get();

      for (var doc in data.docs) {
        final songModel = SongModel.fromJson(doc.data());

        var isFavorite = await sl<IsFavoriteSongUsecase>().call(params: doc.id);

        songModel.isFavorite = isFavorite;
        songModel.songId = doc.reference.id;

        songs.add(
          songModel.toEntity(),
        );
      }

      return Right(songs);
    } catch (e) {
      return const Left('An error occurred, please try again.');
    }
  }

  @override
  Future<Either> addOrRemoveFavoriteSong(String songId) async {
    try {
      final firebaseAuth = FirebaseAuth.instance;
      final firebaseFirestore = FirebaseFirestore.instance;

      final user = firebaseAuth.currentUser;
      String uid = user!.uid;

      late bool isFavorite;

      final favouriteSongs = await firebaseFirestore
          .collection('Users')
          .doc(uid)
          .collection('Favorites')
          .where('songId', isEqualTo: songId)
          .get();

      if (favouriteSongs.docs.isNotEmpty) {
        await favouriteSongs.docs.first.reference.delete();
        isFavorite = false;
      } else {
        await firebaseFirestore
            .collection('Users')
            .doc(uid)
            .collection('Favorites')
            .add(
          {
            'songId': songId,
            'addedDate': Timestamp.now(),
          },
        );
        isFavorite = true;
      }
      return Right(isFavorite);
    } catch (e) {
      return const Left('An error occurred');
    }
  }

  @override
  Future<bool> isFavoriteSong(String songId) async {
    try {
      final firebaseAuth = FirebaseAuth.instance;
      final firebaseFirestore = FirebaseFirestore.instance;

      final user = firebaseAuth.currentUser;
      String uid = user!.uid;

      final favouriteSongs = await firebaseFirestore
          .collection('Users')
          .doc(uid)
          .collection('Favorites')
          .where('songId', isEqualTo: songId)
          .get();

      if (favouriteSongs.docs.isNotEmpty) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }
}

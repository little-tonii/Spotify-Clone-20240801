import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:spotify_clone/data/models/song/song.dart';
import 'package:spotify_clone/domain/entities/song/song.dart';

abstract class SongFirebaseService {
  Future<Either> getNewSongs();
  Future<Either> getPlayList();
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
        songs.add(
          SongModel.fromJson(doc.data()).toEntity(),
        );
        songs.add(
          SongModel.fromJson(doc.data()).toEntity(),
        );
        songs.add(
          SongModel.fromJson(doc.data()).toEntity(),
        );
        songs.add(
          SongModel.fromJson(doc.data()).toEntity(),
        );
        songs.add(
          SongModel.fromJson(doc.data()).toEntity(),
        );
        songs.add(
          SongModel.fromJson(doc.data()).toEntity(),
        );
        songs.add(
          SongModel.fromJson(doc.data()).toEntity(),
        );
        songs.add(
          SongModel.fromJson(doc.data()).toEntity(),
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
        songs.add(
          SongModel.fromJson(doc.data()).toEntity(),
        );
        songs.add(
          SongModel.fromJson(doc.data()).toEntity(),
        );
        songs.add(
          SongModel.fromJson(doc.data()).toEntity(),
        );
        songs.add(
          SongModel.fromJson(doc.data()).toEntity(),
        );
        songs.add(
          SongModel.fromJson(doc.data()).toEntity(),
        );
        songs.add(
          SongModel.fromJson(doc.data()).toEntity(),
        );
        songs.add(
          SongModel.fromJson(doc.data()).toEntity(),
        );
        songs.add(
          SongModel.fromJson(doc.data()).toEntity(),
        );
      }

      return Right(songs);
    } catch (e) {
      return const Left('An error occurred, please try again.');
    }
  }
}

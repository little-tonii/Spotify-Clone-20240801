import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:spotify_clone/domain/entities/song/song.dart';

class SongModel {
  String? title;
  String? artist;
  num? duration;
  Timestamp? releaseDate;
  bool? isFavorite;
  String? songId;

  SongModel({
    required this.title,
    required this.artist,
    required this.duration,
    required this.releaseDate,
    required this.isFavorite,
    required this.songId,
  });

  SongModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    artist = json['artist'];
    duration = json['duration'];
    releaseDate = json['releaseDate'];
  }

  SongEntity toEntity() {
    return SongEntity(
      isFavorite: isFavorite!,
      title: title!,
      artist: artist!,
      duration: duration!,
      releaseDate: releaseDate!,
      songId: songId!,
    );
  }
}

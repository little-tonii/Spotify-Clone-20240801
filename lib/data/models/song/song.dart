import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:spotify_clone/domain/entities/song/song.dart';

class SongModel {
  final String title;
  final String artist;
  final num duration;
  final Timestamp releaseDate;

  SongModel({
    required this.title,
    required this.artist,
    required this.duration,
    required this.releaseDate,
  });

  factory SongModel.fromJson(Map<String, dynamic> json) {
    return SongModel(
      title: json['title'],
      artist: json['artist'],
      duration: json['duration'],
      releaseDate: json['releaseDate'],
    );
  }

  SongEntity toEntity() {
    return SongEntity(
      title: title,
      artist: artist,
      duration: duration,
      releaseDate: releaseDate,
    );
  }
}

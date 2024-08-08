import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_clone/common/widgets/appbar/app_bar.dart';
import 'package:spotify_clone/common/widgets/favorite_button/favorite_button.dart';
import 'package:spotify_clone/core/configs/theme/app_colors.dart';
import 'package:spotify_clone/core/constants/app_urls.dart';
import 'package:spotify_clone/domain/entities/song/song.dart';
import 'package:spotify_clone/presentation/song_player/bloc/song_player_bloc.dart';
import 'package:spotify_clone/presentation/song_player/bloc/song_player_state.dart';

class SongPlayerPage extends StatelessWidget {
  final SongEntity songEntity;

  const SongPlayerPage({
    super.key,
    required this.songEntity,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(
        action: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.more_vert_rounded),
        ),
        title: const Text(
          'Now Playing',
          style: TextStyle(
            fontSize: 18,
          ),
        ),
      ),
      body: BlocProvider(
        create: (context) => SongPlayerCubit()
          ..loadSong(
            '${AppUrls.songFireStorage}${Uri.encodeComponent(songEntity.artist)}%20-%20${Uri.encodeComponent(songEntity.title)}.mp3?${AppUrls.medialAlt}',
          ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 16,
          ),
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height / 2,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      '${AppUrls.coverFireStorage}${Uri.encodeComponent(songEntity.artist)}%20-%20${Uri.encodeComponent(songEntity.title)}.jpg?${AppUrls.medialAlt}',
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        songEntity.title,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        songEntity.artist,
                        style: const TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  FavoriteButton(songEntity: songEntity),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              BlocBuilder<SongPlayerCubit, SongPlayerState>(
                builder: (context, state) {
                  if (state is SongPlayerLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (state is SongPlayerLoaded) {
                    return Column(
                      children: [
                        Slider(
                          value: context
                              .read<SongPlayerCubit>()
                              .songPosition
                              .inSeconds
                              .toDouble(),
                          min: 0.0,
                          max: context
                              .read<SongPlayerCubit>()
                              .songDuration
                              .inSeconds
                              .toDouble(),
                          onChanged: (value) {},
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "${context.read<SongPlayerCubit>().songPosition.inMinutes.remainder(60).toString().padLeft(2, '0')}:${context.read<SongPlayerCubit>().songPosition.inSeconds.remainder(60).toString().padLeft(2, '0')}",
                            ),
                            Text(
                              "${context.read<SongPlayerCubit>().songDuration.inMinutes.remainder(60).toString().padLeft(2, '0')}:${context.read<SongPlayerCubit>().songDuration.inSeconds.remainder(60).toString().padLeft(2, '0')}",
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        GestureDetector(
                          onTap: () {
                            context.read<SongPlayerCubit>().playOrPauseSong();
                          },
                          child: Container(
                            height: 60,
                            width: 60,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.primary,
                            ),
                            child: Icon(
                              context
                                      .read<SongPlayerCubit>()
                                      .audioPlayer
                                      .playing
                                  ? Icons.pause
                                  : Icons.play_arrow,
                            ),
                          ),
                        ),
                      ],
                    );
                  }
                  return const SizedBox();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

abstract class FavoriteButtonState {}

class FavoriteButtonInitlal extends FavoriteButtonState {}

class FavoriteButtonUpdated extends FavoriteButtonState {
  final bool isFavorite;

  FavoriteButtonUpdated({required this.isFavorite});
}

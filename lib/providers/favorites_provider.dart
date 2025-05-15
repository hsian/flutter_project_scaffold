import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/movie.dart';

final favoritesProvider = StateNotifierProvider<FavoritesNotifier, List<Movie>>((ref) {
  return FavoritesNotifier();
});

class FavoritesNotifier extends StateNotifier<List<Movie>> {
  FavoritesNotifier() : super([]);

  void addFavorite(Movie movie) {
    if (!state.any((fav) => fav.id == movie.id)) {
      state = [...state, movie];
    }
  }

  void removeFavorite(String movieId) {
    state = state.where((fav) => fav.id != movieId).toList();
  }

  bool isFavorite(String movieId) {
    return state.any((fav) => fav.id == movieId);
  }
}  
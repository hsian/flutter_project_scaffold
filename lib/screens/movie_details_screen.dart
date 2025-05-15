import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/movie.dart';
import '../providers/movie_details_provider.dart';
import '../providers/favorites_provider.dart';

class MovieDetailsScreen extends ConsumerWidget {
  const MovieDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final movieId = ModalRoute.of(context)?.settings.arguments as String;
    final movieAsync = ref.watch(movieDetailsProvider(movieId));
    final favorites = ref.watch(favoritesProvider);
    final isFavorite = favorites.any((fav) => fav.id == movieId);

    return Scaffold(
      appBar: AppBar(title: const Text('Movie Details')),
      body: movieAsync.when(
        data: (movie) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                movie.title,
                style: Theme.of(context).textTheme.headlineSmall,
                ),
                const SizedBox(height: 10),
                Text(
                'Release Date: ${movie.title}',
                style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 10),
                Text(movie.year, style: Theme.of(context).textTheme.bodyMedium),
                const SizedBox(height: 20),
                ElevatedButton(
                onPressed: () {
                  final favoritesNotifier = ref.read(
                  favoritesProvider.notifier,
                  );
                  if (isFavorite) {
                  favoritesNotifier.removeFavorite(movie.id);
                  } else {
                  favoritesNotifier.addFavorite(movie);
                  }
                },
                child: Text(
                  isFavorite ? 'Remove from Favorites' : 'Add to Favorites',
                ),
                ),
              ],
              ),
            ),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) => Center(child: Text('Error: $error')),
      ),
    );
  }
}

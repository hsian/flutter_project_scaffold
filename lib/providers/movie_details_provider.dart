import 'package:basic/providers/search_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../services/api_client.dart';
import '../models/movie.dart';

final movieDetailsProvider = FutureProvider.family.autoDispose<Movie, String>((ref, id) {
  final apiClient = ref.watch(apiClientProvider);
  return apiClient.getMovieDetails(id);
});  
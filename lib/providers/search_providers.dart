import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import '../services/api_client.dart';
import '../models/movie.dart';

final searchQueryProvider = StateProvider<String>((ref) => '');

final searchResultsProvider = FutureProvider.autoDispose<List<Movie>>((ref) {
  final query = ref.watch(searchQueryProvider);
  if (query.isEmpty) return [];
  
  final apiClient = ref.watch(apiClientProvider);
  return apiClient.searchMovies(query);
});

final apiClientProvider = Provider<ApiClient>((ref) {
  return ApiClient(http.Client());
});  
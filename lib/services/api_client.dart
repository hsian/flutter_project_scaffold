import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/movie.dart';

class ApiClient {
  final http.Client _client;
  static const apiKey = '7a0a0a0f';
  static const baseUrl = 'http://www.omdbapi.com';

  ApiClient(this._client);

  Future<List<Movie>> searchMovies(String query) async {
    final response = await _client.get(
      Uri.parse('$baseUrl/?apikey=$apiKey&s=$query&type=movie'),
    );
    
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      if (jsonData['Response'] == 'True') {
        return (jsonData['Search'] as List<dynamic>)
            .map((item) => Movie(
                  id: item['imdbID'],
                  title: item['Title'],
                  year: item['Year'],
                  poster: item['Poster'] == 'N/A' ? 'https://picsum.photos/200/300' : item['Poster'],
                  plot: '',
                  rating: 0.0,
                ))
            .toList();
      } else {
        return [];
      }
    } else {
      throw Exception('Failed to search movies: ${response.statusCode}');
    }
  }

  Future<Movie> getMovieDetails(String id) async {
    final response = await _client.get(
      Uri.parse('$baseUrl/?apikey=$apiKey&i=$id&plot=full'),
    );
    
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      return Movie(
        id: jsonData['imdbID'],
        title: jsonData['Title'],
        year: jsonData['Year'],
        poster: jsonData['Poster'] == 'N/A' ? 'https://picsum.photos/200/300' : jsonData['Poster'],
        plot: jsonData['Plot'],
        rating: double.parse(jsonData['imdbRating']),
      );
    } else {
      throw Exception('Failed to get movie details: ${response.statusCode}');
    }
  }
}  
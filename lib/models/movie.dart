import 'package:freezed_annotation/freezed_annotation.dart';

part 'movie.freezed.dart';
part 'movie.g.dart'; // Add this line

@freezed
sealed class Movie with _$Movie {
  factory Movie({
    required String id,
    required String title,
    required String year,
    required String poster,
    required String plot,
    required double rating,
  }) = _Movie;

  // 让 freezed 自动生成 JSON 序列化方法
  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);
}
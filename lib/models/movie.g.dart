// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MovieImpl _$$MovieImplFromJson(Map<String, dynamic> json) => _$MovieImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      year: json['year'] as String,
      poster: json['poster'] as String,
      plot: json['plot'] as String,
      rating: (json['rating'] as num).toDouble(),
    );

Map<String, dynamic> _$$MovieImplToJson(_$MovieImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'year': instance.year,
      'poster': instance.poster,
      'plot': instance.plot,
      'rating': instance.rating,
    };

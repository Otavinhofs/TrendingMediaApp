import 'package:teste/settings.dart';

class SeriesModel {
  final String name;
  final String overview;
  final int voteCount;
  final String firstAirDate;
  final double voteAverage;
  final String posterPath;
  final Type type = Type.serie;

  SeriesModel({
    required this.name,
    required this.overview,
    required this.voteCount,
    required this.firstAirDate,
    required this.voteAverage,
    required this.posterPath,
  });

  factory SeriesModel.fromJson(Map<String, dynamic> json) {
    return SeriesModel(
      name: json['name'] ?? '',
      overview: json['overview'] ?? '',
      voteCount: json['vote_count'] ?? 0,
      firstAirDate: json['first_air_date'] ?? '',
      voteAverage: json['vote_average'] * 1.0,
      posterPath: json['poster_path'] ?? '',
    );
  }
}

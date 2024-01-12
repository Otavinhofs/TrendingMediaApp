class MoviesModel {
  final String title;
  final String overview;
  final int voteCount;
  final String releasDate;
  final double voteAverage;
  final String posterPath;

  MoviesModel({
    required this.title,
    required this.overview,
    required this.voteCount,
    required this.releasDate,
    required this.voteAverage,
    required this.posterPath,
  });

  factory MoviesModel.fromJson(Map<String, dynamic> json) {
    return MoviesModel(
      title: json['title'],
      overview: json['overview'] ?? '',
      voteCount: json['vote_count'] ?? 0,
      releasDate: json['release_date'] ?? '',
      voteAverage: json['vote_average'] ?? 1.0,
      posterPath: json['poster_path'] ?? '',
    );
  }
}

class DataClassFilmpage {
  final String original_title;
  final String overview;
  final String backdrop;
  final String poster_path;
  final String release_date;
  final String popularity;
  final String vote_ave;
  final String vote_count;
  final List production_comp;
  final List actor;
  final List genre;
  final List origin_country;
  final String runtime;
  final int budget;
  final String tagline;
  final String award;
  final String metascore;
  final String rated;
  final List ratings;
  final String imdbVotes;
  final String imdbRating;

  DataClassFilmpage({
    required this.original_title,
    required this.overview,
    required this.poster_path,
    required this.release_date,
    required this.backdrop,
    required this.popularity,
    required this.vote_ave,
    required this.vote_count,
    required this.production_comp,
    required this.genre,
    required this.origin_country,
    required this.runtime,
    required this.budget,
    required this.tagline,
    required this.actor,
    required this.award,
    required this.metascore,
    required this.rated,
    required this.ratings,
    required this.imdbVotes,
    required this.imdbRating,
  });
}

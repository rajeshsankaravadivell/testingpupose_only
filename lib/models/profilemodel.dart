import 'package:cloud_firestore/cloud_firestore.dart';

final moviesRef = FirebaseFirestore.instance
    .collection('movies')
    .withConverter<Movie>(
        fromFirestore: (snapshot, _) => Movie.fromJson(snapshot.data()!),
        toFirestore: (movie, _) => movie.toJson());

class Movie {
  Movie({
    required this.title,
    required this.genre,
  });

  final String title;
  final String genre;

  Movie.fromJson(Map<String, dynamic> json)
      : this(
          title: json['title']! as String,
          genre: json['genre']! as String,
        );

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'genre': genre,
    };
  }

  Future<void> addMovie() {
    return moviesRef.add(this);
  }
}

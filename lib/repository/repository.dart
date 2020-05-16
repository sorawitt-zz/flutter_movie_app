import 'package:dio/dio.dart';
import 'package:flutter_movie_app/model/genre_response.dart';
import 'package:flutter_movie_app/model/movie_response.dart';
import 'package:flutter_movie_app/model/person_response.dart';

class MovieRepository {
  final String apiKey = "";
  static String mainURL = "https://api.themoviedb.org/3";
  final Dio _dio = Dio();
  var getPopularUrl = '$mainURL/movie/top_rated';
  var getMovieUrl = '$mainURL/discovery/movie';
  var getPlayingUrl = '$mainURL/movie/now_playing';
  var getGenresUrl = '$mainURL/genre/movie/list';
  var getPersonsUlr = '$mainURL/trending/person/week';

  Future<MovieResponse> getMovies() async {
    var param = {"api_key": apiKey, "language": "en_US", "page": 1};

    try {
      Response response = await _dio.get(getPopularUrl, queryParameters: param);
      return MovieResponse.fromJson(response.data);
    } catch (error, stackTrace) {
      print("Exception occured: $error stackTrace $stackTrace");
      return MovieResponse.withError("$error");
    }
  }

  Future<GenreResponse> getGenres() async {
    var param = {"api_key": apiKey, "language": "en_US", "page": 1};

    try {
      Response response = await _dio.get(getGenresUrl, queryParameters: param);
      return GenreResponse.fromJson(response.data);
    } catch (error, stackTrace) {
      print("Exception occured: $error stackTrace $stackTrace");
      return GenreResponse.withError("$error");
    }
  }

  Future<PersonResponse> getPersons() async {
    var param = {"api_key": apiKey};

    try {
      Response response = await _dio.get(getPersonsUlr, queryParameters: param);
      return PersonResponse.fromJson(response.data);
    } catch (error, stackTrace) {
      print("Exception occured: $error stackTrace $stackTrace");
      return PersonResponse.withError("$error");
    }
  }

  Future<MovieResponse> getPlayingMovies() async {
    var param = {"api_key": apiKey, "language": "en_US", "page": 1};

    try {
      Response response = await _dio.get(getPlayingUrl, queryParameters: param);
      return MovieResponse.fromJson(response.data);
    } catch (error, stackTrace) {
      print("Exception occured: $error stackTrace $stackTrace");
      return MovieResponse.withError("$error");
    }
  }

    Future<MovieResponse> getMovieByGenre(int id) async {
    var param = {"api_key": apiKey, "language": "en_US", "page": 1, "with_genre": id};

    try {
      Response response = await _dio.get(getMovieUrl, queryParameters: param);
      return MovieResponse.fromJson(response.data);
    } catch (error, stackTrace) {
      print("Exception occured: $error stackTrace $stackTrace");
      return MovieResponse.withError("$error");
    }
  }
}

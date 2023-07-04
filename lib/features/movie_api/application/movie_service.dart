import 'dart:convert';

import 'package:api_demo/features/movie_api/domain/movie_model.dart';
import 'package:dio/dio.dart';

class MovieService {
  // API url
  static const String apiUrl =
      "https://opentdb.com/api.php?amount=10&category=11&difficulty=hard&type=multiple";
  static final dio = Dio();

  // Get all movies model
  static Future<MovieModel> getMovieModel() async {
    try {
      final response = await dio.get(apiUrl);
      if (response.statusCode == 200) {
        MovieModel movieModel = movieModelFromJson(jsonEncode(response.data));
        return movieModel;
      } else {
        throw Exception("Failed to fetch data");
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}

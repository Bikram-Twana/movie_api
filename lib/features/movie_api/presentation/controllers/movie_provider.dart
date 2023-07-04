import 'package:api_demo/features/movie_api/application/movie_service.dart';
import 'package:api_demo/features/movie_api/domain/movie_model.dart';
import 'package:flutter/foundation.dart';

class MovieProvider with ChangeNotifier {
  // bool isLoading = true;

  List<Result> _allResults = [];

  // List<Result> get allResults => _allResults;

  Future<List<Result>> getAllResults() async {
    // isLoading = true;
    // notifyListeners();

    final response = await MovieService.getMovieModel();

    _allResults = response.results!;

    if (kDebugMode) {
      print(_allResults[0].question!);
    }

    // isLoading = false;
    // notifyListeners();

    return _allResults;
  }
}

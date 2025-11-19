import 'dart:convert';

import 'package:get/get.dart';
import 'package:pas_mobile_11pplg2_35/colors/color_palette.dart';
import 'package:pas_mobile_11pplg2_35/config/api_config.dart';
import 'package:pas_mobile_11pplg2_35/helper/db_helper.dart';
import 'package:pas_mobile_11pplg2_35/models/movie_model.dart';
import 'package:http/http.dart' as http;

class MovieController extends GetxController {
  var isLoading = false.obs;
  var movieResponse = <Movie>[].obs;
  var movieMark = <Movie>[].obs;
  final db = DBHelper();
  

  @override
  void onInit() {
    super.onInit();
    fetchMovies();
  }

  void fetchMovies() async {
    final url = Uri.parse(ApiConfig.movies);
    try {
      isLoading.value = true;
      final res = await http.get(url);
      if (res.statusCode == 200) {
        final data = jsonDecode(res.body);
        final List movieData = data;

        movieResponse.assignAll(
          movieData.map((e) => Movie.fromJson(e)).toList(),
        );
      } else {
        Get.snackbar(
          'Error',
          'Failed to fetch movies: ${res.statusCode}',
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } catch (e) {
      Get.snackbar(
        'Error',
        'An error occurred while fetching movies: $e',
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isLoading.value = false;
    }
  }

  markFavorite(int i) async {
  final movie = movieResponse[i];

  final alreadyFav = isMovieFavorited(movie.name);

  if (alreadyFav) {
    await db.deleteMovieByName(movie.name);
    Get.snackbar(
      'Removed',
      'Movie removed from favorites',
      snackPosition: SnackPosition.BOTTOM,
      colorText: ColorPalette.accentColor,
    );
  } else {
    final movieMap = {
      'image': movie.image.original,
      'name': movie.name,
      'rating': movie.rating.average.toString(),
    };
    await db.markMovie(movieMap);
    Get.snackbar(
      'Success',
      'Movie added to favorites',
      snackPosition: SnackPosition.BOTTOM,
      colorText: ColorPalette.accentColor,
    );
  }

  getFavorite();
}


  void getFavorite() async {
    final movieList = await db.getMarkedMovie();
    final list = movieList.map((row) => Movie.fromJson(row)).toList();

    movieMark.assignAll(list);
  }

  void deleteFavorite(int i) async {
    final product = movieMark[i];

    await db.deleteMovie(product.id);

    Get.snackbar(
      'Favorite Movie',
      'Favorite movie destroyed',
      snackPosition: SnackPosition.BOTTOM,
      colorText: ColorPalette.accentColor,
      duration: Duration(seconds: 1),
    );

    getFavorite();
  }

  bool isMovieFavorited(String name) {
    return movieMark.any((m) => m.name == name);
  }
}

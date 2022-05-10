import 'package:dio/dio.dart';

class DioHelper {
  static late Dio dio;
  static initDio() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://api.themoviedb.org/3/',
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static List trendingMovies = [];
  static List topRatedMovies = [];
  static List movieCast = [];
  static List similarMovies = [];
  static List searchList = [];
  static String movieDescription = '';
  static String movieName = '';
  static double movieRate = 0.0;
  static Future getMoviesData(
      {required String url, required Map<String, dynamic> query}) async {
    return await dio.get(
      url,
      queryParameters: query,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:movie_app/shared/Dio/dio_helper.dart';
import 'package:movie_app/shared/config/const.dart';

import 'Components/app_bar.dart';
import 'Components/category_headline.dart';
import 'Components/list_of_movies_widget.dart';
import 'Components/swiper.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  getTrendingMovies() {
    DioHelper.getMoviesData(
      url: 'trending/movie/week',
      query: {
        'api_key': kApiKey,
      },
    ).then(
      (value) async {
        if (value.data != null) {
          for (var value in value.data['results']) {
            setState(() {});
            DioHelper.trendingMovies.add(value);
          }
          kIsTrendingDone = true;
          print(DioHelper.trendingMovies);
        }
      },
    );
  }

  getTopRatedMovies() {
    DioHelper.getMoviesData(
      url: 'movie/top_rated',
      query: {
        'api_key': kApiKey,
        'language': 'en-US',
        'page': '1',
      },
    ).then(
      (value) async {
        if (value.data != null) {
          for (var value in value.data['results']) {
            setState(() {});
            DioHelper.topRatedMovies.add(value);
          }
          kIsTopRatedDone = true;
          print(DioHelper.topRatedMovies);
        }
      },
    );
  }

  @override
  void initState() {
    getTrendingMovies();
    getTopRatedMovies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    List trendingMovieList = DioHelper.trendingMovies;
    List topRatedMovies = DioHelper.topRatedMovies;

    return Scaffold(
      appBar: homeScreenAppBar(context: context),
      body: !kIsTopRatedDone && !kIsTrendingDone
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SwiperMovieWidget(
                      width: width,
                      height: height,
                      trendingMovieList: trendingMovieList,
                    ),
                  ),
                  CategoryHeadLine(
                    width: width,
                    text: 'Trending',
                  ),
                  ListOfMoviesWidget(
                    height: height,
                    width: width,
                    movieList: trendingMovieList,
                  ),
                  CategoryHeadLine(
                    width: width,
                    text: 'Top Rated',
                  ),
                  ListOfMoviesWidget(
                    height: height,
                    width: width,
                    movieList: topRatedMovies,
                  ),
                ],
              ),
            ),
    );
  }
}

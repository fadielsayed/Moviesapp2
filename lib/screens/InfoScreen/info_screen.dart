import 'package:flutter/material.dart';
import 'package:movie_app/screens/HomeScreen/Components/category_headline.dart';
import 'package:movie_app/screens/HomeScreen/Components/list_of_movies_widget.dart';
import 'package:movie_app/shared/Dio/dio_helper.dart';
import 'package:movie_app/shared/config/const.dart';

import 'Components/movie_crew_list.dart';
import 'Components/movie_image_name_rate.dart';
import 'Components/movie_overview.dart';
import 'Components/top_headline_movie_name.dart';

class InfoScreen extends StatefulWidget {
  const InfoScreen({
    Key? key,
    required this.movieId,
    required this.imageUrl,
  }) : super(key: key);
  final int movieId;
  final String imageUrl;

  @override
  State<InfoScreen> createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  getCrew() {
    DioHelper.getMoviesData(
      url: 'movie/${widget.movieId}/credits',
      query: {
        'api_key': kApiKey,
        'language': 'en-US',
      },
    ).then(
      (value) {
        if (value != null) {
          DioHelper.movieCast.clear();
          for (var val in value.data['cast']) {
            DioHelper.movieCast.add(val);
            setState(() {});
          }
          print(DioHelper.movieCast);
        }
      },
    );
  }

  getMovieDetails() {
    DioHelper.getMoviesData(
      url: 'movie/${widget.movieId}',
      query: {
        'api_key': kApiKey,
      },
    ).then(
      (value) {
        DioHelper.movieDescription = '';
        DioHelper.movieName = '';
        if (value != null) {
          DioHelper.movieDescription = value.data['overview'];
          DioHelper.movieName = value.data['original_title'];
          setState(() {});
          print(DioHelper.movieDescription);
          print(DioHelper.movieName);
        }
      },
    );
  }

  getMovieRate() {
    DioHelper.getMoviesData(
      url: 'movie/${widget.movieId}',
      query: {
        'api_key': kApiKey,
      },
    ).then(
      (value) {
        DioHelper.movieRate = 0.0;
        if (value != null) {
          DioHelper.movieRate = value.data['vote_average'];
          setState(() {});
        }
      },
    );
  }

  getSimilarMovie() {
    DioHelper.getMoviesData(
      url: 'movie/${widget.movieId}/similar',
      query: {
        'api_key': kApiKey,
        'language': 'en-US',
        'page': 1,
      },
    ).then(
      (value) {
        DioHelper.similarMovies = [];
        if (value != null) {
          for (var val in value.data['results']) {
            DioHelper.similarMovies.add(val);
            setState(() {});
          }
          print(DioHelper.similarMovies);
        }
      },
    );
  }

  @override
  void initState() {
    getCrew();
    getMovieDetails();
    getMovieRate();
    getSimilarMovie();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var movieCastList = DioHelper.movieCast;
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(widget.imageUrl),
          ),
        ),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              TopHeadLineMovieName(height: height),
              Container(
                color: Colors.white,
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MovieImageNameRate(
                        width: width, height: height, url: widget.imageUrl),
                    MovieOverView(width: width),
                    MovieCrewList(
                        height: height,
                        movieCastList: movieCastList,
                        width: width),
                    CategoryHeadLine(width: width, text: 'Similar'),
                    ListOfMoviesWidget(
                      width: width,
                      movieList: DioHelper.similarMovies,
                      height: height,
                    ),
                  ],
                ),
              ),
              // Spacer(flex: 10),
            ],
          ),
        ),
      ),
    );
  }
}

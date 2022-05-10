import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

import 'movie_poster.dart';

class SwiperMovieWidget extends StatelessWidget {
  const SwiperMovieWidget({
    Key? key,
    required this.width,
    required this.height,
    required this.trendingMovieList,
  }) : super(key: key);

  final double width;
  final double height;
  final List trendingMovieList;

  @override
  Widget build(BuildContext context) {
    return Swiper(
      autoplayDelay: 2,
      layout: SwiperLayout.STACK,
      itemWidth: width / 1.4,
      itemHeight: height / 2.2,
      itemBuilder: (context, index) {
        return MoviePoster(
          movieId: trendingMovieList[index]['id'],
          maxWidth: true,
          imageUrl:
              'https://image.tmdb.org/t/p/w185${trendingMovieList[index]['poster_path']}',
        );
      },
      autoplay: true,
      duration: 2000,
      itemCount: trendingMovieList.length,
    );
  }
}

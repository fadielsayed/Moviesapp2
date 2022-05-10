import 'package:flutter/material.dart';

import 'movie_item_card.dart';

class ListOfMoviesWidget extends StatelessWidget {
  const ListOfMoviesWidget({
    Key? key,
    required this.height,
    required this.width,
    required this.movieList,
  }) : super(key: key);

  final double height;
  final double width;
  final List movieList;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height / 3.2,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => Container(
          padding: EdgeInsets.all(width / 85),
          child: MovieItemCard(
            moviesLis: movieList,
            index: index,
          ),
          width: width / 2.75,
        ),
        itemCount: movieList.length,
      ),
    );
  }
}

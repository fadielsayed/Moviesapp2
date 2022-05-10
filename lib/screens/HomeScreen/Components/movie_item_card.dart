import 'package:flutter/material.dart';

import 'movie_poster.dart';

class MovieItemCard extends StatelessWidget {
  const MovieItemCard({
    Key? key,
    required this.index,
    required this.moviesLis,
  }) : super(key: key);
  final int index;
  final List moviesLis;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MoviePoster(
          imageUrl:
              'https://image.tmdb.org/t/p/w185${moviesLis[index]['poster_path']}',
          movieId: moviesLis[index]['id'],
        ),
        Text(
          moviesLis[index]['title'],
          style: Theme.of(context).textTheme.bodyText1?.copyWith(
                color: Colors.black,
                overflow: TextOverflow.ellipsis,
                fontWeight: FontWeight.bold,
              ),
        ),
      ],
    );
  }
}

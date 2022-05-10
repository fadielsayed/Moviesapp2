import 'package:flutter/material.dart';
import 'package:movie_app/screens/HomeScreen/Components/network_image_with_loading.dart';
import 'package:movie_app/screens/InfoScreen/info_screen.dart';
import 'package:movie_app/shared/config/color.dart';

class MoviePoster extends StatelessWidget {
  const MoviePoster({
    Key? key,
    required this.imageUrl,
    required this.movieId,
    this.maxWidth = false,
  }) : super(key: key);
  final String imageUrl;
  final bool maxWidth;
  final int movieId;
  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: BoxDecoration(
        color: const Color(kAppBarBackground),
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: maxWidth
          ? IgnorePointer(
              ignoring: true,
              child: NetworkImageWithLoading(
                  maxWidth: maxWidth, imageUrl: imageUrl),
            )
          : InkWell(
              enableFeedback: true,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => InfoScreen(
                      imageUrl: imageUrl,
                      movieId: movieId,
                    ),
                  ),
                );
                print('Tapped !');
              },
              child: Hero(
                tag: 'image',
                child: NetworkImageWithLoading(
                    maxWidth: maxWidth, imageUrl: imageUrl),
              ),
            ),
    );
  }
}

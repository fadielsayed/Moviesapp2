import 'package:flutter/material.dart';
import 'package:movie_app/shared/Dio/dio_helper.dart';

class TopHeadLineMovieName extends StatelessWidget {
  const TopHeadLineMovieName({
    Key? key,
    required this.height,
  }) : super(key: key);

  final double height;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(
        bottom: height / 50,
        top: height / 10,
      ),
      child: Text(
        DioHelper.movieName,
        style: Theme.of(context).textTheme.headline5!.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
      ),
    );
  }
}

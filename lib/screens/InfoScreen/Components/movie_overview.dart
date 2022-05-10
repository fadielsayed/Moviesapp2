import 'package:flutter/material.dart';
import 'package:movie_app/shared/Dio/dio_helper.dart';

class MovieOverView extends StatelessWidget {
  const MovieOverView({
    Key? key,
    required this.width,
  }) : super(key: key);

  final double width;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(
        start: width / 16,
        end: width / 16,
      ),
      child: Text(
        DioHelper.movieDescription,
        style: Theme.of(context).textTheme.headline6!.copyWith(
              fontWeight: FontWeight.normal,
              color: Colors.black,
              fontSize: 18,
            ),
      ),
    );
  }
}

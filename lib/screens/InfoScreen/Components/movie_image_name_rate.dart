import 'package:flutter/material.dart';
import 'package:movie_app/screens/HomeScreen/Components/network_image_with_loading.dart';
import 'package:movie_app/shared/Dio/dio_helper.dart';

class MovieImageNameRate extends StatelessWidget {
  const MovieImageNameRate({
    Key? key,
    required this.width,
    required this.height,
    required this.url,
    this.isInfoScreen = true,
  }) : super(key: key);

  final double width;
  final double height;
  final String url;
  final bool isInfoScreen;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: EdgeInsets.all(width / 35),
          child: Container(
            height: height / 4,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Hero(
              tag: 'image',
              child: NetworkImageWithLoading(
                imageUrl: url,
                maxWidth: false,
              ),
            ),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: width / 2,
              child: Text(
                DioHelper.movieName,
                maxLines: 2,
                style: Theme.of(context).textTheme.headline6!.copyWith(
                      fontSize: height / 45,
                      // overflow: TextOverflow.ellipsis,
                    ),
              ),
            ),
            SizedBox(
              width: width / 2,
              child: Text(
                DioHelper.movieName,
                maxLines: 2,
              ),
            ),
            Visibility(
              visible: isInfoScreen,
              child: Row(
                children: [
                  const Icon(Icons.star_border_outlined),
                  Text('\t${DioHelper.movieRate.toString()}'),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}

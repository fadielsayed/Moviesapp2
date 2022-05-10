import 'package:flutter/material.dart';
import 'package:movie_app/screens/HomeScreen/Components/network_image_with_loading.dart';

class MovieCrewList extends StatelessWidget {
  const MovieCrewList({
    Key? key,
    required this.height,
    required this.movieCastList,
    required this.width,
  }) : super(key: key);

  final double height;
  final List movieCastList;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height / 4,
      width: double.infinity,
      padding: const EdgeInsets.all(8),
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        itemCount: movieCastList.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => Column(
          children: [
            Container(
              height: height / 5,
              padding: EdgeInsets.all(width / 100),
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25.0),
              ),
              child: NetworkImageWithLoading(
                maxWidth: false,
                imageUrl:
                    'https://www.themoviedb.org/t/p/w58_and_h87_face${movieCastList[index]['profile_path']}',
              ),
            ),
            Text(
              ' ${movieCastList[index]['original_name']} ',
              maxLines: 2,
              softWrap: true,
              textWidthBasis: TextWidthBasis.parent,
            ),
          ],
        ),
      ),
    );
  }
}

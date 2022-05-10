import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class NetworkImageWithLoading extends StatelessWidget {
  const NetworkImageWithLoading({
    Key? key,
    required this.maxWidth,
    required this.imageUrl,
  }) : super(key: key);

  final bool maxWidth;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      progressIndicatorBuilder: (context, url, downloadProgress) {
        return Center(
          child: CircularProgressIndicator(
            value: downloadProgress.progress,
            strokeWidth: 3,
          ),
        );
      },
      errorWidget: (context, url, error) {
        return const Center(
          child: Icon(
            Icons.error,
            color: Colors.red,
          ),
        );
      },
      width: maxWidth ? MediaQuery.of(context).size.width / 1.34 : null,
      fit: BoxFit.fill,
      imageUrl: imageUrl,
    );
  }
}

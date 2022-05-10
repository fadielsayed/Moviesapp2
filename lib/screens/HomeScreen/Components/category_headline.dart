import 'package:flutter/material.dart';

class CategoryHeadLine extends StatelessWidget {
  const CategoryHeadLine({
    Key? key,
    required this.width,
    required this.text,
  }) : super(key: key);

  final double width;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(width / 50),
      child: Text(
        text,
        style: Theme.of(context)
            .textTheme
            .headline5
            ?.copyWith(fontWeight: FontWeight.bold),
      ),
    );
  }
}

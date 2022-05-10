import 'package:flutter/material.dart';
import 'package:movie_app/screens/SearchScreen/search_screen.dart';
import 'package:movie_app/shared/config/color.dart';

PreferredSizeWidget homeScreenAppBar({required context}) => AppBar(
      title: const Text('Movies on Cine\'s'),
      centerTitle: true,
      backgroundColor: const Color(kAppBarBackground),
      actions: [
        IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SearchScreen(),
              ),
            );
          },
          icon: const Icon(Icons.search),
        ),
      ],
    );

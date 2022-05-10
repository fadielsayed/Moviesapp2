import 'package:flutter/material.dart';
import 'package:movie_app/screens/InfoScreen/info_screen.dart';
import 'package:movie_app/shared/Dio/dio_helper.dart';
import 'package:movie_app/shared/config/const.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);
  static final searchTextFormController = TextEditingController();

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final testImage =
      'https://image.tmdb.org/t/p/w185/iUgygt3fscRoKWCV1d0C7FbM9TP.jpg';

  getSearchResult() {
    DioHelper.getMoviesData(
      url: 'search/movie',
      query: {
        'api_key': kApiKey,
        'language': 'en-US',
        'query': SearchScreen.searchTextFormController.text,
        'page': '1',
        'include_adult': false,
      },
    ).then(
      (value) async {
        if (value.data != null) {
          DioHelper.searchList.clear();
          for (var val in value.data['results']) {
            DioHelper.searchList.add(val);
            setState(() {});
          }
          kIsSearchDone = true;
          print(DioHelper.searchList.length);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_outlined,
            color: Colors.grey,
          ),
        ),
        title: TextFormField(
          cursorColor: Colors.black,
          style: Theme.of(context)
              .textTheme
              .headline6
              ?.copyWith(color: Colors.black),
          controller: SearchScreen.searchTextFormController,
          onFieldSubmitted: (value) {
            getSearchResult();
          },
          decoration: InputDecoration(
            hintStyle: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {});
                SearchScreen.searchTextFormController.clear();
              },
              icon: const Icon(
                Icons.clear,
                color: Colors.grey,
              ),
            ),
            hintText: 'Search',
            border: const OutlineInputBorder(borderSide: BorderSide.none),
          ),
        ),
      ),
      body: kIsSearchDone
          ? ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: DioHelper.searchList.length,
              itemBuilder: (context, index) {
                return SearchItemWidget(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => InfoScreen(
                          movieId: DioHelper.searchList[index]['id'],
                          imageUrl: DioHelper.searchList[index]
                                      ['poster_path'] !=
                                  null
                              ? 'https://image.tmdb.org/t/p/w185${DioHelper.searchList[index]['poster_path']}'
                              : 'https://cdn-icons-png.flaticon.com/512/5229/5229336.png',
                        ),
                      ),
                    );
                  },
                  width: width,
                  imageUrl: DioHelper.searchList[index]['poster_path'] != null
                      ? 'https://image.tmdb.org/t/p/w185${DioHelper.searchList[index]['poster_path']}'
                      : 'https://cdn-icons-png.flaticon.com/512/5229/5229336.png',
                  fileName: DioHelper.searchList[index]['original_title'],
                );
              },
            )
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
//https://image.tmdb.org/t/p/w185${DioHelper.searchList[index]['poster_path']}

class SearchItemWidget extends StatelessWidget {
  const SearchItemWidget({
    Key? key,
    required this.imageUrl,
    required this.fileName,
    required this.width,
    this.onTap,
  }) : super(key: key);

  final String imageUrl;
  final String fileName;
  final double width;
  final Function? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => onTap!(),
      leading: Image.network(imageUrl),
      title: Text(
        fileName,
        style: Theme.of(context).textTheme.headline6,
      ),
      subtitle: Text(
        fileName,
        style: Theme.of(context).textTheme.caption,
      ),
    );
  }
}

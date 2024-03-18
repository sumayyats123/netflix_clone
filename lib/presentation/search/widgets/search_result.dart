import 'package:flutter/material.dart';
import 'package:netflixcloneapp/core/api/api_constant.dart';
import 'package:netflixcloneapp/core/colors/constants.dart';
import 'package:netflixcloneapp/model/movies.dart';
import 'package:netflixcloneapp/presentation/search/widgets/title.dart';

class SearchResultWidget extends StatelessWidget {
  const SearchResultWidget({Key? key, required this.snapshot,}) : super(key: key);

  final AsyncSnapshot<List<Movie>> snapshot;

 
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SearchTextTitle(title: "Movies & TV"),
        khight,
        Expanded(
          child: GridView.count(
            shrinkWrap: true,
            crossAxisCount: 3,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            childAspectRatio: 1.2 / 2,
            children: List.generate(snapshot.data!.length, (index) {
              return MainCard(index: index, snapshot: snapshot,);
            }),
          ),
        ),
      ],
    );
  }
}
  
class MainCard extends StatelessWidget {
  const MainCard({super.key, required this.index, required this.snapshot,});

  final int index;
  final AsyncSnapshot<List<Movie>> snapshot;
 

  @override
  Widget build(BuildContext context){
    return Container(
      height: 100,
      width: 100,
      decoration: BoxDecoration(
        image:  DecorationImage(
          image:NetworkImage("${ApiConstants.imageBaseUrl}${snapshot.data![index].posterPath}"),
          fit: BoxFit.cover
          ),
          borderRadius:BorderRadius.circular(7),
      ),
    );
  }
}
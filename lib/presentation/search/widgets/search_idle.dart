import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflixcloneapp/core/api/api_constant.dart';
import 'package:netflixcloneapp/core/api/api_movies.dart';
import 'package:netflixcloneapp/core/colors/colors.dart';
import 'package:netflixcloneapp/core/colors/constants.dart';
import 'package:netflixcloneapp/model/movies.dart';
import 'package:netflixcloneapp/presentation/search/widgets/title.dart';

const imageUrl="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSf0UOLLV5ADb9x5iKoFPbEVDDpohdH4ABE1FAt8ZvUXJX2Q3d18IK2d8JGWjHF7exSTVE&usqp=CAU";

class SearchIdleWidget extends StatefulWidget {
  const SearchIdleWidget({super.key});

  @override
  State<SearchIdleWidget> createState() => _SearchIdleWidgetState();
}

class _SearchIdleWidgetState extends State<SearchIdleWidget>{

late Future<List<Movie>> idle;
@override
  void initState() {
  idle=Api().getSearchIdle();
    super.initState();
  }




  @override
  Widget build(BuildContext context){
    return   Column(
       crossAxisAlignment: CrossAxisAlignment.start, 
      children:[
        const SearchTextTitle(title:"Top Searches"),
                khight,
          Expanded(
            child:FutureBuilder<List<Movie>>(
  future: idle,
  builder: (context, snapshot) {
    if (snapshot.connectionState == ConnectionState.waiting) {
      return const Center(child: CircularProgressIndicator());
    } else if (snapshot.hasError) {
      return Text('Error: ${snapshot.error}');
    } else {
      if (snapshot.data != null) {
        var searchIdleMovie = snapshot.data!;
        return ListView.separated(
          shrinkWrap: true,
          itemBuilder: (ctx, index) {
            final data = searchIdleMovie[index];
            return TopSearchItemTile(
              index: index,
              imageUrl: data.posterPath,
              title: data.title,
            );
          },
          separatorBuilder: (ctx, index) => khight20,
          itemCount: searchIdleMovie.length,
        );
      } else {
        return const Text('No data available');
      }
    }
  },
)

          ),
      ],
    );
  }
}

class TopSearchItemTile extends StatelessWidget {
  const  TopSearchItemTile ({super.key, required this.index, required this.imageUrl, required this.title, });

final String imageUrl;
final int index;
final String title;

  @override
  Widget build(BuildContext context){
    final screenWidth = MediaQuery.of(context).size.width; 
    return Row(children: [
    Container(
      width:screenWidth*0.35,
      height:65,
      decoration:  BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image:NetworkImage("${ApiConstants.imageBaseUrl}$imageUrl"
            ),
            ),
      ),
    ),
     Expanded(child: Padding(
       padding: const EdgeInsets.all(8.0),
       child: Text(title,
         style:const TextStyle(
        color: kwhiteColor,
        fontWeight:FontWeight.bold,
        fontSize: 16, 
         ) ,
         ),
     ),
    ),
    const CircleAvatar(backgroundColor: kwhiteColor,
    radius: 27,
    child: CircleAvatar(
      backgroundColor:kBlackColor,
      radius: 25,
      child: Icon(CupertinoIcons.play_fill,color:kwhiteColor,),
    ),
    ),
    ],
    );
  }
}
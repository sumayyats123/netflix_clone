
import 'package:flutter/material.dart';
import 'package:netflixcloneapp/core/api/api_movies.dart';
import 'package:netflixcloneapp/model/movies.dart';
import 'package:netflixcloneapp/presentation/widgets/main_card.dart';
import 'package:netflixcloneapp/presentation/widgets/main_title.dart';

class MainTitleCard extends StatefulWidget {
  const MainTitleCard({
    Key?key,required this.title,
  }):super(key: key);

 final  String title; 

  @override
  State<MainTitleCard> createState() => _MainTitleCardState();
}

class _MainTitleCardState extends State<MainTitleCard> {
  late   Future<List<Movie>> toprateddata; 
  @override
  void initState() {
    toprateddata=Api().getTopratedMovie();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
     MainTitle(title:widget.title),
        SizedBox(
          height:200,
         
          child:FutureBuilder<List<Movie>>(
                          future: toprateddata,builder:(context,snapshot){
                            var movies=snapshot.data;
                            return ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount:movies?.length,
                            itemBuilder: (context, index) {
                              final movie = movies?[index];
                              final url = movie!.backdropPath;
                              return MainCardNEW(
                              index: index,imageUrl: url,
                            );
                            }
                          );
                          },
                        ),
        )
      ],
    );
  }
}
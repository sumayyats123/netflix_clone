import 'package:flutter/material.dart';
import 'package:netflixcloneapp/core/api/api_movies.dart';
import 'package:netflixcloneapp/model/movies.dart';
import 'package:netflixcloneapp/presentation/home/widgets/number_title_card.dart';

class ScreenHome extends StatefulWidget {
  const ScreenHome({super.key});

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}



class _ScreenHomeState extends State<ScreenHome> {
late Future<List<Movie>> trendingMovies;    
void initStaate(){
  super.initState();
  trendingMovies = Api().getTrendingMovie();
}

  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
        body: SingleChildScrollView( 
          child: NumberTitleCard(
          ),
        ));
  }
}



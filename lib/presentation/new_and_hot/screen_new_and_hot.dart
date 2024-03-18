import 'package:flutter/material.dart';
import 'package:netflixcloneapp/core/api/api_movies.dart';
import 'package:netflixcloneapp/core/colors/colors.dart';
import 'package:netflixcloneapp/core/colors/constants.dart';
import 'package:netflixcloneapp/model/movies.dart';
import 'package:netflixcloneapp/presentation/new_and_hot/widgets/coming_soon_widget.dart';
import 'package:netflixcloneapp/presentation/new_and_hot/widgets/everyoneswatching_widget.dart';



class ScreenNewAndHot extends StatefulWidget {
 
   const ScreenNewAndHot({Key? key,}):super(key: key);

  @override
  State<ScreenNewAndHot> createState() => _ScreenNewAndHotState();
}

class _ScreenNewAndHotState extends State<ScreenNewAndHot> {

late   Future<List<Movie>>newnandhot;
 @override

  void initState() {
     newnandhot=Api().getNewandHot();
    super.initState();
    
  }


  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(90),
          child: AppBar(
            title: const Text(
              "New & hot",
              style: TextStyle(
                color: kwhiteColor,
                fontSize: 30,
                fontWeight: FontWeight.bold
              ),
            ),
            actions:[ 
              const Icon(
                Icons.cast,
                color: Colors.white,
                size: 30,
              ),
              kwidth,
              Container(
                width: 30,
                height: 30,
                color: Colors.blue,
              ),
              kwidth,
            ],
            bottom: TabBar(
              labelColor: kBlackColor,
              unselectedLabelColor: kwhiteColor,
              isScrollable: true,
              dividerColor: Colors.transparent,
              labelStyle: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
              indicator: BoxDecoration(
                color: kwhiteColor,
                borderRadius: kRadius30,
              ),
              tabs: const [
                Tab(
                  text: '🍿 Coming Soon',
                ),
                Tab(
                  text: "👀 Everyone's watching",
                ),
              ],
            ),
          ),
          
        ),
        
        body: TabBarView(children: [
               _buildComingSoon(),
           _buildEveryonewatching(),
        ]),
      ),
    );
  }

Widget _buildComingSoon(){
  return FutureBuilder<List<Movie>>(
    future: newnandhot,
    builder: (context, snapshot){
      if (snapshot.hasError) {
        return const Center(child: Text("Error occurred"));
      } else if(snapshot.hasData) {
        List<Movie>? newHotMovies = snapshot.data;
        if(newHotMovies != null && newHotMovies.isNotEmpty) {
          return ListView.builder(
            itemCount: newHotMovies.length,
            itemBuilder: (context, index){
              final newHot = newHotMovies[index];
              final url = newHot.backdropPath;
              final title = newHot.title;
              final overview=newHot.overview;
              return ComingSoonWidget(imageUrl: url, index: index,title: title,overview:overview ,);
            },
          );
        } else {
          return const Center(child: Text("No data available"));
        }
      } else {
        return const Center(child: CircularProgressIndicator());
      }
    },
  );
}


  Widget _buildEveryonewatching(){
  return Padding(
    padding: const EdgeInsets.all(15.0),
    child: FutureBuilder<List<Movie>>(
      future: newnandhot,
      builder: (context, snapshot){
        if (snapshot.hasError) {
          return const Center(child: Text("Error occurred"));
        } else if(snapshot.hasData) {
          List<Movie>? newHotMovies = snapshot.data;
          if(newHotMovies != null && newHotMovies.isNotEmpty) {
            return ListView.builder(
              itemCount: newHotMovies.length,
              itemBuilder: (context, index){
                final newHot = newHotMovies[index];
                final url = newHot.backdropPath;
                final title = newHot.title;
                final overview=newHot.overview;
                return EveryonesWatchingWidget(imageUrl: url,index: index,overview:overview,title: title,);
              },
            );
          } else {
            return const Center(child: Text("No data available"));
          }
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    ),
  );
}
}
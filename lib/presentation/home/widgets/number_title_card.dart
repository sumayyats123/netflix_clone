import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:netflixcloneapp/core/api/api_movies.dart';
import 'package:netflixcloneapp/core/colors/constants.dart';
import 'package:netflixcloneapp/model/movies.dart';
import 'package:netflixcloneapp/presentation/home/widgets/background_card.dart';
import 'package:netflixcloneapp/presentation/home/widgets/number_card.dart';
import 'package:netflixcloneapp/presentation/widgets/main_title.dart';
import 'package:netflixcloneapp/presentation/widgets/main_title_card.dart';


ValueNotifier<bool> scrollNotifier = ValueNotifier(true);

class NumberTitleCard extends StatefulWidget {
  
  const NumberTitleCard({
    Key? key,
  }) : super(key: key);

  @override
  State<NumberTitleCard> createState() => _NumberTitleCardState();
}

class _NumberTitleCardState extends State<NumberTitleCard> {
late   Future<List<Movie>> data;

  @override
  void initState() {
    data=  Api().getTrendingMovie();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: scrollNotifier,
      builder: (BuildContext context, bool value, Widget? child) {
        return NotificationListener<UserScrollNotification>(
          onNotification: (UserScrollNotification notification) {
            final ScrollDirection direction = notification.direction;
            if (direction == ScrollDirection.reverse) {
              scrollNotifier.value = false;
            } else if (direction == ScrollDirection.forward) {
              scrollNotifier.value = true;
            }
            return true;
          },
          child: Stack(
            children: [
              Column(
                children: [
                   const BackgroundCard(),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                    child: MainTitleCard(title: "Released in the past year"),
                  ),
                  khight,
                  const SizedBox(height: 10,
                   

                  )
                  ,
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5 ),
                    child: MainTitleCard(title: "Trending Now"),
                  ),
                  khight,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      khight,
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                        child: MainTitle(title: "Top 10 Tv Shows In India Today"),
                      ),
                      khight,
                      SizedBox(
                        height:200,
                        child: FutureBuilder<List<Movie>>(
                          future: data,builder:(context,snapshot){
                            var movies=snapshot.data;
                            return ListView.builder(
                              
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount:10,
                            itemBuilder: (context, index) {
                              final movie = movies?[index];
                              final url = movie!.backdropPath;
                              return  NumberCard(
                              index: index,imageUrl: url,
                            );
                            }
                          );
                          },
                         
                        ),
                      ),
                      khight,
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                    child: MainTitleCard(title: "Tense Dreams"),
                  ),
                  khight,
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                    child: MainTitleCard(title: "South Indian Cinema"),
                  ),
                ],
              ),
              scrollNotifier.value==true?
              AnimatedContainer(
                duration:const Duration(milliseconds: 1000 ) ,
                width: double.infinity,
                height: 105,
                color: Colors.black.withOpacity(0.3 ),
                child: Column(
                  children: [
                  Padding(
                    padding: const EdgeInsets.only(top:35),
                    child: Row(
                      children: [
                        Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRq4N3xaDYwv3Hz2MKb9q1WlJydOtbbURDcO63iw1P6qwt5DSCdr_-ekRPDf8xOIarH2n8&usqp=CAU",
                        width: 50,
                        height:35,
                        ),
                      const Spacer(),
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
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Row(mainAxisAlignment:MainAxisAlignment.spaceEvenly ,
                      children: [
                        Text("TV Shows",
                        style:KHomeTitleText,
                        ),
                        Text("Movies",
                         style:KHomeTitleText,),
                        Text("Categories", 
                        style:KHomeTitleText,),
                      ],
                    ),
                  ),
                  ],
                ),
              ):khight,
              
            ],
          ),
        );
      },
    );
  }
}

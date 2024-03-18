
import 'package:flutter/material.dart';
import 'package:netflixcloneapp/core/colors/colors.dart';
import 'package:netflixcloneapp/core/colors/constants.dart';
import 'package:netflixcloneapp/presentation/home/widgets/cstom_button_widget.dart';
import 'package:netflixcloneapp/presentation/widgets/video_widget.dart';

class EveryonesWatchingWidget extends StatelessWidget {
  const EveryonesWatchingWidget({
    super.key, required this.imageUrl, required this.index, required this.overview, required this.title,
  });
  final String imageUrl;
  final int index;
  final String overview;
  final String title;

  @override
  Widget build(BuildContext context) {
    return  Column(
    crossAxisAlignment: CrossAxisAlignment.start ,
    
      children: [
        khight,
          Text(title,
         style: const TextStyle(
          fontSize: 16 ,
            fontWeight: FontWeight.bold,
            ),
            ),khight,
              Text(overview,
            style: const TextStyle(
            color: kGreyColor,
            ),
            ),
            khight50, 
            VideoWidget(imageUrl:imageUrl,index:index,),
            khight,
            const Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                 CustomButtonWidgets(
                  icon: Icons.share,
                 title:"Share",
                 iconSize: 25,
                 textSize: 5,
                 ),
           kwidth,
                  CustomButtonWidgets(
                  icon: Icons.add,
                 title:"My List",
                 iconSize: 20,
                 textSize: 5,
                 ),
               kwidth,
                  CustomButtonWidgets(
                  icon: Icons.play_arrow,
                 title:"Play",
                 iconSize: 20,
                 textSize: 5,
                 ),
                 kwidth,
              ],
            )

  
      ],
    );
  }
}

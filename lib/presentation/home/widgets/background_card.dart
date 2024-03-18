import 'package:flutter/material.dart';
import 'package:netflixcloneapp/core/colors/colors.dart';
import 'package:netflixcloneapp/core/colors/constants.dart';
import 'package:netflixcloneapp/presentation/home/widgets/cstom_button_widget.dart';

class BackgroundCard extends StatelessWidget {
  const BackgroundCard({super.key});

  @override
  Widget build(BuildContext context) {
    return  Stack(children: [
           Container(
            width: double.infinity,
            height:600,
            decoration: const BoxDecoration(
              image: DecorationImage(image: NetworkImage(kMainImage),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 10 ),
              child: Row(mainAxisAlignment:MainAxisAlignment.spaceEvenly,
                children:[
                  const CustomButtonWidgets(
                    title: "My List",
                    icon: Icons.add,
                    ),
                  _playButton(),
                  const CustomButtonWidgets(
                    icon: Icons.info,
                     title: 'Info',
                     ),
                ],
              ),
            ),
          )
        ],
        );
  }
}

  TextButton _playButton() {
    return TextButton.icon(
                onPressed: (){},
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(kwhiteColor),
                ),
               icon: const Icon(Icons.play_arrow,
               size: 30 ,
               color: kBlackColor,
               ),
               label:const Padding(
                 padding: EdgeInsets.symmetric(horizontal: 10),
                 child: Text("Play",
                 style: TextStyle(
                  fontSize: 20,
                  color:kBlackColor,
                 ),
                 ),
               ),
               );
  }


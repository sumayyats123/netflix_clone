
import 'package:flutter/material.dart';
import 'package:netflixcloneapp/core/colors/colors.dart';
import 'package:netflixcloneapp/core/colors/constants.dart';
import 'package:netflixcloneapp/presentation/home/widgets/cstom_button_widget.dart';
import 'package:netflixcloneapp/presentation/widgets/video_widget.dart';

class ComingSoonWidget extends StatelessWidget {
  const ComingSoonWidget({
    super.key, required this.imageUrl,required this.index, required this.title, required this.overview, 
  });
   final String imageUrl;
  final int index;
  final String title;
  final String overview;



  @override
  Widget build(BuildContext context) {
       Size size = MediaQuery.of(context).size;
    return Row(
      children: [
        const SizedBox(
          width: 50,
          height: 450 ,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min ,
          children: [
            Text("FEB",
            style:TextStyle(
              fontSize: 13,
              color: kGreyColor, 
            ),
            ),
            Text("11",
            style: TextStyle(
            fontSize: 25,
            letterSpacing:2,
            fontWeight: FontWeight.bold,
            ),
            ),
          ],
        ),
        ),
        SizedBox(
          width: size.width-50,
          height:450,
          child:  Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          VideoWidget(imageUrl: imageUrl,index: index,), 
            Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title,
               style:const TextStyle(
              letterSpacing: -1,
                fontSize:20,
                fontWeight: FontWeight.bold,
              ),
              ),
            
              const Row(
                children: [
                 CustomButtonWidgets(
                  icon: Icons.all_out_sharp,
                 title:"Remind me",
                 iconSize: 20,
                 textSize: 5,
                 ),SizedBox(width: 20,),
          
                 CustomButtonWidgets(
                  icon: Icons.info ,
                 title:"Info",
                 iconSize: 20,
                 textSize: 5,
                 ),
                 kwidth,
                ],
              ),
            ],
          ),
          khight,
           Text("Coming Soon"),
          khight,
          const Text("Tall Girl 2",style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
          ),khight,
           Flexible(
             child: Text(overview,
                     style: const TextStyle(
              color: kGreyColor,
              fontSize: 15,
                     ),
                     ),
           ) ,          
           SizedBox(height:20,)
          ],
          ) ,
        ),
      ],
    );
  }
}

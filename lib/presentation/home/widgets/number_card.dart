import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:netflixcloneapp/core/api/api_constant.dart';
import 'package:netflixcloneapp/core/colors/colors.dart';
import 'package:netflixcloneapp/core/colors/constants.dart';

class NumberCard extends StatelessWidget {
  const NumberCard({Key?key, required this.index,required this.imageUrl}):super(key: key);
  final String imageUrl;
 final int index;
 
  @override
  Widget build(BuildContext context) {
    return 
      Stack(
        children: [
          Row(
            children: [ 
              const SizedBox(width:70,
              height: 200,
              ),
              Container( 
               width: 130,
              height:200,
              decoration: BoxDecoration(
                borderRadius:kRadius10,
                image:   DecorationImage(
                  image: NetworkImage("${ApiConstants.imageBaseUrl}$imageUrl",
              ),fit: BoxFit.cover
              ),
              ),
    ),
            ],
          ),
          Positioned(
          left: 20,
      bottom: -35, 
            child: BorderedText(
              strokeWidth: 10.0,
              strokeColor: kwhiteColor ,
              child: Text(
                "${index +1}", 
              style:const TextStyle(
                fontSize:130 ,
                color: kBlackColor,
               decoration: TextDecoration.none,
               decorationColor: Colors.black,
                ),
                 ),
                ),
                ),
        ],  
      );
    
  }
}
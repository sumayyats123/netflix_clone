
import 'package:flutter/material.dart';
import 'package:netflixcloneapp/core/api/api_constant.dart';
import 'package:netflixcloneapp/core/colors/colors.dart';


class VideoWidget extends StatelessWidget {
  const VideoWidget({
    super.key, required this.imageUrl, required this.index,
  });
  final String imageUrl;
  final int index;
  

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
        width: double.infinity ,  
        height: 200,
        child: Image.network('${ApiConstants.imageBaseUrl}$imageUrl',fit: BoxFit.cover,),
        ),
        
         
          Positioned(
            bottom: 10,
            right: 10,

            child: CircleAvatar(
                        radius:22,
                        backgroundColor:Colors.black.withOpacity(0.5) ,
                         child: IconButton(
                          onPressed: (){}, 
                          icon: const Icon(
                            Icons.volume_off,
                            color: kwhiteColor,
                            size: 20,
                            ),
                            ),
                       ),
          ),
      ],
    );
  }
}

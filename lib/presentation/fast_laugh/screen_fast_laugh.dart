import 'package:flutter/material.dart';
import 'package:netflixcloneapp/core/api/api_constant.dart';
import 'package:netflixcloneapp/presentation/fast_laugh/widgets/video_list_item.dart';

class ScreenFastLaugh extends StatelessWidget {
  const ScreenFastLaugh ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SafeArea(
        child:PageView(
          scrollDirection: Axis.vertical,
        children: List.generate(kVideos.length, (index){
          return VideoListItem(index: index, videoUrl: kVideos[index],);
        }), 
          
        ),
        ),
    );
  }
}
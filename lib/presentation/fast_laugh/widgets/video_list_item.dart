import 'package:flutter/material.dart';
import 'package:netflixcloneapp/core/colors/colors.dart';
import 'package:video_player/video_player.dart';


class VideoListItem extends StatefulWidget{
  final int index;
  const VideoListItem({Key?key,required this.index, required this.videoUrl}):super(key: key);
final String videoUrl;

  @override
  State<VideoListItem> createState() => _VideoListItemState();
}

class _VideoListItemState extends State<VideoListItem> {

 late VideoPlayerController _videoControler;

 @override
  void initState() {
 final url=Uri.parse(widget.videoUrl);
 _videoControler=VideoPlayerController.networkUrl(url,)..initialize().then((_){
setState(() {
  _videoControler.play();
});
 });
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Stack (
      children: [
        Container(  height: double.infinity,  child: _videoControler.value.isInitialized?AspectRatio(aspectRatio: _videoControler.value.aspectRatio,child:VideoPlayer(_videoControler,) ,):const Center(child: CircularProgressIndicator(),)
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:[

                // LEFT SIDE
             CircleAvatar(
              radius:30,
              backgroundColor:Colors.black.withOpacity(0.5) ,
               child: IconButton(
                onPressed: (){}, 
                icon: const Icon(
                  Icons.volume_off,
                  color: kwhiteColor,
                  size: 30,
                  ),
                  ),
             ),
             

              //  RIGHT SIDE
              const Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: CircleAvatar(
                      radius: 30,
                      backgroundImage: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRFyAxjHveGvAT2FCjGo8BYHgQb-PX6OB5JCQ&usqp=CAU"),
                    ),
                  ),
                 VideoActionsWidgets(icon: Icons.emoji_emotions, title: "LOL"),
                   VideoActionsWidgets(icon: Icons.add, title: "My List"),
                     VideoActionsWidgets(icon: Icons.share, title: "Share"),
                       VideoActionsWidgets(icon: Icons.play_arrow, title: "Play"),
                      
                ],
              )
              
              ],
            ),
          ),
        )
      ],
    );
  }@override
  void dispose() {
   _videoControler.dispose();
    super.dispose();
  }
}


class VideoActionsWidgets extends StatelessWidget {
  final IconData icon;

  final String title;
  const VideoActionsWidgets({
    Key?key,
    required this.icon,
    required this.title,
    }):super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical:10,horizontal:10),
      child: Column(
        children: [
          Icon(icon,
          color: Colors.white,
          size: 30,
          ),
          Text(title,
          style: const TextStyle(
            color: kwhiteColor,
            fontSize: 14,
    
    
          ),
          ),
        ],
      ),
    );
  }
}
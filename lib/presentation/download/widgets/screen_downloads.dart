import 'dart:math';
import 'package:flutter/material.dart';
import 'package:netflixcloneapp/core/colors/colors.dart';
import 'package:netflixcloneapp/core/colors/constants.dart';
import 'package:netflixcloneapp/presentation/widgets/app_bar_widget.dart';
class ScreenDownloads extends StatelessWidget {
  ScreenDownloads ({super.key});

final _widgetList=[
   const _SmartDownloads(),
          Section2(),
        const Section3(),
]; 

  
  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      appBar:  const PreferredSize(
        preferredSize:Size.fromHeight(50) ,
        child: AppBarWidget(title: "Downloads",),
        ),
      body:ListView.separated(
        padding:EdgeInsets.all(10) ,
        itemBuilder:(ctx,index)=>_widgetList[index],
         separatorBuilder:(ctx,index)=>SizedBox(height: 25,),
          itemCount:_widgetList.length,
          ),
    );
  }
}

class Section2 extends StatelessWidget {
  Section2({super.key});
   
  final List imageList=[
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT7V-xb0JFdyTe9fprjBJDvPB5DudEbhU_lyw&usqp=CAU",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQXc2ZpHeulg8zoosZcNfnKnWvHkNNB33zQS0OPXGaBWSsS_HiFYVDtRIZHpMjnZiQAlIM&usqp=CAU",
    "https://image.tmdb.org/t/p/original/aY0EwKYWb4GrBjDuoY7hBAjRvE4.jpg",
    
  ]; 

  @override
  Widget build(BuildContext context) {
     final Size size=MediaQuery.of(context).size;
    return Column(children: [
       const Text('Introducing Downloads for you ',
          textAlign:TextAlign.center,
          style: TextStyle(
            color: kwhiteColor,
            fontSize: 22,
            fontWeight: FontWeight.bold),
            ),
            khight,
          const Text("We will download a personalised selection of\nmovies and shows for you, so there 'S\nalways something to watch on your\ndevice.",
          textAlign: TextAlign.center,
          style: TextStyle(
          color: Colors.grey,
          fontSize: 16 
          ),
          ),
          SizedBox(
        width: size.width,
        height: size.width,
       
        child: Stack(
          alignment: Alignment.center,
          children: [
        CircleAvatar(
          radius: size.width*0.4,
          backgroundColor: Colors.grey.withOpacity(0.5)
        ),
        DownloadsImageWidgets(
          imageList: imageList[0],
          margin: EdgeInsets.only(left:155,top: 50 ),
          angle:25 ,
          size: Size(size.width*0.35,size.width*0.55),
        ), 
        DownloadsImageWidgets(
          imageList: imageList[1], 
          margin: EdgeInsets.only(right:155,top: 50 ),
          angle: -20,
           size: Size(size.width*0.35,size.width*0.55),
        ),
         DownloadsImageWidgets(
          imageList: imageList[2],
          radius:8 , 
          margin: EdgeInsets.only(bottom: 40,top: 54),
           size: Size(size.width*0.4,size.width*0.6),
        ),
        ],
        ),
          ),
      
    ],);
  }
}

class Section3 extends StatelessWidget {
  const Section3({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
        SizedBox(
          width: double.infinity,
          child: MaterialButton(
              color:kButtonColorBlue,
              onPressed: (){},
              shape: RoundedRectangleBorder(
                borderRadius:BorderRadius.circular(5),
              ),
              child:  const Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child:  Text("Set up",
                style: TextStyle(
                  color: kwhiteColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                ),
              ),
              ),
             ),
             khight,
         MaterialButton(
            color:
            kButtonColourWhite,
            onPressed: (){},
             shape: RoundedRectangleBorder(
              borderRadius:BorderRadius.circular(5),
            ),
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical:10),
              child:  Text("See what you can download",
              style: TextStyle(
                color: kBlackColor,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              ),
            ),
            ),
    ],);
  }
}

class _SmartDownloads extends StatelessWidget {
  const _SmartDownloads({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        kwidth,
        Icon(Icons.settings,
        color: kwhiteColor,
        ),
        kwidth,
        Text("Smart Downloads")
      ],
    );
  }
}

class DownloadsImageWidgets extends StatelessWidget {
  const DownloadsImageWidgets({
    super.key,
    this.angle=0,
    required this.imageList,
    required this.margin,
    required this.size,
    this.radius=10
  });


  final String imageList;
  final double angle;
  final EdgeInsets margin;
  final Size size;
  final double radius;

  @override
  Widget build(BuildContext context) {
    // final Size size=MediaQuery.of(context).size;
    return Padding(
      padding:margin,
      child: Transform.rotate(
        angle: angle*pi/180, 
        child: ClipRRect(
           borderRadius: BorderRadius.circular(radius),
          child: Container(
            // margin: margin,
            width: size.width ,
            height: size.height,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(radius),
              image: DecorationImage(
                fit: BoxFit.cover,
              image: NetworkImage(
              imageList,
            ),
            ), 
            ),
          ),
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:netflixcloneapp/presentation/download/widgets/screen_downloads.dart';
import 'package:netflixcloneapp/presentation/fast_laugh/screen_fast_laugh.dart';
import 'package:netflixcloneapp/presentation/home/screen_home.dart';
import 'package:netflixcloneapp/presentation/main_page/widgets/bottom_nav.dart';
import 'package:netflixcloneapp/presentation/new_and_hot/screen_new_and_hot.dart';
import 'package:netflixcloneapp/presentation/search/screen_search.dart';

class ScreenMainPage extends StatelessWidget {
  ScreenMainPage({super.key});

final _pages=[
  const ScreenHome(),
  const ScreenNewAndHot(),
  const ScreenFastLaugh(),
  const ScreenSearch(),
  ScreenDownloads(),
];

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
     
      body: SafeArea(
        child: ValueListenableBuilder(valueListenable: indexChangeNotifier, builder: (context, int index, _) {
         return _pages[index];
        },),
      ),
    
      bottomNavigationBar:const BottomNavigationWidget()
    );
  }
}

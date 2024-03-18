import 'package:flutter/material.dart';
import 'package:netflixcloneapp/core/colors/colors.dart';
import 'package:netflixcloneapp/presentation/main_page/screen_main_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Netflix App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(backgroundColor: Colors.transparent),
        fontFamily: "NetflixSans",
      useMaterial3: true, colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue).copyWith(background: Colors.black),
      scaffoldBackgroundColor:backgroundColor,
      // fontFamily: GoogleFonts.montserrat().fontFamily,
      textTheme:const TextTheme(
        bodyLarge: TextStyle(color: Colors.white),
        bodyMedium: TextStyle(color: Colors.white),
      )
      ),
      home:  ScreenMainPage(),
    );
  }
}


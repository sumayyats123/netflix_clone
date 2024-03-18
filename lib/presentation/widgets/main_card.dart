import 'package:flutter/material.dart';
import 'package:netflixcloneapp/core/api/api_constant.dart';
import 'package:netflixcloneapp/core/colors/constants.dart';

class MainCardNEW extends StatelessWidget {
  const MainCardNEW({
    Key? key,
    required this.imageUrl,
    required this.index,
  }) : super(key: key);

  final String imageUrl;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        width: 130,
        height: 250,
        decoration: BoxDecoration(
          borderRadius: kRadius30,
        ),
        child: ClipRRect(
          borderRadius: kRadius10,
          child: Image.network(
            "${ApiConstants.imageBaseUrl}$imageUrl",
            fit: BoxFit.cover, 
          ),
        ),
      ),
    );
  }
}

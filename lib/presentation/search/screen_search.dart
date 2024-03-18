import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_debouncer/flutter_debouncer.dart';
import 'package:netflixcloneapp/core/api/api_movies.dart';
import 'package:netflixcloneapp/core/colors/constants.dart';
import 'package:netflixcloneapp/model/movies.dart';
import 'package:netflixcloneapp/presentation/search/widgets/search_idle.dart';
import 'package:netflixcloneapp/presentation/search/widgets/search_result.dart';


class ScreenSearch extends StatefulWidget {
  const ScreenSearch ({super.key});

  @override
  State<ScreenSearch> createState() => _ScreenSearchState();
}

class _ScreenSearchState extends State<ScreenSearch> {
  late Future <List<Movie>>searchResult;
  final Debouncer _debouncer = Debouncer();

  void handleTextFieldChange(String value){
  const duration = Duration(milliseconds: 500);
  _debouncer.debounce(
    duration: duration,
    onDebounce: () {
      setState(() {
      });
    },
  );
}
  
   

 @override
  void initState() {
  super.initState();
  searchResult=Future.value([]);  
  }
final searchController=TextEditingController();
final _searchkey=GlobalKey<FormState>();



  void onSearchTextChanged(String newtext) {
    if (newtext.isEmpty) {
      setState(() {
        searchResult = Future.value([]);
      });
    } else {
      _debouncer.debounce(
        duration: const Duration(milliseconds: 500),
        onDebounce: () {
          setState(() {
            searchResult = Api().searchResult(newtext);
          });
        },
      );
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0), 
          child: Form(
            key: _searchkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                 CupertinoSearchTextField(
                  onChanged: onSearchTextChanged,
                  controller:searchController ,
            backgroundColor: Colors.grey.withOpacity(0.3),
            prefixIcon:const Icon(
              CupertinoIcons.search,color: Colors.grey,
              ),
              suffixIcon: const Icon(
              CupertinoIcons.xmark_circle_fill,color: Colors.grey
              ),
              style:const TextStyle(color: Colors.white) ,
                 ), 
                 khight,
                  Expanded(
                    child: searchController.text.isEmpty
                    ? const SearchIdleWidget()
                    :FutureBuilder(future: searchResult, builder: (context,snapshot){
                      if(snapshot.connectionState==ConnectionState.waiting){
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }else if(snapshot.hasError){
                        return const Center(
                          child: Text('Result not found'),
                        );
                      }else{
                        return SearchResultWidget(snapshot:snapshot, );
                      }
                    })
                    ),
            ],
                ),
          ),
        ),
      )
    );
  }
}
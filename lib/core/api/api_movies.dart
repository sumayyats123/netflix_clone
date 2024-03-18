import 'dart:convert';

import 'package:netflixcloneapp/model/movies.dart';
import 'package:http/http.dart' as http;

class Api{
  static const _trendingUrl = "https://api.themoviedb.org/3/movie/top_rated?api_key=8fa65f36e6b683d89173d5e47c36f452";
  static const _topRatedUrl = "https://api.themoviedb.org/3/movie/upcoming?api_key=8fa65f36e6b683d89173d5e47c36f452";
  static const  _newandHotUrl="https://api.themoviedb.org/3/trending/movie/day?api_key=8fa65f36e6b683d89173d5e47c36f452"; 
  static  const _searchMovieUrl ="https://api.themoviedb.org/3/movie/upcoming?api_key=8fa65f36e6b683d89173d5e47c36f452";


Future<List<Movie>> getTrendingMovie()async{
final response= await http.get(Uri.parse(_trendingUrl));
if(response.statusCode==200){
final   decodeData =json.decode(response.body)['results'] as List;
// print(decodeData);
return decodeData.map((movie) => Movie.fromJson(movie)).toList();
}else{
  throw Exception('Somthing happened');
}
}



Future<List<Movie>>getTopratedMovie()async{
  final response=await http.get(Uri.parse(_topRatedUrl ));
  if(response.statusCode==200){
    final decodeData=json.decode(response.body)['results']as List;
    // print(decodeData);
    return decodeData.map((movie) => Movie.fromJson(movie)).toList();
  }else{
    throw Exception('Somthing happened');
  }
}




// new and hot

Future<List<Movie>>getNewandHot() async{
  final response=await http.get(Uri.parse(_newandHotUrl));
  if(response.statusCode==200){
    final decodeData=json.decode(response.body)['results'] as List;
    // print(decodeData);
    return decodeData.map((movie) => Movie.fromJson(movie)).toList();
  }else{
    throw Exception('Something happened');
  }
}


// search

Future<List<Movie>>getSearchIdle()async{
  final response=await http.get(Uri.parse(_searchMovieUrl));
  if(response.statusCode==200){
    final decodeData=json.decode(response.body)['results'] as List;
    // print(decodeData);
    return decodeData.map((movie) => Movie.fromJson(movie)).toList();
  }else{
    throw Exception('Something happened');
  }
}



Future<List<Movie>>searchResult(String movie) async{
  String searchResult="https://api.themoviedb.org/3/search/movie?api_key=8fa65f36e6b683d89173d5e47c36f452&query=$movie";
  final response=await http.get(Uri.parse(searchResult));
  if(response.statusCode==200){
    final decodeData=json.decode(response.body)['results'] as List;
    // print(decodeData.toString());
    return decodeData.map((movie) => Movie.fromJson(movie)).toList();
  }else{
    throw Exception('Somthing happened');
  }
}
}
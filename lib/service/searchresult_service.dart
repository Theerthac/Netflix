import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix/model/movie_info_model.dart';
import 'package:netflix/service/api_endpoints.dart';
import 'package:netflix/service/base_client.dart';
import 'package:netflix/view/search/search_screen.dart';

class SearchResultService {
  List<MovieinfoModel> searchResultMovies = [];

  Future fetchSearchResultMovies(BuildContext context, String apiQuery) async{
    try{
      final movies= await apiCall(ApiendPoint.searchmovies + apiQuery);
      searchResultMovies =movies.results;

      if(searchResultMovies.isEmpty){
        // ignore: use_build_context_synchronously
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return CupertinoAlertDialog(
              title: const Text('No Results'),
              content: const Text('No movies were found for your search'),
              actions: <Widget>[
                CupertinoDialogAction(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const SearchScreen(),));
                  },
                  child: const Text('OK'),
                  )
              ],
            );
          },
          );
      }
      
    }catch(error){
      log('Error fetching trending movies: $error');

      // ignore: use_build_context_synchronously
      showDialog(
        context: context, 
        builder: (BuildContext context) {
          return CupertinoAlertDialog(
            title: const Text('Error'),
            content: const Text('An error occurred while fetching movies.'),
            actions: <Widget>[
              CupertinoDialogAction(
                onPressed: () {
                  Navigator.of(context).pop();

                },
                child: const Text('OK'))
            ],
          );
        },
        );
    }return searchResultMovies;
  }
}

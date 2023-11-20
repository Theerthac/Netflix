import 'package:flutter/material.dart';
import 'package:netflix/constants/constants.dart';
import 'package:netflix/model/movie_info_model.dart';
import 'package:netflix/service/base_client.dart';

import 'package:netflix/view/widgets/home_card.dart';
import 'package:netflix/view/widgets/main_title.dart';

class HomeTitleCard extends StatelessWidget {
  const HomeTitleCard({
    super.key,
    required this.title, required this.apiUrl,
  });
  final String title;
  final String apiUrl;

  @override
  Widget build(BuildContext context) {
     List imagelist= [];
     return FutureBuilder(
      future: apiCall(apiUrl),
      builder: (context, snapshot) {
        if(!snapshot.hasData){
            const Center(
              child: Column(
                children: [
                  CircularProgressIndicator(
                    color: Colors.blue,
                  ),
                  Text("Please wait")
                ],
              ),
            );
        }
        if(snapshot.data ==null){
          return const Text('No data found');
        }
        if(snapshot.hasData){
          imagelist=snapshot.data.results.map((MovieinfoModel movieinfo){
            if(movieinfo.posterpath==null){
              return null;
            } String  imageUrl = 'https://image.tmdb.org/t/p/w500${movieinfo.posterpath}?api_key=2f9518d11e1fc9457743e722af86ac50';
            return imageUrl;
          })
          .toList();
        }
     

    
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
            MainTitle(
            title: title),
           kHeight,
         LimitedBox(
          maxHeight: 200,
           child: ListView.separated(
            
            scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => HomeCard(
            imageUrlFromApi:imagelist[index],
          ),
          itemCount: 10,
          separatorBuilder: (context, index) => kWidth,  
          
           ),
         ),
         
        ],
      );
  });
}
}
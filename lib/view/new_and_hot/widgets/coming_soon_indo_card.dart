import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:netflix/constants/constants.dart';
import 'package:netflix/model/movie_info_model.dart';
import 'package:netflix/view/home/widgets/custom_button_widget.dart';
import 'package:netflix/view/widgets/video_widget.dart';

class ComingSoonInfoCard extends StatelessWidget {
  final MovieinfoModel movieinfo;
  const ComingSoonInfoCard({super.key, required this.movieinfo});

  @override
  Widget build(BuildContext context) {
    String imageUrl =
        'https://image.tmdb.org/t/p/w500${movieinfo.posterpath}?api_key=2f9518d11e1fc9457743e722af86ac50';
    Size size = MediaQuery.of(context).size;
    return Row(children: [
      SizedBox(
          width: 50,
          height: 400,
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            Text(fetchDate(movieinfo.releaseDate),
                style: const TextStyle(fontSize: 16, color: Colors.grey)),
          ])),
      SizedBox(
        width: size.width - 50,
        height: 480,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            VideoWidget(
              videoImage: imageUrl,
            ),
            const Row(
              children: [
                CustomButton(
                  icon: Icons.notifications_none_outlined,
                  title: "Remind me",
                  iconSize: 17,
                  textSize: 14,
                ),
                kWidth,
                CustomButton(
                  icon: Icons.info,
                  title: "Info",
                  iconSize: 17,
                  textSize: 14,
                ),
                kHeight20,
              ],
            ),
            kHeight,
            Text("Coming on ${fetchDay(movieinfo.releaseDate)}"),
            kHeight,
            Text(
              movieinfo.originalTitle ?? 'Empty Title',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            kHeight,
            Expanded(
                child: Text(
              movieinfo.overview ?? 'Empty overview',
              style: const TextStyle(color: Colors.grey),
            ))
          ],
        ),
      )
    ]);
  }

    String fetchDate(String? date) {
  if (date == null) {
    
  return movieinfo.releaseDate??'Feb';
  }
  DateTime dateInFormat = DateTime.parse(date);
  final formatDate = (DateFormat.MMMMd().format(dateInFormat)).split(" ");

  return "${formatDate.first.substring(0, 3)} \n${formatDate.last}";
  
  
  
}

  String fetchDay(String? date) {
    if (date == null) {
      return movieinfo.releaseDate!;
    }
    DateTime dateInformat = DateTime.parse(date);
    final dayName = DateFormat('EEEE').format(dateInformat);
    return dayName;
  }
}

import 'package:flutter/material.dart';
import 'package:funflix/widgets/episode.dart';
import 'package:funflix/widgets/funflixbar.dart';
import 'package:funflix/constants/episode_list.dart';


class PlayerPage extends StatelessWidget {
  var movieTitle;
  var movieDetail;
  PlayerPage({super.key, this.movieTitle = "untitleed", this.movieDetail = "Lorem ipsum"});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: FunflixAppbar(),
      ),
      body:
        // SingleChildScrollView(
        //   child:
        // Column(
        //     children: [

              ListView.builder(
                padding: const EdgeInsets.all(0),
                itemCount: episodeList.length,
                itemBuilder: (context, index){
                  return
                    episodeList[index];
                },
              ),
        //     ]
        //   ),
        // ),
    );
  }
}

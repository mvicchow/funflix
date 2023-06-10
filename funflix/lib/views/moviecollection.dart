import 'package:flutter/material.dart';
import 'package:funflix/widgets/moviecard.dart';

class MovieCollection extends StatefulWidget {
  final List<String> movies; //change to api call later
  final String collectionList; //change to api call later


  const MovieCollection({Key? key, required this.movies, required this.collectionList}) : super(key: key);
  @override
  State<MovieCollection> createState() => _MovieCollectionState();
}

class _MovieCollectionState extends State<MovieCollection> {
 //change to api call later
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      // color: Colors.amber,
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // SizedBox(),
          Text(
            widget.collectionList,
            style: TextStyle(
              fontSize: 22,
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(0),
              scrollDirection: Axis.horizontal,
              itemCount: widget.movies.length,

              itemBuilder: (context, index) {
                return
                  //  ClipRRect(
                    // borderRadius: BorderRadius.circular(60.0),
                    // child:
                    MovieCard(thumbnail_path: widget.movies[index]);
                  // );
              },
            ),
          ),
        ]
      ),
    );
  }
}

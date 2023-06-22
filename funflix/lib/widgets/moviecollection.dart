import 'package:flutter/material.dart';
import 'package:funflix/widgets/moviecard.dart';

class MovieCollection extends StatefulWidget {
  final List<String> movies; //change to api call later
  final List<String> titles; //change to api call later
  final String collectionList; //change to api call later


  const MovieCollection({Key? key, required this.movies, required this.titles, required this.collectionList}) : super(key: key);
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
      padding: const EdgeInsets.only(top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // SizedBox(),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Text(

              widget.collectionList,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: widget.movies.length,

              itemBuilder: (context, index) {
                return
                  MovieCard(thumbnailPath: widget.movies[index], movieTitle: widget.titles[index],);
              },
            ),
          ),
        ]
      ),
    );
  }
}

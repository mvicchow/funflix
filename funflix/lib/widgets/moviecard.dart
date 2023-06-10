import 'package:flutter/material.dart';

class MovieCard extends StatefulWidget {
  String thumbnail_path; //change to api call later
  String movie_title;
  String movie_detail;

  MovieCard(
    {
      this.thumbnail_path = "assets/default-thumbnail.png",
      this.movie_title = "Untitled",
      this.movie_detail = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
    }
  );

  @override
  State<MovieCard> createState() => _MovieCardState();
}

class _MovieCardState extends State<MovieCard> {
  Future showDetail(context) {
    return showModalBottomSheet(
      context: context,
      builder: (context) {
        return SizedBox(
          height: 200,
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image.asset(widget.thumbnail_path),
                ),
                SizedBox(width: 20),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        widget.movie_title,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,

                      ),
                      SizedBox(height: 10),
                      Text(
                        widget.movie_detail,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 7,
                      ),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () {},

                  icon: const Icon(Icons.play_circle, size: 30,)
                )
              ],
            ),
          ),
        );
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showDetail(context);
      },
      child: Ink(
        padding: EdgeInsets.all(5),
        child:
          Container(
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              border: Border.all(),

              borderRadius: BorderRadius.circular(10),

            ),
            child: Image.asset(widget.thumbnail_path, fit: BoxFit.cover, ),
          ),
      ),
    );
  }
}


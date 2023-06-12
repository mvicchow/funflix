import 'package:flutter/material.dart';

class MovieCard extends StatefulWidget {
  final String thumbnailPath; //change to api call later
  final String movieTitle;
  final String movieDetail;

  const MovieCard(
    {super.key,
      this.thumbnailPath = "assets/default-thumbnail.png",
      this.movieTitle = "Untitled",
      this.movieDetail = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
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
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image.asset(widget.thumbnailPath),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        widget.movieTitle,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,

                      ),
                      const SizedBox(height: 10),
                      Text(
                        widget.movieDetail,
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
        padding: const EdgeInsets.all(8),
        child:
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.asset(
              widget.thumbnailPath,
              fit: BoxFit.cover,
            ),
          ),
      ),
    );
  }
}


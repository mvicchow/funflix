import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:funflix/services/user_database.dart';
// bool offstageBool= true;

class Episode extends StatefulWidget {

  var episodeTitle;
  var episodeThumbnail;
  Episode({super.key, this.episodeTitle = "Episode Title", this.episodeThumbnail="assets/Thumbnail-1.png"});

  ValueNotifier<bool> myVariable = ValueNotifier<bool>(true);

  @override
  State<Episode> createState() => _EpisodeState();
}

class _EpisodeState extends State<Episode> {

  void _showConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirmation'),
          content: Text('Are you sure to block this episode? You can manage it again in the parental control.'),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Proceed'),
              onPressed: () {

                // Perform the desired action
                // ...
                // offstageBool = false;
                setState(() {
                  widget.myVariable = ValueNotifier<bool>(false);
                });


                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return  Stack(
      children: [Container(
        height: 80,
        decoration: BoxDecoration(
          color: Colors.black38
        ),
            child: SizedBox(
              height: 100, // Fixed height for the element
              width: double.infinity,
               // Full width
              child: Center(
                child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Image.asset(widget.episodeThumbnail),
                  ),
                  const SizedBox(width: 20),

                  Expanded(
                    child: Text(
                      widget.episodeTitle,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    )
                  ),
                  IconButton(
                    onPressed: () {
                      // Navigator.push(context, MaterialPageRoute(builder: (context) => PlayerPage()));
                      UserDataServices().updateData({'movieHistory' : FieldValue.arrayUnion([widget.episodeTitle]) }, 'userWatches');
                    },

                    icon: const Icon(Icons.play_circle, size: 30,)
                  ),
                  IconButton(
                    onPressed: () {
                      UserDataServices().updateData({'movieHistory' : FieldValue.arrayUnion([widget.episodeTitle]) }, 'userWatches');
                      _showConfirmationDialog(context);

                    },

                    icon: const Icon(Icons.block, size: 30)
                  )
                ],
              ),
          ),
        ),
      ),
      // listener
      ValueListenableBuilder<bool>(
        valueListenable: widget.myVariable,
        builder: (context, value, child) {
            // print(value.toString());
            return Offstage(
            offstage: value,
            child:
            Container(
              width: double.infinity,
              height: 80,
              color: Color.fromARGB(128, 0, 0, 0),

            ),
          );
        },
      ),
      // Listener()
      //
      ]
    );
  }
}

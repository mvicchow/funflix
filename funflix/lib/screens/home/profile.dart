import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:funflix/services/auth.dart';
import 'package:funflix/widgets/loading.dart';

class Profile extends StatelessWidget {
  final AuthService _auth = AuthService();

  Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Profile',
          style: TextStyle(
            // color:  Colors.orange
          ),
        ),
        iconTheme: const IconThemeData(
          // color: Colors.orange
        ),
      ),
      body: Center(
        child: Column(
        children: [
          SizedBox(
            height: 180,
            width: 180,
            child: Container(
              // color: Colors.amber,
              child: const CircleAvatar(
                backgroundImage: CachedNetworkImageProvider('https://i1.sndcdn.com/artworks-vB8vz7nD1ZyhGTUh-yp57Rg-t500x500.jpg'),
                radius:75,
              ),
            ),
          ),

          OutlinedButton(
            onPressed: () async {
              await _auth.signOut();
              Navigator.pop(context);
            },
            child: const Text('Sign Out'),
          )
        ],
      )
    )
    );
  }
}

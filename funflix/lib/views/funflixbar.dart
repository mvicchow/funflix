import 'package:flutter/material.dart';
import 'package:funflix/models/logo.dart';
import 'package:funflix/screens/home/profile.dart';

class FunflixAppbar extends StatelessWidget  {
  final double iconsize = 35;
  const FunflixAppbar(
    {super.key}
  );

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Logo(fontsize: 35),
      backgroundColor: const Color.fromARGB(142, 0, 0, 0),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.search),
          iconSize: iconsize,
          tooltip: 'Search',
        ),
        IconButton(
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => Profile(),));
          },
          icon: const Icon(Icons.person),
          iconSize: iconsize,
          tooltip: 'Profile',
        )
      ],
    );
  }
}

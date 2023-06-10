import 'package:flutter/material.dart';
import 'package:funflix/models/logo.dart';

class FunflixAppbar extends StatelessWidget  {
  double iconsize = 35;
  FunflixAppbar(
    {super.key}
  );

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Logo(fontsize: 35),
      backgroundColor: Color.fromARGB(142, 0, 0, 0),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.search),
          iconSize: iconsize,
          tooltip: 'Search',
        ),
        IconButton(
          onPressed: (){},
          icon: const Icon(Icons.person),
          iconSize: iconsize,
          tooltip: 'Profile',
        )
      ],
    );
  }
}

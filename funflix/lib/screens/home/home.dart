import 'package:flutter/material.dart';
import 'package:funflix/constants/collection_list.dart';
import 'package:funflix/screens/passcode/passcode.dart';
import 'package:funflix/widgets/funflixbar.dart';

import '../../services/user_database.dart';
// import 'package:funflix/widgets/moviecard.dart';

class Home extends StatelessWidget {
  const Home({super.key});


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: FunflixAppbar(),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(0),
        itemCount: list.length,
        itemBuilder: (context, index){
          return
            list[index];
        },
      ),
    );
  }
}

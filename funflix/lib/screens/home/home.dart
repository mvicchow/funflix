import 'package:flutter/material.dart';
import 'package:funflix/models/collection_list.dart';
import 'package:funflix/views/funflixbar.dart';
// import 'package:funflix/widgets/moviecard.dart';

class Home extends StatelessWidget {
  const Home({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: FunflixAppbar(),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(0),
        itemCount: list.length,
        itemBuilder: (context, index){
          return
            list[index];
        },
      ),
    );
  }
}

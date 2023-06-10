import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  final double fontsize;

  const Logo({
    required this.fontsize
    }
  );

  @override
  Widget build(BuildContext context) {
    return Text(
        'FUNFLIX',
        style: TextStyle(
        color: const Color.fromARGB(255, 243, 88, 1),
        fontSize: fontsize,
        fontWeight: FontWeight.bold
        )
      );
  }
}

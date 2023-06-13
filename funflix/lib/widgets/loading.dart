import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  startLoading() {
    return const SizedBox(
      height: 350,
      child: Center(
        child: SpinKitChasingDots(
          color: Colors.orange,
          size: 50.0,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext){
    return startLoading();
  }
}

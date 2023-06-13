import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  startLoading(){
    return Container(
      child: const Center(
        child: SpinKitChasingDots(
          color: Colors.orange,
          size: 50.0,
        ),
      ),
    );
  }

  Future<void> showLoading() async {
    startLoading();

    // Minimum duration of 2 seconds
    await Future.delayed(Duration(seconds: 2));
  }

  @override
  Widget build(BuildContext){
    // showLoading();
    return startLoading();
  }
}

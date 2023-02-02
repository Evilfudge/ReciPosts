import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.brown,
      child: const Center(
        child: SpinKitFoldingCube(
          color: Colors.deepOrange,
          size: 50.0,
        ),
      ),
    );
  }
}

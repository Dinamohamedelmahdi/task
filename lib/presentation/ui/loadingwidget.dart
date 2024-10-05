import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  LoadingWidget({this.loadingMessage,super.key});

  String? loadingMessage;

  @override
  Widget build(BuildContext context) {
    return

      Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircularProgressIndicator(),
            Text(loadingMessage??"")
          ],
        ),

    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NextPage extends StatelessWidget {
  const NextPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Next Page",
              textScaleFactor: 3,
            ),
            ElevatedButton(
              onPressed: () {
                Get.back();
              },
              child: Text("Go Back"),
            )
          ],
        ),
      ),
    );
  }
}

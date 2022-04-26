import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:statemanagement/controller/user_controller.dart';

class AllUserData extends StatelessWidget {
  AllUserData({Key? key}) : super(key: key);

  UserController userController = Get.put(UserController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        if (userController.isLoading.value) {
          return const Center(child: CupertinoActivityIndicator());
        } else {
          return ListView.builder(
            itemCount: userController.usersList!.users!.length,
            itemBuilder: (context, index) {
              return Text(
                  '${userController.usersList!.users![index].username}');
            },
          );
        }
      }),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:statemanagement/controller/new_user_controller.dart';

class NewUser extends StatefulWidget {
  const NewUser({Key? key}) : super(key: key);

  @override
  State<NewUser> createState() => _NewUserState();
}

class _NewUserState extends State<NewUser> {
  NewUserController newUserController = Get.put(NewUserController());
  @override
  Widget build(BuildContext context) {
    var style = const TextStyle(
        fontWeight: FontWeight.w700, fontSize: 15, color: Colors.black);
    var color = const TextStyle(color: Colors.black);

    return Scaffold(
      backgroundColor: Colors.black.withAlpha(10),
      body: Obx(
        () {
          if (newUserController.isLoading.value) {
            return const Center(
              child: CupertinoActivityIndicator(
                radius: 20,
              ),
            );
          } else {
            return MasonryGridView.count(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 45),
              physics: const BouncingScrollPhysics(),
              itemCount: newUserController.userData!.results!.length,
              crossAxisCount: 2,
              itemBuilder: (context, index) {
                return Container(
                  child: Card(
                    color: Colors.white.withAlpha(100),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        Image.network(
                          '${newUserController.userData!.results![index].picture!.large}',
                          height: 100,
                          width: 100,
                          fit: BoxFit.cover,
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(
                              children: [
                                Text(
                                  '   Name : ',
                                  style: style,
                                ),
                                Text(
                                  ' ${newUserController.userData!.results![index].name!.title} ',
                                  style: color,
                                ),
                                Text(
                                    '${newUserController.userData!.results![index].name!.first} ',
                                    style: color),
                                Flexible(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '${newUserController.userData!.results![index].name!.last} ',
                                        style: color,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Text(
                                  '   Mob.No : ',
                                  style: style,
                                ),
                                Text(
                                  '${newUserController.userData!.results![index].phone}',
                                  style: color,
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            // Row(
                            //   children: [
                            //     Text(
                            //       'Mail : ',
                            //       style: style,
                            //     ),
                            //     Text(
                            //         '${newUserController.userData!.results![index].email}'),
                            //   ],
                            //  ),
                            // const SizedBox(
                            //   height: 10,
                            // ),
                            Row(
                              children: [
                                Text(
                                  '   Age : ',
                                  style: style,
                                ),
                                Text(
                                  '${newUserController.userData!.results![index].dob!.age}',
                                  style: color,
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Text(
                                  '   Gender : ',
                                  style: style,
                                ),
                                Text(
                                  '${newUserController.userData!.results![index].gender}',
                                  style: color,
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}

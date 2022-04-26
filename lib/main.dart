import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:path_provider/path_provider.dart';
import 'package:statemanagement/get_storage/view/getxuse.dart';
import 'package:statemanagement/view/all_user_data.dart';
import 'package:statemanagement/view/mack_up_item.dart';
import 'package:statemanagement/view/new_user.dart';
import 'package:statemanagement/view/pokemon_home_page.dart';
import 'package:statemanagement/view/mack_up_item.dart';
import 'package:hive/hive.dart';

import 'localdatabase.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Directory document = await getApplicationDocumentsDirectory();
  Hive.init(document.path);
  Hive.openBox<String>('todo');

  await GetStorage();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyPage(),
    );
  }
}

import 'package:get/get.dart';
import 'package:statemanagement/api_serices/user_service.dart';
import 'package:statemanagement/model/user_model.dart';

class UserController extends GetxController {
  var isLoading = true.obs;
  UserList? usersList;

  @override
  void onInit() {
    fetchUserDetail();
    super.onInit();
  }

  void fetchUserDetail() async {
    isLoading(true);
    try {
      final users = await AllUserData.allUserData();
      usersList = users;
    } finally {
      isLoading(false);
    }
  }
}

import 'package:get/get.dart';
import 'package:statemanagement/api_serices/new_user_service.dart';
import 'package:statemanagement/model/new_user_model.dart';

class NewUserController extends GetxController {
  var isLoading = true.obs;
  NewUserModel? userData;

  @override
  void onInit() {
    fetchNewUser();
    super.onInit();
  }

  void fetchNewUser() async {
    isLoading(true);
    try {
      final userInfo = await NewUserService.newUser();
      userData = userInfo;
    } finally {
      isLoading(false);
    }
  }
}

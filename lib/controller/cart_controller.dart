import 'package:get/get.dart';
import 'package:statemanagement/model/product_model.dart';

class CartController extends GetxController {
  var cartProduct = <Product>[].obs;
  int get count => cartProduct.length;
  double get totalPrice =>
      cartProduct.fold(0, (sum, item) => sum + double.parse(item.price!));

  void addCart(Product product) async {
    cartProduct.add(product);
  }

  void removeCart(int index) async {
    cartProduct.removeAt(index);
  }
}

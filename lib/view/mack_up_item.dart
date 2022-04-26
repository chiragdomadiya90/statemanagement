import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:statemanagement/controller/cart_controller.dart';
import 'package:statemanagement/controller/product_controller.dart';
import 'package:statemanagement/model/product_model.dart';

import 'mack_up_cart_screen.dart';

class MackUpPage extends StatefulWidget {
  const MackUpPage({Key? key}) : super(key: key);

  @override
  State<MackUpPage> createState() => _MackUpPageState();
}

class _MackUpPageState extends State<MackUpPage> {
  ProductController productController = Get.put(ProductController());
  CartController cartController = Get.put(CartController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Obx(() {
          if (productController.isLoading.value) {
            return const Center(child: CupertinoActivityIndicator());
          } else {
            return Column(
              children: [
                IconButton(
                  onPressed: () {
                    Get.to(CartScreen());
                  },
                  icon: Row(
                    children: [
                      const Icon(Icons.shopping_cart),
                      Text('${cartController.count}')
                    ],
                  ),
                ),
                Expanded(
                  child: MasonryGridView.count(
                    crossAxisCount: 2,
                    mainAxisSpacing: 4,
                    crossAxisSpacing: 4,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {},
                        child: Card(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 200,
                                child: Image.network(
                                    "${productController.productList[index].imageLink}"),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                  "${productController.productList[index].name}"),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                      "\$ ${productController.productList[index].price}"),
                                  GestureDetector(
                                    onTap: () {
                                      cartController.addCart(
                                        Product(
                                          name: productController
                                              .productList[index].name,
                                          imageLink: productController
                                              .productList[index].imageLink,
                                          price: productController
                                              .productList[index].price,
                                        ),
                                      );
                                    },
                                    child: const Icon(Icons.add_shopping_cart),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          }
        }),
      ),
    );
  }
}

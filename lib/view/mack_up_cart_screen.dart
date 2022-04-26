import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:statemanagement/controller/cart_controller.dart';

class CartScreen extends StatelessWidget {
  CartController cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade400,
      body: Obx(
        () {
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: cartController.count,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              height: 200,
                              width: 200,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(
                                      '${cartController.cartProduct[index].imageLink}'),
                                ),
                              ),
                            ),
                            Flexible(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '${cartController.cartProduct[index].name}',
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                      '\$ ${cartController.cartProduct[index].price}'),
                                ],
                              ),
                            ),
                            Column(
                              children: [
                                IconButton(
                                  onPressed: () {
                                    cartController.removeCart(index);
                                  },
                                  icon: const Icon(Icons.delete),
                                )
                              ],
                            )
                          ],
                        ),
                      ],
                    );
                  },
                ),
              ),
              Text('Total Price :\$ ${cartController.totalPrice}'),
              const SizedBox(
                height: 10,
              ),
              Text('Total Item :${cartController.count}'),
              const SizedBox(
                height: 100,
              ),
            ],
          );
        },
      ),
    );
  }
}

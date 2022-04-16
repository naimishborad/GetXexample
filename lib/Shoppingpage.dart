import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxcodex/cartController.dart';
import 'package:getxcodex/shopping_controller.dart';

class ShoppingPage extends StatelessWidget {
  const ShoppingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final shoppingController = Get.put(ShoppingController());
    final cartcontroller = Get.put(CartController());
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 3, 69, 123),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: GetX<ShoppingController>(
                builder: (controller) {
                  return ListView.builder(
                    itemCount: controller.product.length,
                    itemBuilder: (context,index){
                      return Card(
                        color: Color.fromARGB(255, 153, 208, 254),
                        margin: const EdgeInsets.all(12),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '${controller.product[index].productName}',
                                        style: TextStyle(fontSize: 24),
                                      ),
                                      Text(
                                          '${controller.product[index].productDescription}'),
                                    ],
                                  ),
                                  Text('\$${controller.product[index].price}',
                                      style: TextStyle(fontSize: 24)),
                                ],
                              ),
                              RaisedButton(
                                onPressed: () {
                                  cartcontroller
                                      .addToCart(controller.product[index]);
                                },
                                color: Color.fromARGB(255, 0, 0, 0),
                                textColor: Colors.white,
                                child: Text('Add to Cart',),
                              ),
                              
                            ],
                          ),
                        ),
                      );
                    }
                    );
                }
              ),
            ),
            GetX<CartController>(
              builder: (controller) {
                return Text("Total Amount: \$ ${controller.totalPrice}",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.blue[50]),);
              }
            ),
            SizedBox(height: 100,)
          ],
        ),
      ),
    floatingActionButton: FloatingActionButton.extended(
      backgroundColor: Colors.blue[50],
      onPressed: (){},
      icon: Icon(Icons.add_shopping_cart_rounded,color: Colors.black,),
      label: GetX<CartController>(
        builder: (controller) {
          return Text(cartcontroller.count.toString(),style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),);
        }
      ),
      
    ),
    );
  }
}
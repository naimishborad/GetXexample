import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxcodex/Produxt.dart';

class ShoppingController extends GetxController{
  var product = <Product>[].obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchProduct();
  }
  void fetchProduct()async{
    await Future.delayed(Duration(seconds: 1));
    var productResult = [
      Product(
          id: 1,
          price: 30,
          productDescription: 'some description about product',
          productImage: 'abd',
          productName: 'FirstProd'),
      Product(
          id: 2,
          price: 40,
          productDescription: 'some description about product',
          productImage: 'abd',
          productName: 'SecProd'),
      Product(
          id: 3,
          price: 49.5,
          productDescription: 'some description about product',
          productImage: 'abd',
          productName: 'ThirdProd'),
    ];
    product.value = productResult;
  }

}
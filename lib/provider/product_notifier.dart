import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:shoppinglist_app_provider/models/product.dart';

class ProductNotifier extends ChangeNotifier {
  List<Product> _productList = [];
  int _numberOfProducts = 0;

  UnmodifiableListView<Product> get productList => UnmodifiableListView(_productList);
  int get numberOfProducts => _numberOfProducts;
  
  addProduct(Product product){
    _productList.add(product);
    notifyListeners();
  }

  deleteProduct(index){
    _productList.removeAt(index);
    notifyListeners();
  }

  incrementNumberOfProducts(){
    _numberOfProducts++;
    notifyListeners();
  }
}
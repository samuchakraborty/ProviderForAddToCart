import 'package:ProvidorUsingProductPage/Model/Product.dart';
import 'package:flutter/material.dart';

class MyStore extends ChangeNotifier {
  List<Product> productItem = [];
  List<Product> basketItem = [];
  // ignore: avoid_init_to_null
  Product activeProductItem = null;

  MyStore() {
    //set up data
    productItem = [
      Product(
          id: 1,
          name: "DSlR",
          image: "https://picsum.photos/250?image=9",
          qty: 1,
          price: 100),
      Product(
          id: 2,
          qty: 1,
          image: "https://picsum.photos/250?image=8",
          price: 100,
          name: "DSlR"),
      Product(
          id: 3,
          qty: 1,
          image: "https://picsum.photos/250?image=7",
          price: 100,
          name: "DSlR"),
      Product(
          id: 4,
          qty: 1,
          image: "https://picsum.photos/250?image=10",
          price: 100,
          name: "DSlR"),
    ];
    //send notification to provider
    notifyListeners();
  }

  List<Product> get products => productItem;
  List<Product> get basket => basketItem;
  Product get activeProducts => activeProductItem;

  setActiveProduct(Product p) {
    activeProductItem = p;
  }

//add ot remove any object in basket
  addOneItemtoBasket(Product p) {
    Product found = basketItem.firstWhere((element) => element.id == p.id,
        orElse: () => null);

    if (found != null) {
      found.qty += 1;
    } else {
      basketItem.add(p);
    }
    notifyListeners();
  } //ef

//add ot remove any object in basket
  removeOneItemtoBasket(Product p) {
    Product found = basketItem.firstWhere((element) => element.id == p.id,
        orElse: () => null);

    if (found != null && found.qty == 1) {
      basketItem.remove(p);
    } else {
      found.qty -= 1;
    }

    notifyListeners();
  } //ef

  getBasketQty() {
    int total = 0;
    for (int i = 0; i < basketItem.length; i++) {
      total += basketItem[i].qty;
    }
    notifyListeners();
    return total;
  }
}

import 'package:bmi_calculator_three/model/stMangmtFruits.dart';
import 'package:flutter/cupertino.dart';

class ProviderFruitApp extends ChangeNotifier {
  Set<FruitsCart> cartItems = {};
  Set<FruitsCart> get cartProducts => cartItems;

  int get cartItemCount => cartItems.length;

  void cart(FruitsCart items) {
    if (cartItems.contains(items)) {
      cartItems.remove(items);
    } else {
      cartItems.add(items);
    }
    notifyListeners();
  }
}
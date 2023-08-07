import 'package:flutter/cupertino.dart';

class Provider_Class extends ChangeNotifier{
  List favItem = [];
  List get favoriteProducts => favItem;
  void favorites(String items){
    final favItmList = favItem.contains(items);
    if (favItmList){
      favItem.remove(items);
    }else{
      favItem.add(items);
    }
    notifyListeners();
  }
  bool icn_change(String items){
    final favItems = favItem.contains(items);
    return favItems;
  }
}
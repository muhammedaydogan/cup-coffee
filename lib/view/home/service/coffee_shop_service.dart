import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cup_coffee/core/base/base_response_model.dart';
import 'package:cup_coffee/view/home/model/coffee_model.dart';
import 'package:cup_coffee/view/home/model/shop_model.dart';

class CoffeeShopService {
  FirebaseFirestore firestore;
  CoffeeShopService({required this.firestore});

  Future<List<CoffeeModel>>? getCoffees<CoffeeModel>() async {
    var coffeeRef = await firestore.collection("coffee").get();
    List<CoffeeModel> result;
    for (var doc in coffeeRef.docs) {}

    // TODO: implement fromMap
    throw UnimplementedError();
  }

  Future<List<ShopModel>>? getShops() async {
    // TODO: implement fromMap
    throw UnimplementedError();
  }
}

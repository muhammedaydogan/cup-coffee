import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:logger/logger.dart';
import 'package:mobx/mobx.dart';

part 'home_viewmodel.g.dart';

class HomeViewModel = _HomeViewModelBase with _$HomeViewModel;

abstract class _HomeViewModelBase with Store {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Logger logger = Logger();

  @observable
  int value = 0;

  @observable
  List<Object>? something;

  @action
  void increment() {
    value++;
  }

  @action
  void init() {
    getCoffees();
    getShops();
  }

  @action
  void getCoffees() async {
    await firestore.disableNetwork();
    await firestore.enableNetwork();
    Logger logger = Logger();
    logger.d("sending request");
    try {
      QuerySnapshot coffeeRef = await firestore.collection("coffee").get();
      for (var element in coffeeRef.docs) {
        logger.d((element.data() as Map<String, dynamic>)['name'].toString());
      }
    } on Exception catch (e) {
      logger.e("error ${e.toString()}");
    }
  }

  void onTapLikeCoffee() {
    logger.d(123);
  }

  @action
  void getShops() async {
    QuerySnapshot shopsRef = await firestore.collection("shops").get();
    logger.d(shopsRef.size);
    var shop1 = shopsRef.docs.length;
    logger.d(shop1);
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:logger/logger.dart';
import 'package:mobx/mobx.dart';

part 'home_viewmodel.g.dart';

class HomeViewModel = _HomeViewModelBase with _$HomeViewModel;

abstract class _HomeViewModelBase with Store {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @observable
  int value = 0;

  @observable
  List<Object>? something;

  @action
  void increment() {
    value++;
  }

  @action
  void getCoffees() async {
    await FirebaseFirestore.instance.disableNetwork();
    await FirebaseFirestore.instance.enableNetwork();
    Logger logger = Logger();
    logger.d("sending request");
    try {
      CollectionReference coffeeRef = firestore.collection("coffee");
      logger.d(coffeeRef.id);
      DocumentSnapshot someCoffee = await coffeeRef.doc("latte").get();
      logger.d(someCoffee.data().toString());
      QuerySnapshot coffees = await coffeeRef.snapshots().last;
      logger.d(coffees.docs.isEmpty);
    } on Exception catch (e) {
      logger.e("error ${e.toString()}");
    }
  }

  void onTapLikeCoffee() {
    Logger().d(123);
  }
}

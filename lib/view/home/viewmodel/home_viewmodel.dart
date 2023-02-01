import 'package:mobx/mobx.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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
  void getCoffees() {
    CollectionReference users = firestore.collection('coffee');
    print(users.get());
  }
}

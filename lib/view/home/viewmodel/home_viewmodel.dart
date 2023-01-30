import 'package:mobx/mobx.dart';

part 'home_viewmodel.g.dart';

class HomeViewModel = _HomeViewModelBase with _$HomeViewModel;

abstract class _HomeViewModelBase with Store {
  @observable
  int value = 0;
  @action
  void increment() {
    value++;
  }
}

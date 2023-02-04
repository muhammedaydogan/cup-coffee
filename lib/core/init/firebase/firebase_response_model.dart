abstract class FirebaseResponseModel<T> {
  T? data;
  FirebaseError? error;
}

abstract class FirebaseError<T> {
  void error() {}
}

class FirebaseResponse<T> extends FirebaseResponseModel<T> {
  @override
  final T? data;
  @override
  final FirebaseError? error;

  FirebaseResponse({this.data, this.error});
}

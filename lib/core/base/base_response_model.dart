import 'package:cloud_firestore/cloud_firestore.dart';

abstract class BaseResponseModel<T> {
  T fromJson(Map<String, dynamic> json);
}

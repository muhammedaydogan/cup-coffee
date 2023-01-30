import 'package:easy_localization/easy_localization.dart';


extension StringLocalization on String {
  String get locale => this.tr();
}

extension ImagePathExtension on String {
  String get toSVG => 'assets/images/$this.svg';
  String get toPNG => 'assets/images/$this.png';
  String get toJPG => 'assets/images/$this.jpg';
}

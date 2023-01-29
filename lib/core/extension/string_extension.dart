import 'package:easy_localization/easy_localization.dart';

import '../constants/app/app_constants.dart';

extension StringLocalization on String {
  String get locale => this.tr();
}

extension ImagePathExtension on String {
  String get toSVG => 'asset/svg/$this.svg';
  String get toPNG => 'asset/svg/$this.png';
  String get toJPG => 'asset/svg/$this.jpg';
}

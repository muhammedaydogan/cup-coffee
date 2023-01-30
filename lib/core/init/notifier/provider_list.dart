import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../../../locator.dart';
import 'theme_notifier.dart';


class ApplicationProvider {
  static ApplicationProvider? _instance;
  static ApplicationProvider get instance {
    _instance ??= ApplicationProvider._init();
    return _instance!;
  }

  ApplicationProvider._init();

  List<SingleChildWidget> singleItems = [];
  List<SingleChildWidget> dependItems = [
    ChangeNotifierProvider(
      create: (context) => locator<ThemeNotifier>(),
    ),
    // List of Providers like navigation, theme, user data...
  ];
}

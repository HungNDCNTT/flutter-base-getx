import 'package:get/get.dart';

import '../ui/pages/first_screen.dart';

class RouteConfig {
  ///main page
  static final String firstScreen = "/first_screen";

  ///Alias ​​mapping page
  static final List<GetPage> getPages = [
    GetPage(name: firstScreen, page: () => FirstScreen()),
  ];
}

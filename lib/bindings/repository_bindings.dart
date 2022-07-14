import 'package:flutter_app/networks/api_util.dart';
import 'package:get/get.dart';

class RepositoryBindings implements Bindings {
  @override
  void dependencies() {
    final apiClient = ApiUtil.getApiClient();
  }
}

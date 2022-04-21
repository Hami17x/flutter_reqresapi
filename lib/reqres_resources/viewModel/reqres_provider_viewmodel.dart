import 'package:flutter/cupertino.dart';

import '../model/resource_model.dart';
import '../service/reqres_service.dart';

class ReqresProvider extends ChangeNotifier {
  final IReqresService reqresService;

  List<Data> resources = [];
  bool isLoading = false;

  void _changeLoading() {
    isLoading = !isLoading;
    notifyListeners();
  }

  ReqresProvider(this.reqresService) {
    _fetch();
  }

  Future<void> _fetch() async {
    _changeLoading();
    resources = (await reqresService.fetchResourceItem())?.data ?? [];
    _changeLoading();
  }
}

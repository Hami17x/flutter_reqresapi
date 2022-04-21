import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_reqresapi/reqres_resources/model/resource_model.dart';
import 'package:flutter_reqresapi/reqres_resources/service/reqres_service.dart';

import '../view/reqres_view.dart';

abstract class ReqresViewModel extends State<ReqresView> {
  late final IReqresService reqresService;

  List<Data> resources = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    reqresService =
        ReqresService(Dio(BaseOptions(baseUrl: "https://reqres.in/api")));
    _fetch();
  }

  Future<void> _fetch() async {
    resources = (await reqresService.fetchResourceItem())?.data ?? [];
  }
}

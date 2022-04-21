import 'package:flutter/material.dart';
import 'package:flutter_reqresapi/extension/string_extension.dart';
import 'package:flutter_reqresapi/mixin/project_dio.dart';
import 'package:flutter_reqresapi/reqres_resources/service/reqres_service.dart';
import 'package:flutter_reqresapi/reqres_resources/viewModel/reqres_provider_viewmodel.dart';
import 'package:provider/provider.dart';

import '../model/resource_model.dart';

class ReqresView extends StatefulWidget {
  const ReqresView({Key? key}) : super(key: key);

  @override
  State<ReqresView> createState() => _ReqresViewState();
}

class _ReqresViewState extends State<ReqresView> with ProjectDioMixin {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ReqresProvider(ReqresService(service)),
      builder: (context, child) {
        return Scaffold(
          appBar: AppBar(
            title: context.watch<ReqresProvider>().isLoading
                ? const CircularProgressIndicator(
                    color: Colors.red,
                  )
                : const Text("yüklendi"),
          ),
          body: _resourceListview(
              context, context.watch<ReqresProvider>().resources),
        );
      },
    );
  }

  ListView _resourceListview(BuildContext context, List<Data> items) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) {
        // inspect(resources[index]);
        return Card(
            color: Color(items[index].color?.colorValue ?? 0),
            child: Text(items[index].name ?? ""));
      },
    );
  }
}

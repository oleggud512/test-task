import 'package:flutter/material.dart';
import 'package:test_task/src/core/common/constants/sizes.dart';
import 'package:test_task/src/core/common/extensions/string.dart';
import 'package:test_task/src/features/shortest_path/application/use_cases/get_url_use_case.dart';
import 'package:test_task/src/features/shortest_path/application/use_cases/save_url_use_case.dart';
import 'package:test_task/src/features/shortest_path/presentation/processing/processing_page.dart';

import '../../../../core/di/inject.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final saveUrl = inject<SaveUrlUseCase>();
  final getUrlFuture = inject<GetUrlUseCase>()();

  final cont = TextEditingController();

  @override
  void initState() { 
    super.initState();
    getUrlFuture.then((url) {
      if (url != null) {
        cont.text = url;
      }
    });
  }

  Future<void> onStart() async {
    await saveUrl(cont.text);
    if (mounted) {
      Navigator.of(context).push(MaterialPageRoute(builder: (context) {
        return const ProcessingPage();
      }));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page".hardcoded),
      ),
      body: Padding(
        padding: const EdgeInsets.all(p16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text("Set valid API based url in order to continue".hardcoded),
            // TODO: add Form
            TextFormField(
              controller: cont,
            )
          ]
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(p16),
        child: FilledButton(
          onPressed: onStart, 
          child: Text("Start counting process".hardcoded)
        )
      ),
    );
  }
}
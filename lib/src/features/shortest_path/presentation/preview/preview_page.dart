import 'package:flutter/material.dart';
import 'package:test_task/src/core/common/extensions/string.dart';
import 'package:test_task/src/features/shortest_path/domain/entities/result.dart';

class PreviewPage extends StatelessWidget {
  const PreviewPage({
    super.key,
    required this.result
  });

  final Result result;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Preview Page".hardcoded), 
      ),
      body: Container()
    );
  }
}
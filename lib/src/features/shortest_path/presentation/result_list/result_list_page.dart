import 'package:flutter/material.dart';
import 'package:test_task/src/core/common/constants/sizes.dart';
import 'package:test_task/src/core/common/extensions/string.dart';
import 'package:test_task/src/features/shortest_path/domain/entities/result.dart';

class ResultListPage extends StatelessWidget {
  const ResultListPage({
    super.key,
    required this.results
  });

  final List<Result> results;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Result List Page".hardcoded),
      ),
      body: ListView.separated(
        itemCount: results.length,
        separatorBuilder: (context, i) => const Divider(),
        itemBuilder: (context, i) {
          final result = results[i];
          return Padding(
            padding: const EdgeInsets.all(p16),
            child: Text(result.path)
          );
        }
      )
    );
  }
}
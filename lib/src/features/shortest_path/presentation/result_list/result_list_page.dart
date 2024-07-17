import 'package:flutter/material.dart';
import 'package:test_task/src/core/common/constants/sizes.dart';
import 'package:test_task/src/core/common/extensions/string.dart';
import 'package:test_task/src/features/shortest_path/domain/entities/result.dart';
import 'package:test_task/src/features/shortest_path/presentation/preview/preview_page.dart';

class ResultListPage extends StatelessWidget {
  const ResultListPage({
    super.key,
    required this.results
  });

  final List<Result> results;

  void onResult(BuildContext context, Result result) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return PreviewPage(result: result);
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Result List Page".hardcoded),
      ),
      body: ListView.separated(
        itemCount: results.length,
        padding: const EdgeInsets.all(p16),
        separatorBuilder: (context, i) => const Divider(),
        itemBuilder: (context, i) {
          final result = results[i];
          return InkWell(
            onTap: () => onResult(context, result),
            child: Padding(
              padding: const EdgeInsets.all(p16),
              child: Text(result.path,
                style: Theme.of(context)
                  .textTheme.titleMedium,
                textAlign: TextAlign.center,
              )
            ),
          );
        }
      )
    );
  }
}
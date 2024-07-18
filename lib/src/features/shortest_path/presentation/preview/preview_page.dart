import 'package:flutter/material.dart';
import 'package:test_task/src/core/common/constants/colors.dart';
import 'package:test_task/src/core/common/constants/sizes.dart';
import 'package:test_task/src/core/common/constants/strings.dart';
import 'package:test_task/src/core/common/extensions/string.dart';
import 'package:test_task/src/features/shortest_path/domain/entities/result.dart';
import 'package:test_task/src/features/shortest_path/domain/entities/task.dart';

class PreviewPage extends StatelessWidget {
  const PreviewPage({
    super.key,
    required this.result,
    required this.task
  });

  final Result result;
  final Task task;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Preview Page".hardcoded), 
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(p16),
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                maxWidth: p504 
              ),
              child: Column(
                children: [
                  buildField(),
                  h16gap,
                  Text(result.path)
                ]
              ),
            ),
          ),
        ),
      )
    );
  }

  Table buildField() {
    return Table(
      border: TableBorder.all(color: Colors.black, width: 1),
      children: List.generate(task.field.length, (ri) {
        return TableRow(
          children: List.generate(task.field[0].length, (ci) {
            final color = getColor(ri, ci);
            return TableCell(
              child: AspectRatio(
                aspectRatio: 1,
                child: Container(
                  alignment: Alignment.center,
                  color: color,
                  child: Text("($ci,$ri)",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: color.computeLuminance() > 0.5
                        ? Colors.black
                        : Colors.white
                    )
                  ),
                ),
              )
            );
          })
        );
      })
    );
  }

  Color getColor(int row, int col) {
    if (row == task.start.y && col == task.start.x) {
      return cellStartColor;
    }
    if (row == task.end.y && col == task.end.x) {
      return cellEndColor;
    }
    if (result.steps.where((p) => row == p.y && col == p.x).isNotEmpty) {
      return cellPathColor;
    }
    if (task.field[row][col] == fieldObstacle) {
      return cellObstacleColor;
    }
    return cellEmptyColor;
  }
}
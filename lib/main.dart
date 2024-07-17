import "package:flutter/material.dart";
import "package:test_task/src/app.dart";
import "package:test_task/src/core/di/get_it.dart";

Future<void> main() async {
  configureDependencies();
  runApp(const MyApp());
}
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
  // final urlRegExp = RegExp(r"http[s]?:\/\/.*\/flutter\/api[/]?");

  final saveUrl = inject<SaveUrlUseCase>();
  final getUrlFuture = inject<GetUrlUseCase>()();

  final cont = TextEditingController();
  bool? isValid;
  final formKey = GlobalKey<FormState>();

  @override
  void initState() { 
    super.initState();
    getUrlFuture.then((url) {
      if (url != null) {
        cont.text = url;
        updateValidationState();
      }
    });
  }

  Future<void> onStart() async {
    await saveUrl(cont.text);
    if (mounted) {
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) {
          return const ProcessingPage();
        }
      ));
    }
  }

  bool isValidUrl(String url) {
    final uri = Uri.tryParse(url);
    return uri != null && (uri.isScheme('http') || uri.isScheme('https'));
  }


  void updateValidationState() {
    setState(() {
      isValid = formKey.currentState?.validate() ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isValid == null) {
      Future.delayed(const Duration(milliseconds: 300), updateValidationState);
    }
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text("Home Page".hardcoded),
      ),
      body: Padding(
        padding: const EdgeInsets.all(p16),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text("Set valid API based url in order to continue".hardcoded),
              TextFormField(
                controller: cont,
                validator: (url) {
                  if (url == null || url.isEmpty) return "Enter a url";
                  if (!isValidUrl(url)) return "Invalid url";
                  return null;
                },
                autovalidateMode: AutovalidateMode.always,
                onChanged: (_) => updateValidationState()
              ),
              const Spacer(),
              FilledButton(
                onPressed: isValid == true
                  ? onStart 
                  : null, 
                child: Text("Start counting process".hardcoded)
              )
            ]
          ),
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task/src/core/common/constants/sizes.dart';
import 'package:test_task/src/core/common/extensions/string.dart';
import 'package:test_task/src/core/common/logger.dart';
import 'package:test_task/src/core/di/inject.dart';
import 'package:test_task/src/features/shortest_path/presentation/processing/processing_page_bloc.dart';
import 'package:test_task/src/features/shortest_path/presentation/processing/processing_page_event.dart';
import 'package:test_task/src/features/shortest_path/presentation/processing/processing_page_state.dart';
import 'package:test_task/src/features/shortest_path/presentation/processing/widgets/error_message_dialog.dart';
import 'package:test_task/src/features/shortest_path/presentation/result_list/result_list_page.dart';

class ProcessingPage extends StatefulWidget {
  const ProcessingPage({super.key});

  @override
  State<ProcessingPage> createState() => _ProcessingPageState();
}

class _ProcessingPageState extends State<ProcessingPage> {

  void onSubmitCalculations(BuildContext context) {
    final bloc = context.read<ProcessingPageBloc>();
    bloc.add(ProcessingPageCheckResultsEvent(
      onSuccess: (results) {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return ResultListPage(results: results);
        }));
      },
      onError: (message) {
        ErrorMessageDialog(
          message: message
        ).show(context);
      }
    ));
  }

  void onRetry(BuildContext context) {
    // TODO: onRetry
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => inject<ProcessingPageBloc>()
        ..add(ProcessingPageEvent.init()),
      child: BlocConsumer<ProcessingPageBloc, ProcessingPageState>(
        listenWhen: (prev, next) {
          return prev.isCheckingTasks == false && next.isCheckingTasks == true;
        },
        listener: (context, state) {
          // loadingDialog.show(context);
        },
        builder: (context, state) {
          return Material(
            child: Stack(
              children: [
                Scaffold(
                  appBar: AppBar(
                    title: Text("Processing Page".hardcoded),
                  ),
                  body: buildBody(context, state),
                  bottomNavigationBar: buildSendButton(context, state)
                ),
                if (state.isCheckingTasks) const LinearProgressIndicator(),
              ],
            ),
          );
        }
      ),
    );
  }
  
  Widget buildBody(BuildContext context, ProcessingPageState state) {
    if (state.errorMessage != null) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(state.errorMessage!),
            FilledButton(
              onPressed: () => onRetry(context),
              child: Text("Retry".hardcoded),
            )
          ]
        )
      );
    }
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(p16),
            child: Text(state.isLoadingTasks
              ? "loading".hardcoded
              : "All calculations has finished. You can send your results to server.".hardcoded,
              textAlign: TextAlign.center,
            ),
          ),
          Text("30%",
            style: Theme.of(context).textTheme.titleSmall,
          ), // TODO: animate
          h16gap,
          SizedBox(
            height: p104,
            width: p104,
            child: CircularProgressIndicator(
              value: state.isLoadingTasks
                ? null
                : 1,
            ),
          )
        ]
      )
    );
  }

  Widget? buildSendButton(BuildContext context, ProcessingPageState state) {
    if (state.isLoadingTasks) return null;

    return Padding(
      padding: const EdgeInsets.all(p16),
      child: FilledButton(
        onPressed: state.isCheckingTasks
          ? null
          : () => onSubmitCalculations(context),
        child: Text("Send results to server".hardcoded),
      )
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task/src/core/common/constants/sizes.dart';
import 'package:test_task/src/core/common/extensions/string.dart';
import 'package:test_task/src/core/common/logger.dart';
import 'package:test_task/src/core/di/inject.dart';
import 'package:test_task/src/features/shortest_path/presentation/processing/processing_page_bloc.dart';
import 'package:test_task/src/features/shortest_path/presentation/processing/processing_page_event.dart';
import 'package:test_task/src/features/shortest_path/presentation/processing/processing_page_state.dart';
import 'package:test_task/src/features/shortest_path/presentation/processing/widgets/animated_loading.dart';
import 'package:test_task/src/features/shortest_path/presentation/processing/widgets/error_message_dialog.dart';
import 'package:test_task/src/features/shortest_path/presentation/processing/widgets/my_progress_indicator.dart';
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
      onSuccess: (results, tasks) {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return ResultListPage(results: results, tasks: tasks);
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
    final bloc = context.read<ProcessingPageBloc>();
    bloc.add(ProcessingPageEvent.init());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => inject<ProcessingPageBloc>()
        ..add(ProcessingPageEvent.init()),
      child: BlocBuilder<ProcessingPageBloc, ProcessingPageState>(
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
    Widget body;
    if (state.errorMessage != null) {
      body = buildGetTasksError(context, state);
    }
    body = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Visibility.maintain(
          visible: state.tasksLoaded,
          child: Text("All calculations has finished. You can send your results to server.".hardcoded,
            textAlign: TextAlign.center, 
          ),
        ),
        h16gap,
        if (state.isLoadingTasks) const AnimatedLoading()
        else const MyProgeressIndicator(value: 1)
      ]
    );
    return Padding(
      padding: const EdgeInsets.all(p16),
      child: body
    );
  }

  Widget buildGetTasksError(BuildContext context, ProcessingPageState state) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(state.errorMessage!),
          h8gap,
          FilledButton(
            onPressed: () => onRetry(context),
            child: Text("Retry".hardcoded),
          )
        ]
      ),
    );
  }

  Widget? buildSendButton(BuildContext context, ProcessingPageState state) {
    return Visibility.maintain(
      visible: state.tasksLoaded,
      child: Padding(
        padding: const EdgeInsets.all(p16),
        child: FilledButton(
          onPressed: state.canSave
            ? () => onSubmitCalculations(context)
            : null,
          child: Text("Send results to server".hardcoded),
        )
      ),
    );
  }
}
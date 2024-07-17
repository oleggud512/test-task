import 'package:flutter/material.dart';
import 'package:test_task/src/core/common/constants/sizes.dart';

class MyProgeressIndicator extends StatelessWidget {
  const MyProgeressIndicator({
    super.key,
    this.value,
  });

  final double? value;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (value != null) ...[
          Text("${(value! * 100).toInt()}%",
            style: Theme.of(context).textTheme.titleSmall,
          ),
          h16gap
        ],
        SizedBox(
          height: p104,
          width: p104,
          child: CircularProgressIndicator(
            value: value,
          )
        ),
      ],
    );
  }
}
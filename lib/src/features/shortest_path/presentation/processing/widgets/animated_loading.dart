import 'package:flutter/material.dart';
import 'package:test_task/src/core/common/constants/sizes.dart';
import 'package:test_task/src/features/shortest_path/presentation/processing/widgets/my_progress_indicator.dart';

class AnimatedLoading extends StatefulWidget {
  const AnimatedLoading({super.key});

  @override
  State<AnimatedLoading> createState() => _AnimatedLoadingState();
}

class _AnimatedLoadingState extends State<AnimatedLoading> 
    with SingleTickerProviderStateMixin {
  late final AnimationController animationController;
  late final Animation<double> animation;
  final duration = const Duration(seconds: 11); 

  @override
  void initState() { 
    super.initState();
    animationController = AnimationController(
      vsync: this, 
      duration: duration
    );
    animation = animationController.drive<double>(CurveTween(curve: const Cubic(.17,.26,.01,.71)));
    animationController.animateTo(0.87);
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation, 
      builder: (context, child) {
        return MyProgeressIndicator(value: animation.value);
      },
    );
  }
}
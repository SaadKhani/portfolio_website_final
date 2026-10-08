import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';

class AnimatedDeveloperTitle extends StatefulWidget {
  final bool isMobile;

  const AnimatedDeveloperTitle({super.key, required this.isMobile});

  @override
  State<AnimatedDeveloperTitle> createState() => _AnimatedDeveloperTitleState();
}

class _AnimatedDeveloperTitleState extends State<AnimatedDeveloperTitle>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        final value = _controller.value;

        return ShaderMask(
          blendMode: BlendMode.srcIn,
          shaderCallback: (bounds) {
            final width = bounds.width;

            final start = (value * width * 2) - width;

            return LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: const [
                AppColors.primary,
                AppColors.secondary,
                AppColors.accent,
                AppColors.primary,
              ],
              stops: const [0.0, 0.35, 0.5, 1.0],
              transform: _GradientTranslation(start),
            ).createShader(bounds);
          },
          child: Text(
            'Full-Stack AI Developer',
            style: widget.isMobile
                ? AppTextStyles.headlineMedium
                : AppTextStyles.headlineLarge,
          ),
        );
      },
    );
  }
}

class _GradientTranslation extends GradientTransform {
  final double offset;

  const _GradientTranslation(this.offset);

  @override
  Matrix4 transform(Rect bounds, {TextDirection? textDirection}) {
    return Matrix4.translationValues(offset, 0, 0);
  }
}

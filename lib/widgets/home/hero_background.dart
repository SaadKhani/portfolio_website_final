import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';

class HeroBackground extends StatefulWidget {
  const HeroBackground({super.key});

  @override
  State<HeroBackground> createState() => _HeroBackgroundState();
}

class _HeroBackgroundState extends State<HeroBackground>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 12),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return CustomPaint(
            painter: _HeroBackgroundPainter(animationValue: _controller.value),
            size: Size.infinite,
          );
        },
      ),
    );
  }
}

class _HeroBackgroundPainter extends CustomPainter {
  final double animationValue;

  _HeroBackgroundPainter({required this.animationValue});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..style = PaintingStyle.fill;

    final firstAngle = animationValue * math.pi * 2;

    final firstCenter = Offset(
      size.width * 0.78 + math.cos(firstAngle) * 40,
      size.height * 0.25 + math.sin(firstAngle) * 30,
    );

    paint.shader = RadialGradient(
      colors: [
        AppColors.primary.withValues(alpha: 0.18),
        AppColors.primary.withValues(alpha: 0.05),
        Colors.transparent,
      ],
    ).createShader(Rect.fromCircle(center: firstCenter, radius: 300));

    canvas.drawCircle(firstCenter, 300, paint);

    final secondAngle = animationValue * math.pi * 2 + math.pi;

    final secondCenter = Offset(
      size.width * 0.15 + math.cos(secondAngle) * 30,
      size.height * 0.70 + math.sin(secondAngle) * 25,
    );

    paint.shader = RadialGradient(
      colors: [AppColors.secondary.withValues(alpha: 0.10), Colors.transparent],
    ).createShader(Rect.fromCircle(center: secondCenter, radius: 260));

    canvas.drawCircle(secondCenter, 260, paint);
  }

  @override
  bool shouldRepaint(covariant _HeroBackgroundPainter oldDelegate) {
    return oldDelegate.animationValue != animationValue;
  }
}

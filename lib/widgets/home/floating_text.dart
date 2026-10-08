import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/material.dart';

class FoldingText extends StatefulWidget {
  final String text;
  final TextStyle style;
  final Duration letterDuration;
  final Duration pauseDuration;

  const FoldingText({
    super.key,
    required this.text,
    required this.style,
    this.letterDuration = const Duration(milliseconds: 180),
    this.pauseDuration = const Duration(milliseconds: 900),
  });

  @override
  State<FoldingText> createState() => _FoldingTextState();
}

class _FoldingTextState extends State<FoldingText>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  Timer? _timer;

  int _visibleLetters = 0;
  bool _folding = true;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: widget.letterDuration,
    );

    _startAnimation();
  }

  Future<void> _startAnimation() async {
    await Future.delayed(const Duration(milliseconds: 400));

    while (mounted) {
      if (_folding) {
        for (int i = widget.text.length; i >= 0; i--) {
          if (!mounted) return;

          setState(() {
            _visibleLetters = i;
          });

          await Future.delayed(widget.letterDuration);
        }
      } else {
        for (int i = 0; i <= widget.text.length; i++) {
          if (!mounted) return;

          setState(() {
            _visibleLetters = i;
          });

          await Future.delayed(widget.letterDuration);
        }
      }

      if (!mounted) return;

      await Future.delayed(widget.pauseDuration);

      _folding = !_folding;
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final characters = widget.text.split('');

    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.baseline,
      textBaseline: TextBaseline.alphabetic,
      children: List.generate(characters.length, (index) {
        final character = characters[index];

        return _FoldingCharacter(
          key: ValueKey(index),
          character: character == ' ' ? '\u00A0' : character,
          style: widget.style,
          visible: index < _visibleLetters,
          duration: widget.letterDuration,
        );
      }),
    );
  }
}

class _FoldingCharacter extends StatefulWidget {
  final String character;
  final TextStyle style;
  final bool visible;
  final Duration duration;

  const _FoldingCharacter({
    super.key,
    required this.character,
    required this.style,
    required this.visible,
    required this.duration,
  });

  @override
  State<_FoldingCharacter> createState() => _FoldingCharacterState();
}

class _FoldingCharacterState extends State<_FoldingCharacter>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  late Animation<double> _rotation;
  late Animation<double> _opacity;
  late Animation<double> _scale;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
      value: widget.visible ? 1 : 0,
    );

    _setupAnimations();

    if (widget.visible) {
      _controller.value = 1;
    }
  }

  void _setupAnimations() {
    _rotation = Tween<double>(
      begin: -math.pi / 2,
      end: 0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic));

    _opacity = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _scale = Tween<double>(
      begin: 0.75,
      end: 1,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutBack));
  }

  @override
  void didUpdateWidget(covariant _FoldingCharacter oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.visible != widget.visible) {
      if (widget.visible) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    }
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
        return Transform(
          alignment: Alignment.center,
          transform: Matrix4.identity()
            ..setEntry(3, 2, 0.002)
            ..rotateX(_rotation.value)
            ..scale(_scale.value),
          child: Opacity(opacity: _opacity.value, child: child),
        );
      },
      child: Text(widget.character, style: widget.style),
    );
  }
}

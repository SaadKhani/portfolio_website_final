import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';

class TechnologyTags extends StatelessWidget {
  const TechnologyTags({super.key});

  static const technologies = [
    'Flutter',
    'Dart',
    'Python',
    'Node.js',
    'FastAPI',
    'Firebase',
    'REST APIs',
    'Machine Learning',
    'Deep Learning',
    'Computer Vision',
    'Generative AI',
    'LLMs',
    'NLP',
    'RAG',
    'AI Agents',
    'LangChain',
    'Vector Databases',
  ];

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: technologies
          .map((technology) => _TechnologyTag(label: technology))
          .toList(),
    );
  }
}

class _TechnologyTag extends StatefulWidget {
  final String label;

  const _TechnologyTag({required this.label});

  @override
  State<_TechnologyTag> createState() => _TechnologyTagState();
}

class _TechnologyTagState extends State<_TechnologyTag> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.basic,
      onEnter: (_) {
        setState(() {
          _hovered = true;
        });
      },
      onExit: (_) {
        setState(() {
          _hovered = false;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
        decoration: BoxDecoration(
          color: _hovered
              ? AppColors.primary.withValues(alpha: 0.12)
              : AppColors.surface,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: _hovered
                ? AppColors.primary.withValues(alpha: 0.45)
                : AppColors.border,
          ),
        ),
        child: Text(
          widget.label,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: _hovered ? AppColors.textPrimary : AppColors.textSecondary,
          ),
        ),
      ),
    );
  }
}

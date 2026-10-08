import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';

class SectionTitle extends StatelessWidget {
  final String eyebrow;
  final String title;
  final String? description;

  const SectionTitle({
    super.key,
    required this.eyebrow,
    required this.title,
    this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          eyebrow.toUpperCase(),
          style: AppTextStyles.labelLarge.copyWith(
            color: AppColors.secondary,
            letterSpacing: 1.5,
          ),
        ),

        const SizedBox(height: 10),

        Text(title, style: AppTextStyles.headlineLarge),

        if (description != null) ...[
          const SizedBox(height: 14),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 700),
            child: Text(description!, style: AppTextStyles.bodyLarge),
          ),
        ],
      ],
    );
  }
}

import 'package:flutter/material.dart';

import '../../core/responsive/responsive.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../data/education_data.dart';
import '../../models/education_model.dart';
import '../../widgets/common/section_title.dart';

class EducationView extends StatelessWidget {
  const EducationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Responsive.pagePadding(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 120),

          const SectionTitle(
            eyebrow: 'EDUCATION',
            title: 'My academic background',
            description:
                'My academic journey in computer science and software '
                'development.',
          ),

          const SizedBox(height: 60),

          ...EducationData.education.asMap().entries.map((entry) {
            final index = entry.key;
            final education = entry.value;

            return Padding(
              padding: EdgeInsets.only(
                bottom: index == EducationData.education.length - 1 ? 0 : 24,
              ),
              child: _buildEducationCard(context, education),
            );
          }),

          const SizedBox(height: 120),
        ],
      ),
    );
  }

  Widget _buildEducationCard(BuildContext context, EducationModel education) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(Responsive.isMobile(context) ? 24 : 36),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildEducationIcon(),

              const SizedBox(width: 18),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(education.degree, style: AppTextStyles.headlineMedium),

                    const SizedBox(height: 10),

                    Text(
                      education.institution,
                      style: AppTextStyles.titleLarge.copyWith(
                        color: AppColors.secondary,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 28),

          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: [
              _buildInfoChip(Icons.calendar_today_outlined, education.duration),

              _buildInfoChip(Icons.location_on_outlined, education.location),
            ],
          ),

          const SizedBox(height: 26),

          Text(education.description, style: AppTextStyles.bodyLarge),

          const SizedBox(height: 26),

          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: education.highlights.map((highlight) {
              return Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: AppColors.surfaceLight,
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: AppColors.border),
                ),
                child: Text(
                  highlight,
                  style: AppTextStyles.bodySmall.copyWith(
                    color: AppColors.textSecondary,
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildEducationIcon() {
    return Container(
      width: 58,
      height: 58,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.primary.withValues(alpha: 0.18),
            AppColors.secondary.withValues(alpha: 0.10),
          ],
        ),
        borderRadius: BorderRadius.circular(17),
        border: Border.all(color: AppColors.primary.withValues(alpha: 0.20)),
      ),
      child: const Icon(
        Icons.school_outlined,
        color: AppColors.accent,
        size: 28,
      ),
    );
  }

  Widget _buildInfoChip(IconData icon, String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 9),
      decoration: BoxDecoration(
        color: AppColors.background.withValues(alpha: 0.45),
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: AppColors.border),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16, color: AppColors.secondary),
          const SizedBox(width: 7),
          Text(
            text,
            style: AppTextStyles.bodySmall.copyWith(
              color: AppColors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }
}

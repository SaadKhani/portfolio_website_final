import 'package:flutter/material.dart';

import '../../core/responsive/responsive.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../data/services_data.dart';
import '../../models/service_model.dart';
import '../../widgets/common/section_title.dart';

class ServicesView extends StatelessWidget {
  const ServicesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Responsive.pagePadding(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 120),

          const SectionTitle(
            eyebrow: 'SERVICES',
            title: 'What I can build',
            description:
                'Practical software solutions across mobile development, '
                'backend systems, and artificial intelligence.',
          ),

          const SizedBox(height: 60),

          _buildServicesLayout(context),

          const SizedBox(height: 120),
        ],
      ),
    );
  }

  Widget _buildServicesLayout(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;

        // Single column on smaller screens.
        if (width < 760) {
          return Column(
            children: ServicesData.services.map((service) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: _buildServiceCard(context, service),
              );
            }).toList(),
          );
        }

        // Two columns on larger screens.
        final cardWidth = (width - 20) / 2;

        return Wrap(
          spacing: 20,
          runSpacing: 20,
          children: ServicesData.services.map((service) {
            return SizedBox(
              width: cardWidth,
              child: _buildServiceCard(context, service),
            );
          }).toList(),
        );
      },
    );
  }

  Widget _buildServiceCard(BuildContext context, ServiceModel service) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: AppColors.border),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.12),
            blurRadius: 30,
            offset: const Offset(0, 12),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildServiceIcon(service.icon),

              const SizedBox(width: 16),

              Expanded(
                child: Text(service.title, style: AppTextStyles.titleLarge),
              ),
            ],
          ),

          const SizedBox(height: 20),

          Text(service.description, style: AppTextStyles.bodyMedium),

          const SizedBox(height: 24),

          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: service.technologies.map((technology) {
              return Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 11,
                  vertical: 7,
                ),
                decoration: BoxDecoration(
                  color: AppColors.surfaceLight,
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: AppColors.border),
                ),
                child: Text(
                  technology,
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

  Widget _buildServiceIcon(String icon) {
    IconData iconData;

    switch (icon) {
      case 'mobile':
        iconData = Icons.phone_android_rounded;
        break;

      case 'backend':
        iconData = Icons.cloud_outlined;
        break;

      case 'ai':
        iconData = Icons.auto_awesome_rounded;
        break;

      case 'brain':
        iconData = Icons.psychology_outlined;
        break;

      case 'fullstack':
        iconData = Icons.layers_outlined;
        break;

      default:
        iconData = Icons.code_rounded;
    }

    return Container(
      width: 52,
      height: 52,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.primary.withValues(alpha: 0.18),
            AppColors.secondary.withValues(alpha: 0.10),
          ],
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.primary.withValues(alpha: 0.18)),
      ),
      child: Icon(iconData, color: AppColors.accent, size: 25),
    );
  }
}

import 'package:flutter/material.dart';

import '../../core/responsive/responsive.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../widgets/common/section_title.dart';

class AboutView extends StatelessWidget {
  const AboutView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Responsive.pagePadding(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 120),

          const SectionTitle(
            eyebrow: 'ABOUT ME',
            title: 'A little about me',
            description:
                'I am a Computer Science graduate focused on building '
                'modern applications and exploring intelligent technologies.',
          ),

          const SizedBox(height: 60),

          _buildAboutContent(context),

          const SizedBox(height: 60),
        ],
      ),
    );
  }

  Widget _buildAboutContent(BuildContext context) {
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
          Text("I'm Muhammad Saad Khan", style: AppTextStyles.headlineMedium),

          const SizedBox(height: 10),

          Text(
            'Full-Stack AI Developer',
            style: AppTextStyles.titleLarge.copyWith(
              color: AppColors.secondary,
            ),
          ),

          const SizedBox(height: 26),

          Text(
            'I am building practical digital products that combine '
            'beautiful user experiences, reliable backend systems, '
            'and intelligent technologies.',
            style: AppTextStyles.bodyLarge,
          ),

          const SizedBox(height: 18),

          Text(
            'My development journey started with Flutter and mobile '
            'application development. Over time, I expanded my skills '
            'into backend development, APIs, databases, and Machine '
            'Learning.',
            style: AppTextStyles.bodyMedium,
          ),

          const SizedBox(height: 18),

          Text(
            'Today, I am continuing to explore Artificial Intelligence '
            'and intelligent systems while strengthening my full-stack '
            'development skills. I enjoy learning new technologies '
            'through practical projects and turning ideas into working '
            'software.',
            style: AppTextStyles.bodyMedium,
          ),
        ],
      ),
    );
  }
}

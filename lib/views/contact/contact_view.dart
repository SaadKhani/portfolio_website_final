import 'package:flutter/material.dart';

import '../../core/responsive/responsive.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/utils/url_launcher_utils.dart';
import '../../widgets/common/section_title.dart';

class ContactView extends StatelessWidget {
  const ContactView({super.key});

  static const String email = 'saadkan000@gmail.com';
  static const String githubUrl = 'https://github.com/SaadKhani';
  static const String linkedInUrl =
      'https://www.linkedin.com/in/muhammad-saad-khan-355511379';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Responsive.pagePadding(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 120),

          const SectionTitle(
            eyebrow: 'CONTACT',
            title: "Let's build something meaningful",
            description:
                'Have a project, opportunity, or idea in mind? '
                "I'd love to hear about it.",
          ),

          const SizedBox(height: 60),

          _buildContactContent(context),

          const SizedBox(height: 100),

          _buildFooter(),

          const SizedBox(height: 40),
        ],
      ),
    );
  }

  Widget _buildContactContent(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 800) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildContactCard(
                icon: Icons.email_outlined,
                title: 'Email',
                value: email,
                onTap: () {
                  UrlLauncherUtils.launchUrl('mailto:$email');
                },
              ),

              const SizedBox(height: 16),

              _buildContactCard(
                icon: Icons.location_on_outlined,
                title: 'Location',
                value: 'Peshawar, Pakistan',
              ),

              const SizedBox(height: 28),

              _buildSocialLinks(),
            ],
          );
        }

        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: _buildContactCard(
                icon: Icons.email_outlined,
                title: 'Email',
                value: email,
                onTap: () {
                  UrlLauncherUtils.launchUrl('mailto:$email');
                },
              ),
            ),

            const SizedBox(width: 20),

            Expanded(
              child: _buildContactCard(
                icon: Icons.location_on_outlined,
                title: 'Location',
                value: 'Peshawar, Pakistan',
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildContactCard({
    required IconData icon,
    required String title,
    required String value,
    VoidCallback? onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: AppColors.border),
        ),
        child: Row(
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: AppColors.primary.withValues(alpha: 0.12),
                borderRadius: BorderRadius.circular(14),
              ),
              child: Icon(icon, color: AppColors.accent, size: 23),
            ),

            const SizedBox(width: 16),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: AppTextStyles.bodySmall),

                  const SizedBox(height: 5),

                  Text(
                    value,
                    style: AppTextStyles.bodyMedium.copyWith(
                      color: AppColors.textPrimary,
                    ),
                  ),
                ],
              ),
            ),

            if (onTap != null)
              const Icon(
                Icons.arrow_outward_rounded,
                size: 18,
                color: AppColors.textMuted,
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildSocialLinks() {
    return Wrap(
      spacing: 12,
      runSpacing: 12,
      children: [
        _buildSocialButton(
          icon: Icons.code_rounded,
          label: 'GitHub',
          onTap: () {
            UrlLauncherUtils.launchUrl(githubUrl);
          },
        ),
        _buildSocialButton(
          icon: Icons.work_outline_rounded,
          label: 'LinkedIn',
          onTap: () {
            UrlLauncherUtils.launchUrl(linkedInUrl);
          },
        ),
      ],
    );
  }

  Widget _buildSocialButton({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return OutlinedButton.icon(
      onPressed: onTap,
      icon: Icon(icon, size: 18),
      label: Text(label),
      style: OutlinedButton.styleFrom(
        foregroundColor: AppColors.textPrimary,
        side: const BorderSide(color: AppColors.border),
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      ),
    );
  }

  Widget _buildFooter() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(top: 30),
      decoration: const BoxDecoration(
        border: Border(top: BorderSide(color: AppColors.border)),
      ),
      child: Column(
        children: [
          Text(
            'Muhammad Saad Khan',
            style: AppTextStyles.titleLarge,
            textAlign: TextAlign.center,
          ),

          const SizedBox(height: 8),

          Text(
            'Full-Stack AI Developer',
            style: AppTextStyles.bodySmall,
            textAlign: TextAlign.center,
          ),

          const SizedBox(height: 18),

          Text(
            '© ${DateTime.now().year} Muhammad Saad Khan. '
            'All rights reserved.',
            style: AppTextStyles.bodySmall,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

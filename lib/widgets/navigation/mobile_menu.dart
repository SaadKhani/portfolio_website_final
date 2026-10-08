import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';

class MobileMenu extends StatelessWidget {
  final VoidCallback? onHomeTap;
  final VoidCallback? onAboutTap;
  final VoidCallback? onSkillsTap;
  final VoidCallback? onExperienceTap;
  final VoidCallback? onProjectsTap;
  final VoidCallback? onServicesTap;
  final VoidCallback? onContactTap;

  const MobileMenu({
    super.key,
    this.onHomeTap,
    this.onAboutTap,
    this.onSkillsTap,
    this.onExperienceTap,
    this.onProjectsTap,
    this.onServicesTap,
    this.onContactTap,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.all(20),
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: AppColors.border),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                const Text(
                  'SAAD.',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w800,
                    color: AppColors.textPrimary,
                  ),
                ),

                const Spacer(),

                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.close_rounded),
                  color: AppColors.textSecondary,
                ),
              ],
            ),

            const SizedBox(height: 20),

            _MenuItem(title: 'Home', onTap: () => _select(context, onHomeTap)),
            _MenuItem(
              title: 'About',
              onTap: () => _select(context, onAboutTap),
            ),
            _MenuItem(
              title: 'Skills',
              onTap: () => _select(context, onSkillsTap),
            ),
            _MenuItem(
              title: 'Experience',
              onTap: () => _select(context, onExperienceTap),
            ),
            _MenuItem(
              title: 'Projects',
              onTap: () => _select(context, onProjectsTap),
            ),
            _MenuItem(
              title: 'Services',
              onTap: () => _select(context, onServicesTap),
            ),
            _MenuItem(
              title: 'Contact',
              onTap: () => _select(context, onContactTap),
            ),

            const SizedBox(height: 16),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => _select(context, onContactTap),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  'Hire Me',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _select(BuildContext context, VoidCallback? callback) {
    Navigator.pop(context);
    callback?.call();
  }
}

class _MenuItem extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const _MenuItem({required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(
        title,
        style: AppTextStyles.bodyMedium.copyWith(color: AppColors.textPrimary),
      ),
      trailing: const Icon(
        Icons.arrow_forward_ios_rounded,
        size: 14,
        color: AppColors.textMuted,
      ),
      onTap: onTap,
    );
  }
}

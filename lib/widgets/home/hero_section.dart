import 'package:flutter/material.dart';
import 'package:portfolio_website/widgets/home/animated_title.dart';

import '../../core/responsive/responsive.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../common/animated_container.dart';
import '../common/custom_button.dart';
import 'social_links.dart';
import 'availability_badge.dart';
import 'technology_tags.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);

    return Padding(
      padding: Responsive.pagePadding(context),
      child: ConstrainedBox(
        constraints: const BoxConstraints(minHeight: 650),
        child: Center(
          child: isMobile
              ? const _MobileHeroContent()
              : const _DesktopHeroContent(),
        ),
      ),
    );
  }
}

class _DesktopHeroContent extends StatelessWidget {
  const _DesktopHeroContent();

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(flex: 6, child: _HeroText()),
        const SizedBox(width: 60),
        const Expanded(
          flex: 4,
          child: Column(children: [SizedBox(height: 70), _HeroVisual()]),
        ),
      ],
    );
  }
}

class _MobileHeroContent extends StatelessWidget {
  const _MobileHeroContent();

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [_HeroText(), SizedBox(height: 50), _HeroVisual()],
    );
  }
}

class _HeroText extends StatelessWidget {
  const _HeroText();

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 10),
        const AnimatedContainerWidget(
          delay: Duration(milliseconds: 500),
          child: AvailabilityBadge(),
        ),

        const SizedBox(height: 24),

        AnimatedContainerWidget(
          delay: const Duration(milliseconds: 750),
          child: Text(
            'Hello, I\'m',
            style: AppTextStyles.labelLarge.copyWith(
              color: AppColors.secondary,
              letterSpacing: 2,
            ),
          ),
        ),

        const SizedBox(height: 16),

        // Static name.
        // It still enters with the normal slide/fade animation,
        // but there is no folding/unfolding effect.
        AnimatedContainerWidget(
          delay: const Duration(milliseconds: 900),
          child: Text(
            'Muhammad Saad Khan',
            style: isMobile
                ? AppTextStyles.displayMedium
                : AppTextStyles.displayLarge,
          ),
        ),

        const SizedBox(height: 14),

        const SizedBox(height: 14),

        AnimatedContainerWidget(
          delay: const Duration(milliseconds: 1300),
          child: AnimatedDeveloperTitle(isMobile: isMobile),
        ),

        const SizedBox(height: 24),

        AnimatedContainerWidget(
          delay: const Duration(milliseconds: 1700),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 680),
            child: Text(
              'I build AI-powered applications and complete software '
              'solutions — from machine learning models and backend '
              'APIs to modern Flutter applications and intelligent systems.',
              style: isMobile
                  ? AppTextStyles.bodyMedium
                  : AppTextStyles.bodyLarge,
            ),
          ),
        ),

        const SizedBox(height: 32),

        AnimatedContainerWidget(
          delay: const Duration(milliseconds: 2100),
          child: Wrap(
            spacing: 14,
            runSpacing: 14,
            children: [
              CustomButton(
                text: 'View My Work',
                icon: Icons.arrow_forward_rounded,
                onPressed: () {},
              ),
              CustomButton(
                text: 'Hire Me',
                icon: Icons.work_outline_rounded,
                type: CustomButtonType.secondary,
                onPressed: () {},
              ),
            ],
          ),
        ),

        const SizedBox(height: 32),

        const AnimatedContainerWidget(
          delay: Duration(milliseconds: 2400),
          child: SocialLinks(),
        ),

        const SizedBox(height: 26),

        const AnimatedContainerWidget(
          delay: Duration(milliseconds: 2700),
          child: TechnologyTags(),
        ),
      ],
    );
  }
}

class _HeroVisual extends StatelessWidget {
  const _HeroVisual();

  @override
  Widget build(BuildContext context) {
    return AnimatedContainerWidget(
      delay: const Duration(milliseconds: 400),
      beginOffset: const Offset(30, 0),
      child: Container(
        width: double.infinity,
        height: 380,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: AppColors.border),
          color: AppColors.surface.withValues(alpha: 0.7),
          boxShadow: [
            BoxShadow(
              color: AppColors.primary.withValues(alpha: 0.08),
              blurRadius: 60,
              spreadRadius: 5,
            ),
          ],
        ),
        child: Stack(
          children: [
            Positioned(
              top: 30,
              right: 30,
              child: _CodeDot(color: AppColors.secondary),
            ),

            Positioned(
              bottom: 40,
              left: 35,
              child: _CodeDot(color: AppColors.primary),
            ),

            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 180,
                    height: 180,
                    padding: const EdgeInsets.all(3),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: const LinearGradient(
                        colors: [AppColors.primary, AppColors.secondary],
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.primary.withValues(alpha: 0.35),
                          blurRadius: 40,
                          spreadRadius: 5,
                        ),
                      ],
                    ),
                    child: ClipOval(
                      child: Image.asset(
                        'lib/resources/images/profile/profile_pic.jpeg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  const SizedBox(height: 28),

                  Text(
                    'Flutter • Backend • AI/ML',
                    style: AppTextStyles.titleLarge.copyWith(fontSize: 18),
                  ),

                  const SizedBox(height: 10),

                  Text(
                    'Building ideas into intelligent products.',
                    textAlign: TextAlign.center,
                    style: AppTextStyles.bodyMedium,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CodeDot extends StatelessWidget {
  final Color color;

  const _CodeDot({required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 8,
      height: 8,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(color: color.withValues(alpha: 0.6), blurRadius: 12),
        ],
      ),
    );
  }
}

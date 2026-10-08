import 'package:flutter/material.dart';

import '../../core/responsive/responsive.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import 'mobile_menu.dart';

class Navbar extends StatelessWidget {
  final VoidCallback? onHomeTap;
  final VoidCallback? onAboutTap;
  final VoidCallback? onSkillsTap;
  final VoidCallback? onExperienceTap;
  final VoidCallback? onProjectsTap;
  final VoidCallback? onServicesTap;
  final VoidCallback? onContactTap;

  const Navbar({
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
    final isMobile = Responsive.isMobile(context);

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 40,
        vertical: 18,
      ),
      decoration: BoxDecoration(
        color: AppColors.background.withValues(alpha: 0.85),
        border: const Border(
          bottom: BorderSide(color: AppColors.border, width: 0.5),
        ),
      ),
      child: isMobile
          ? _MobileNavbar(
              onHomeTap: onHomeTap,
              onAboutTap: onAboutTap,
              onSkillsTap: onSkillsTap,
              onExperienceTap: onExperienceTap,
              onProjectsTap: onProjectsTap,
              onServicesTap: onServicesTap,
              onContactTap: onContactTap,
            )
          : _DesktopNavbar(
              onHomeTap: onHomeTap,
              onAboutTap: onAboutTap,
              onSkillsTap: onSkillsTap,
              onExperienceTap: onExperienceTap,
              onProjectsTap: onProjectsTap,
              onServicesTap: onServicesTap,
              onContactTap: onContactTap,
            ),
    );
  }
}

class _DesktopNavbar extends StatelessWidget {
  final VoidCallback? onHomeTap;
  final VoidCallback? onAboutTap;
  final VoidCallback? onSkillsTap;
  final VoidCallback? onExperienceTap;
  final VoidCallback? onProjectsTap;
  final VoidCallback? onServicesTap;
  final VoidCallback? onContactTap;

  const _DesktopNavbar({
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
    return Row(
      children: [
        _buildLogo(),

        const Spacer(),

        _NavItem(title: 'Home', onTap: onHomeTap),
        _NavItem(title: 'About', onTap: onAboutTap),
        _NavItem(title: 'Skills', onTap: onSkillsTap),
        _NavItem(title: 'Experience', onTap: onExperienceTap),
        _NavItem(title: 'Projects', onTap: onProjectsTap),
        _NavItem(title: 'Services', onTap: onServicesTap),

        const SizedBox(width: 20),

        _HireMeButton(onTap: onContactTap),
      ],
    );
  }

  Widget _buildLogo() {
    return GestureDetector(
      onTap: onHomeTap,
      child: const Text(
        'SAAD.',
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w800,
          letterSpacing: -0.5,
          color: AppColors.textPrimary,
        ),
      ),
    );
  }
}

class _MobileNavbar extends StatelessWidget {
  final VoidCallback? onHomeTap;
  final VoidCallback? onAboutTap;
  final VoidCallback? onSkillsTap;
  final VoidCallback? onExperienceTap;
  final VoidCallback? onProjectsTap;
  final VoidCallback? onServicesTap;
  final VoidCallback? onContactTap;

  const _MobileNavbar({
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
    return Row(
      children: [
        GestureDetector(
          onTap: onHomeTap,
          child: const Text(
            'SAAD.',
            style: TextStyle(
              fontSize: 23,
              fontWeight: FontWeight.w800,
              letterSpacing: -0.5,
              color: AppColors.textPrimary,
            ),
          ),
        ),

        const Spacer(),

        IconButton(
          onPressed: () {
            showDialog(
              context: context,
              barrierColor: Colors.black.withValues(alpha: 0.7),
              builder: (_) => MobileMenu(
                onHomeTap: onHomeTap,
                onAboutTap: onAboutTap,
                onSkillsTap: onSkillsTap,
                onExperienceTap: onExperienceTap,
                onProjectsTap: onProjectsTap,
                onServicesTap: onServicesTap,
                onContactTap: onContactTap,
              ),
            );
          },
          icon: const Icon(Icons.menu_rounded, size: 28),
          color: AppColors.textPrimary,
        ),
      ],
    );
  }
}

class _NavItem extends StatefulWidget {
  final String title;
  final VoidCallback? onTap;

  const _NavItem({required this.title, this.onTap});

  @override
  State<_NavItem> createState() => _NavItemState();
}

class _NavItemState extends State<_NavItem> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) {
        setState(() {
          _isHovered = true;
        });
      },
      onExit: (_) {
        setState(() {
          _isHovered = false;
        });
      },
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
          child: Text(
            widget.title,
            style: AppTextStyles.labelLarge.copyWith(
              color: _isHovered ? AppColors.primary : AppColors.textSecondary,
            ),
          ),
        ),
      ),
    );
  }
}

class _HireMeButton extends StatefulWidget {
  final VoidCallback? onTap;

  const _HireMeButton({this.onTap});

  @override
  State<_HireMeButton> createState() => _HireMeButtonState();
}

class _HireMeButtonState extends State<_HireMeButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) {
        setState(() {
          _isHovered = true;
        });
      },
      onExit: (_) {
        setState(() {
          _isHovered = false;
        });
      },
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 11),
          decoration: BoxDecoration(
            color: _isHovered ? AppColors.accent : AppColors.primary,
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Text(
            'Hire Me',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

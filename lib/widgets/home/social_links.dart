import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';

class SocialLinks extends StatelessWidget {
  const SocialLinks({super.key});

  void _showComingSoon(BuildContext context, String platform) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$platform link will be added soon.'),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        _SocialIcon(
          icon: Icons.code_rounded,
          tooltip: 'GitHub',
          onTap: () => _showComingSoon(context, 'GitHub'),
        ),
        const SizedBox(width: 12),
        _SocialIcon(
          icon: Icons.work_outline_rounded,
          tooltip: 'LinkedIn',
          onTap: () => _showComingSoon(context, 'LinkedIn'),
        ),
        const SizedBox(width: 12),
        _SocialIcon(
          icon: Icons.email_outlined,
          tooltip: 'Email',
          onTap: () => _showComingSoon(context, 'Email'),
        ),
      ],
    );
  }
}

class _SocialIcon extends StatefulWidget {
  final IconData icon;
  final String tooltip;
  final VoidCallback onTap;

  const _SocialIcon({
    required this.icon,
    required this.tooltip,
    required this.onTap,
  });

  @override
  State<_SocialIcon> createState() => _SocialIconState();
}

class _SocialIconState extends State<_SocialIcon> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: widget.tooltip,
      child: MouseRegion(
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
            width: 42,
            height: 42,
            decoration: BoxDecoration(
              color: _isHovered
                  ? AppColors.primary.withValues(alpha: 0.15)
                  : AppColors.surface,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: _isHovered ? AppColors.primary : AppColors.border,
              ),
            ),
            child: Icon(
              widget.icon,
              size: 19,
              color: _isHovered ? AppColors.primary : AppColors.textSecondary,
            ),
          ),
        ),
      ),
    );
  }
}

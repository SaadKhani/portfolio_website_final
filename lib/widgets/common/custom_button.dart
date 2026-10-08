import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';

enum CustomButtonType { primary, secondary }

class CustomButton extends StatefulWidget {
  final String text;
  final VoidCallback? onPressed;
  final IconData? icon;
  final CustomButtonType type;

  const CustomButton({
    super.key,
    required this.text,
    this.onPressed,
    this.icon,
    this.type = CustomButtonType.primary,
  });

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final isPrimary = widget.type == CustomButtonType.primary;

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
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        decoration: BoxDecoration(
          color: isPrimary
              ? (_isHovered ? AppColors.accent : AppColors.primary)
              : (_isHovered ? AppColors.surfaceLight : Colors.transparent),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: isPrimary ? Colors.transparent : AppColors.border,
          ),
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: widget.onPressed,
            borderRadius: BorderRadius.circular(10),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 14),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    widget.text,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  if (widget.icon != null) ...[
                    const SizedBox(width: 8),
                    Icon(widget.icon, size: 18, color: AppColors.textPrimary),
                  ],
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

import 'dart:ui';
import 'project_video_player.dart';
import 'package:flutter/material.dart';

import '../../core/responsive/responsive.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/utils/url_launcher_utils.dart';
import '../../models/project_model.dart';

class ProjectCategoryWidget extends StatefulWidget {
  final ProjectCategory category;

  const ProjectCategoryWidget({super.key, required this.category});

  @override
  State<ProjectCategoryWidget> createState() => _ProjectCategoryWidgetState();
}

class _ProjectCategoryWidgetState extends State<ProjectCategoryWidget> {
  int? expandedIndex;

  final Map<int, GlobalKey> projectKeys = {};

  GlobalKey _keyForProject(int index) {
    return projectKeys.putIfAbsent(index, () => GlobalKey());
  }

  void _toggleProject(int index) {
    final isOpening = expandedIndex != index;

    setState(() {
      expandedIndex = isOpening ? index : null;
    });

    if (isOpening) {
      Future.delayed(const Duration(milliseconds: 520), () {
        if (!mounted) {
          return;
        }

        final key = _keyForProject(index);
        final context = key.currentContext;

        if (context == null) {
          return;
        }

        Scrollable.ensureVisible(
          context,
          duration: const Duration(milliseconds: 600),
          curve: Curves.easeInOutCubic,
          alignment: 0.001,
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildCategoryHeader(),

        const SizedBox(height: 24),

        ...List.generate(widget.category.projects.length, (index) {
          final project = widget.category.projects[index];

          return _ProjectRow(
            key: _keyForProject(index),
            project: project,
            index: index,
            isExpanded: expandedIndex == index,
            isMobile: isMobile,
            onTap: () => _toggleProject(index),
          );
        }),
      ],
    );
  }

  Widget _buildCategoryHeader() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(widget.category.title, style: AppTextStyles.headlineMedium),
              const SizedBox(height: 8),
              Text(widget.category.subtitle, style: AppTextStyles.bodyMedium),
            ],
          ),
        ),
        Text(
          '${widget.category.projects.length} PROJECTS',
          style: AppTextStyles.labelLarge.copyWith(
            color: AppColors.textMuted,
            letterSpacing: 1.2,
          ),
        ),
      ],
    );
  }
}

class _ProjectRow extends StatefulWidget {
  final ProjectModel project;
  final int index;
  final bool isExpanded;
  final bool isMobile;
  final VoidCallback onTap;

  const _ProjectRow({
    super.key,
    required this.project,
    required this.index,
    required this.isExpanded,
    required this.isMobile,
    required this.onTap,
  });

  @override
  State<_ProjectRow> createState() => _ProjectRowState();
}

class _ProjectRowState extends State<_ProjectRow> {
  bool isHovered = false;

  int selectedScreenshot = 0;

  void _changeScreenshot(int index) {
    final screenshots = widget.project.screenshotPaths;

    if (index < 0 || index >= screenshots.length) {
      return;
    }

    setState(() {
      selectedScreenshot = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        setState(() {
          isHovered = true;
        });
      },
      onExit: (_) {
        setState(() {
          isHovered = false;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeOut,
        margin: const EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(
          color: widget.isExpanded || isHovered
              ? AppColors.surfaceLight
              : Colors.transparent,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: widget.isExpanded || isHovered
                ? AppColors.border
                : Colors.transparent,
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Column(
            children: [_buildProjectHeader(), _buildProjectDetails()],
          ),
        ),
      ),
    );
  }

  Widget _buildProjectHeader() {
    return InkWell(
      onTap: widget.onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: widget.isMobile ? 22 : 26,
          horizontal: widget.isMobile ? 8 : 16,
        ),
        child: Row(
          children: [
            Text(
              '${(widget.index + 1).toString().padLeft(2, '0')}',
              style: AppTextStyles.labelLarge.copyWith(
                color: AppColors.textMuted,
              ),
            ),

            const SizedBox(width: 24),

            Expanded(
              child: Text(
                widget.project.title,
                style: AppTextStyles.titleLarge,
              ),
            ),

            AnimatedRotation(
              turns: widget.isExpanded ? 0.25 : 0,
              duration: const Duration(milliseconds: 250),
              child: Icon(
                Icons.arrow_forward,
                color: widget.isExpanded
                    ? AppColors.secondary
                    : AppColors.textMuted,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProjectDetails() {
    return AnimatedCrossFade(
      firstChild: const SizedBox.shrink(),
      secondChild: _buildExpandedContent(),
      crossFadeState: widget.isExpanded
          ? CrossFadeState.showSecond
          : CrossFadeState.showFirst,
      duration: const Duration(milliseconds: 450),
      sizeCurve: Curves.easeInOutCubic,
    );
  }

  Widget _buildExpandedContent() {
    final project = widget.project;

    return Padding(
      padding: EdgeInsets.fromLTRB(
        widget.isMobile ? 8 : 56,
        8,
        widget.isMobile ? 8 : 56,
        40,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(project.description, style: AppTextStyles.bodyLarge),

          if (project.screenshotPaths.isNotEmpty) ...[
            const SizedBox(height: 40),
            _buildScreenshotGallery(),
          ],

          const SizedBox(height: 32),
          if (project.videoPath != null) ...[
            const SizedBox(height: 40),

            Text(
              'PROJECT DEMO',
              style: AppTextStyles.labelLarge.copyWith(
                color: AppColors.secondary,
                letterSpacing: 1.5,
              ),
            ),

            const SizedBox(height: 18),

            ProjectVideoPlayer(videoPath: project.videoPath!),
          ],
          const SizedBox(height: 32),

          _buildTechnologySection(),

          if (project.details.isNotEmpty) ...[
            const SizedBox(height: 32),
            _buildDetailsSection(),
          ],

          if (project.githubUrl != null || project.liveUrl != null) ...[
            const SizedBox(height: 32),
            _buildActionButtons(),
          ],
        ],
      ),
    );
  }

  // ---------------------------------------------------------------------------
  // Screenshot Gallery
  // ---------------------------------------------------------------------------

  Widget _buildScreenshotGallery() {
    final screenshots = widget.project.screenshotPaths;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'PROJECT SCREENSHOTS',
          style: AppTextStyles.labelLarge.copyWith(
            color: AppColors.secondary,
            letterSpacing: 1.2,
          ),
        ),

        const SizedBox(height: 18),

        LayoutBuilder(
          builder: (context, constraints) {
            return SizedBox(
              height: widget.isMobile ? 360 : 500,
              width: double.infinity,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  ..._buildGalleryImages(screenshots, constraints.maxWidth),

                  if (screenshots.length > 1) ...[
                    _buildGalleryArrow(
                      alignment: Alignment.centerLeft,
                      icon: Icons.arrow_back_ios_new,
                      onTap: () {
                        final previous = selectedScreenshot == 0
                            ? screenshots.length - 1
                            : selectedScreenshot - 1;

                        _changeScreenshot(previous);
                      },
                    ),

                    _buildGalleryArrow(
                      alignment: Alignment.centerRight,
                      icon: Icons.arrow_forward_ios,
                      onTap: () {
                        final next =
                            selectedScreenshot == screenshots.length - 1
                            ? 0
                            : selectedScreenshot + 1;

                        _changeScreenshot(next);
                      },
                    ),
                  ],
                ],
              ),
            );
          },
        ),

        const SizedBox(height: 18),

        _buildPaginationDots(screenshots.length),
      ],
    );
  }

  List<Widget> _buildGalleryImages(
    List<String> screenshots,
    double availableWidth,
  ) {
    if (screenshots.isEmpty) {
      return [];
    }

    final widgets = <Widget>[];

    final current = selectedScreenshot;

    final previous = current == 0 ? screenshots.length - 1 : current - 1;

    final next = current == screenshots.length - 1 ? 0 : current + 1;

    // Previous screenshot
    if (screenshots.length > 1) {
      widgets.add(
        _buildGalleryImage(
          imagePath: screenshots[previous],
          position: _GalleryPosition.previous,
          availableWidth: availableWidth,
        ),
      );
    }

    // Current screenshot
    widgets.add(
      _buildGalleryImage(
        imagePath: screenshots[current],
        position: _GalleryPosition.center,
        availableWidth: availableWidth,
      ),
    );

    // Next screenshot
    if (screenshots.length > 2) {
      widgets.add(
        _buildGalleryImage(
          imagePath: screenshots[next],
          position: _GalleryPosition.next,
          availableWidth: availableWidth,
        ),
      );
    }

    return widgets;
  }

  Widget _buildGalleryImage({
    required String imagePath,
    required _GalleryPosition position,
    required double availableWidth,
  }) {
    final isCenter = position == _GalleryPosition.center;

    final bool isMobile = widget.isMobile;

    final double centerWidth = isMobile ? 230 : 430;

    final double sideWidth = isMobile ? 155 : 280;

    final double imageWidth = isCenter ? centerWidth : sideWidth;

    final double imageHeight = isMobile
        ? (isCenter ? 330 : 250)
        : (isCenter ? 460 : 360);

    double horizontalOffset;

    if (isCenter) {
      horizontalOffset = 0;
    } else if (position == _GalleryPosition.previous) {
      horizontalOffset = isMobile ? -145 : -260;
    } else {
      horizontalOffset = isMobile ? 145 : 260;
    }

    final blurAmount = isCenter ? 0.0 : 3.0;
    final opacity = isCenter ? 1.0 : 0.48;
    final scale = isCenter ? 1.0 : 0.78;

    return AnimatedAlign(
      duration: const Duration(milliseconds: 450),
      curve: Curves.easeInOutCubic,
      alignment: Alignment.center,
      child: Transform.translate(
        offset: Offset(horizontalOffset, 0),
        child: AnimatedScale(
          scale: scale,
          duration: const Duration(milliseconds: 450),
          curve: Curves.easeInOutCubic,
          child: AnimatedOpacity(
            opacity: opacity,
            duration: const Duration(milliseconds: 450),
            curve: Curves.easeInOutCubic,
            child: GestureDetector(
              onTap: isCenter
                  ? null
                  : () {
                      final screenshots = widget.project.screenshotPaths;

                      if (position == _GalleryPosition.previous) {
                        final previous = selectedScreenshot == 0
                            ? screenshots.length - 1
                            : selectedScreenshot - 1;

                        _changeScreenshot(previous);
                      } else {
                        final next =
                            selectedScreenshot == screenshots.length - 1
                            ? 0
                            : selectedScreenshot + 1;

                        _changeScreenshot(next);
                      }
                    },
              child: Container(
                width: imageWidth,
                height: imageHeight,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(22),
                  border: Border.all(
                    color: isCenter
                        ? AppColors.secondary.withValues(alpha: 0.35)
                        : AppColors.border,
                  ),
                  boxShadow: isCenter
                      ? [
                          BoxShadow(
                            color: AppColors.secondary.withValues(alpha: 0.12),
                            blurRadius: 35,
                            spreadRadius: 2,
                          ),
                        ]
                      : [],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(21),
                  child: ImageFiltered(
                    imageFilter: ImageFilter.blur(
                      sigmaX: blurAmount,
                      sigmaY: blurAmount,
                    ),
                    child: Image.asset(
                      imagePath,
                      fit: BoxFit.contain,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          color: AppColors.surface,
                          alignment: Alignment.center,
                          child: const Icon(
                            Icons.image_not_supported_outlined,
                            size: 40,
                            color: AppColors.textMuted,
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildGalleryArrow({
    required Alignment alignment,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return Align(
      alignment: alignment,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4),
        child: Material(
          color: AppColors.surfaceLight.withValues(alpha: 0.92),
          shape: const CircleBorder(),
          child: InkWell(
            onTap: onTap,
            customBorder: const CircleBorder(),
            child: Padding(
              padding: const EdgeInsets.all(13),
              child: Icon(icon, size: 15, color: AppColors.textPrimary),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPaginationDots(int count) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(count, (index) {
        final isSelected = index == selectedScreenshot;

        return AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeOut,
          margin: const EdgeInsets.symmetric(horizontal: 4),
          width: isSelected ? 24 : 7,
          height: 7,
          decoration: BoxDecoration(
            color: isSelected ? AppColors.secondary : AppColors.textMuted,
            borderRadius: BorderRadius.circular(10),
          ),
        );
      }),
    );
  }

  // ---------------------------------------------------------------------------
  // Technologies
  // ---------------------------------------------------------------------------

  Widget _buildTechnologySection() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'TECHNOLOGIES',
            style: AppTextStyles.labelLarge.copyWith(
              color: AppColors.secondary,
              letterSpacing: 1.2,
            ),
          ),

          const SizedBox(height: 16),

          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: widget.project.technologies.map((technology) {
              return Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: AppColors.surfaceLight,
                  borderRadius: BorderRadius.circular(8),
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

  // ---------------------------------------------------------------------------
  // Project Details
  // ---------------------------------------------------------------------------

  Widget _buildDetailsSection() {
    return Wrap(
      spacing: 16,
      runSpacing: 16,
      children: widget.project.details.map((detail) {
        return Container(
          width: widget.isMobile ? double.infinity : 280,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: AppColors.card,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: AppColors.border),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (detail.icon != null)
                Icon(detail.icon, color: AppColors.secondary, size: 22),

              if (detail.icon != null) const SizedBox(height: 14),

              Text(detail.title, style: AppTextStyles.titleLarge),

              const SizedBox(height: 8),

              Text(detail.content, style: AppTextStyles.bodyMedium),
            ],
          ),
        );
      }).toList(),
    );
  }

  // ---------------------------------------------------------------------------
  // Action Buttons
  // ---------------------------------------------------------------------------

  Widget _buildActionButtons() {
    return Wrap(
      spacing: 12,
      runSpacing: 12,
      children: [
        if (widget.project.githubUrl != null)
          _buildActionButton(
            label: 'GitHub',
            icon: Icons.code,
            onTap: () {
              UrlLauncherUtils.launchUrl(widget.project.githubUrl!);
            },
          ),

        if (widget.project.liveUrl != null)
          _buildActionButton(
            label: 'Live Demo',
            icon: Icons.open_in_new,
            onTap: () {
              UrlLauncherUtils.launchUrl(widget.project.liveUrl!);
            },
          ),
      ],
    );
  }

  Widget _buildActionButton({
    required String label,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: AppColors.border),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 18, color: AppColors.secondary),
            const SizedBox(width: 8),
            Text(label, style: AppTextStyles.labelLarge),
          ],
        ),
      ),
    );
  }
}

enum _GalleryPosition { previous, center, next }

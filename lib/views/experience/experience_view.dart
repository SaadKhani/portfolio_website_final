import 'package:flutter/material.dart';

import '../../core/responsive/responsive.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../widgets/common/pdf_viewer.dart';
import '../../widgets/common/section_title.dart';

class ExperienceView extends StatefulWidget {
  const ExperienceView({super.key});

  @override
  State<ExperienceView> createState() => _ExperienceViewState();
}

class _ExperienceViewState extends State<ExperienceView> {
  String? _selectedDocument;

  void _toggleDocument(String documentPath) {
    setState(() {
      if (_selectedDocument == documentPath) {
        _selectedDocument = null;
      } else {
        _selectedDocument = documentPath;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Responsive.pagePadding(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 120),

          const SectionTitle(
            eyebrow: 'EXPERIENCE',
            title: 'Professional experience',
            description:
                'My professional journey has given me the opportunity to '
                'work on real applications, collaborate with development teams, '
                'and turn what I learned into practical software.',
          ),

          const SizedBox(height: 70),

          _buildTimeline(context),

          const SizedBox(height: 120),
        ],
      ),
    );
  }

  Widget _buildTimeline(BuildContext context) {
    final experiences = [
      _ExperienceItem(
        year: '2025',
        title: 'Flutter Developer Intern',
        company: 'PKOLS',
        icon: Icons.work_outline_rounded,
        description:
            'My first professional development experience where I moved '
            'from learning through personal projects to working in a '
            'professional development environment. I gained practical '
            'experience with Flutter development, teamwork, and real-world '
            'software development workflows.',
        technologies: [
          'Flutter',
          'Dart',
          'Mobile Development',
          'Team Collaboration',
        ],
      ),
      _ExperienceItem(
        year: '2025',
        title: 'Flutter Developer Intern',
        company: 'Codefend IT Solutions',
        icon: Icons.business_center_outlined,
        description:
            'Worked with senior developers on practical and client-oriented '
            'applications. I contributed to Flutter application development '
            'while gaining hands-on experience with responsive interfaces, '
            'MVVM architecture, Provider state management, Firebase, and '
            'REST API integrations.',
        technologies: [
          'Flutter',
          'Dart',
          'MVVM',
          'Provider',
          'Firebase',
          'REST APIs',
        ],
        featured: true,
        hasCredentials: true,
      ),
    ];

    return Column(
      children: List.generate(experiences.length, (index) {
        final experience = experiences[index];

        return _ExperienceTimelineItem(
          experience: experience,
          isLast: index == experiences.length - 1,
          selectedDocument: _selectedDocument,
          onDocumentTap: _toggleDocument,
        );
      }),
    );
  }
}

class _ExperienceItem {
  final String year;
  final String title;
  final String company;
  final String description;
  final IconData icon;
  final List<String> technologies;
  final bool featured;
  final bool hasCredentials;

  const _ExperienceItem({
    required this.year,
    required this.title,
    required this.company,
    required this.description,
    required this.icon,
    required this.technologies,
    this.featured = false,
    this.hasCredentials = false,
  });
}

class _ExperienceTimelineItem extends StatelessWidget {
  final _ExperienceItem experience;
  final bool isLast;
  final String? selectedDocument;
  final Function(String) onDocumentTap;

  const _ExperienceTimelineItem({
    required this.experience,
    required this.isLast,
    required this.selectedDocument,
    required this.onDocumentTap,
  });

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);

    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            width: isMobile ? 52 : 80,
            child: Column(
              children: [
                _buildTimelineNode(),

                if (!isLast)
                  Expanded(
                    child: Container(
                      width: 1,
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      color: AppColors.border,
                    ),
                  ),
              ],
            ),
          ),

          Expanded(
            child: Padding(
              padding: EdgeInsets.only(
                left: isMobile ? 8 : 20,
                bottom: isLast ? 0 : 32,
              ),
              child: _buildExperienceCard(context),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTimelineNode() {
    final color = experience.featured ? AppColors.primary : AppColors.textMuted;

    return Container(
      width: 46,
      height: 46,
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.10),
        shape: BoxShape.circle,
        border: Border.all(color: color.withValues(alpha: 0.35)),
      ),
      child: Icon(experience.icon, size: 21, color: color),
    );
  }

  Widget _buildExperienceCard(BuildContext context) {
    final isMobile = Responsive.isMobile(context);

    return Container(
      padding: EdgeInsets.all(isMobile ? 22 : 30),
      decoration: BoxDecoration(
        color: experience.featured ? AppColors.surfaceLight : AppColors.surface,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: experience.featured
              ? AppColors.primary.withValues(alpha: 0.35)
              : AppColors.border,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Wrap(
            spacing: 10,
            runSpacing: 8,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              _buildYearBadge(),

              if (experience.featured)
                _buildBadge('PROFESSIONAL', AppColors.primary),
            ],
          ),

          const SizedBox(height: 18),

          Text(experience.title, style: AppTextStyles.headlineMedium),

          const SizedBox(height: 6),

          Text(
            experience.company,
            style: AppTextStyles.titleLarge.copyWith(
              color: AppColors.secondary,
            ),
          ),

          const SizedBox(height: 18),

          Text(experience.description, style: AppTextStyles.bodyMedium),

          const SizedBox(height: 24),

          Text(
            'TECHNOLOGIES',
            style: AppTextStyles.labelLarge.copyWith(
              color: AppColors.textMuted,
              letterSpacing: 1.2,
              fontSize: 12,
            ),
          ),

          const SizedBox(height: 12),

          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: experience.technologies.map(_buildTechnologyTag).toList(),
          ),

          if (experience.hasCredentials) ...[
            const SizedBox(height: 28),
            _buildCredentials(context),
          ],
        ],
      ),
    );
  }

  Widget _buildCredentials(BuildContext context) {
    final isMobile = Responsive.isMobile(context);

    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 38,
                height: 38,
                decoration: BoxDecoration(
                  color: AppColors.secondary.withValues(alpha: 0.10),
                  borderRadius: BorderRadius.circular(11),
                ),
                child: const Icon(
                  Icons.verified_outlined,
                  size: 20,
                  color: AppColors.secondary,
                ),
              ),

              const SizedBox(width: 12),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Credentials',
                      style: AppTextStyles.titleLarge.copyWith(fontSize: 17),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      'View my internship documents',
                      style: AppTextStyles.bodySmall,
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 18),

          if (isMobile)
            Column(
              children: [
                _buildDocumentButton(
                  icon: Icons.workspace_premium_outlined,
                  title: 'Certificate',
                  documentPath:
                      'assets/lib/resources/documents/'
                      'Saad_Internship_Certificate.pdf',
                ),

                const SizedBox(height: 10),

                _buildDocumentButton(
                  icon: Icons.recommend_outlined,
                  title: 'Recommendation Letter',
                  documentPath:
                      'assets/lib/resources/documents/'
                      'Experience_Letter_Saad.pdf',
                ),
              ],
            )
          else
            Row(
              children: [
                Expanded(
                  child: _buildDocumentButton(
                    icon: Icons.workspace_premium_outlined,
                    title: 'Certificate',
                    documentPath:
                        'assets/lib/resources/documents/'
                        'Saad_Internship_Certificate.pdf',
                  ),
                ),

                const SizedBox(width: 10),

                Expanded(
                  child: _buildDocumentButton(
                    icon: Icons.recommend_outlined,
                    title: 'Recommendation Letter',
                    documentPath:
                        'assets/lib/resources/documents/'
                        'Experience_Letter_Saad.pdf',
                  ),
                ),
              ],
            ),

          if (selectedDocument != null) ...[
            const SizedBox(height: 24),
            _buildPdfSection(),
          ],
        ],
      ),
    );
  }

  Widget _buildDocumentButton({
    required IconData icon,
    required String title,
    required String documentPath,
  }) {
    final isSelected = selectedDocument == documentPath;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(14),
        onTap: () {
          onDocumentTap(documentPath);
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 220),
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 13),
          decoration: BoxDecoration(
            color: isSelected
                ? AppColors.primary.withValues(alpha: 0.10)
                : AppColors.surfaceLight,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(
              color: isSelected
                  ? AppColors.primary.withValues(alpha: 0.45)
                  : AppColors.border,
            ),
          ),
          child: Row(
            children: [
              Icon(
                icon,
                size: 19,
                color: isSelected ? AppColors.primary : AppColors.textSecondary,
              ),

              const SizedBox(width: 10),

              Expanded(
                child: Text(
                  title,
                  style: AppTextStyles.labelLarge.copyWith(
                    color: isSelected
                        ? AppColors.textPrimary
                        : AppColors.textSecondary,
                  ),
                ),
              ),

              AnimatedRotation(
                turns: isSelected ? 0.5 : 0,
                duration: const Duration(milliseconds: 220),
                child: Icon(
                  Icons.keyboard_arrow_down_rounded,
                  size: 20,
                  color: isSelected ? AppColors.primary : AppColors.textMuted,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPdfSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              width: 8,
              height: 8,
              decoration: const BoxDecoration(
                color: AppColors.secondary,
                shape: BoxShape.circle,
              ),
            ),

            const SizedBox(width: 10),

            Expanded(
              child: Text(
                selectedDocument!.contains('Certificate')
                    ? 'Internship Certificate'
                    : 'Recommendation Letter',
                style: AppTextStyles.titleLarge.copyWith(fontSize: 18),
              ),
            ),

            IconButton(
              tooltip: 'Close document',
              onPressed: () {
                onDocumentTap(selectedDocument!);
              },
              icon: const Icon(Icons.close_rounded, color: AppColors.textMuted),
            ),
          ],
        ),

        const SizedBox(height: 12),

        PdfViewer(assetPath: selectedDocument!),
      ],
    );
  }

  Widget _buildYearBadge() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: AppColors.border),
      ),
      child: Text(
        experience.year,
        style: AppTextStyles.labelLarge.copyWith(
          color: AppColors.textSecondary,
        ),
      ),
    );
  }

  Widget _buildBadge(String text, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.10),
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: color.withValues(alpha: 0.25)),
      ),
      child: Text(
        text,
        style: AppTextStyles.labelLarge.copyWith(
          color: color,
          fontSize: 11,
          letterSpacing: 1,
        ),
      ),
    );
  }

  Widget _buildTechnologyTag(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 7),
      decoration: BoxDecoration(
        color: AppColors.surfaceLight,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: AppColors.border),
      ),
      child: Text(
        text,
        style: AppTextStyles.bodySmall.copyWith(color: AppColors.textSecondary),
      ),
    );
  }
}

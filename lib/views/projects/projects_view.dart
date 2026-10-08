import 'package:flutter/material.dart';
import 'package:portfolio_website/widgets/projects/project_category.dart';

import '../../core/responsive/responsive.dart';
import '../../data/projects_data.dart';
import '../../widgets/common/section_title.dart';

class ProjectsView extends StatelessWidget {
  const ProjectsView({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = ProjectsData.categories;

    return Padding(
      padding: Responsive.pagePadding(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 120),

          const SectionTitle(
            eyebrow: 'MY WORK',
            title: 'Projects',
            description:
                'A collection of applications, backend systems, '
                'machine learning projects, and intelligent solutions '
                'I have built and explored.',
          ),

          const SizedBox(height: 80),

          ...categories.map(
            (category) => Padding(
              padding: const EdgeInsets.only(bottom: 70),
              child: ProjectCategoryWidget(category: category),
            ),
          ),

          const SizedBox(height: 80),
        ],
      ),
    );
  }
}

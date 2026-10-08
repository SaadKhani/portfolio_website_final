import 'package:flutter/material.dart';

import '../../core/responsive/responsive.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../widgets/common/section_title.dart';

class SkillsView extends StatelessWidget {
  const SkillsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Responsive.pagePadding(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 120),

          const SectionTitle(
            eyebrow: 'SKILLS',
            title: 'Technologies I work with',
            description:
                'A growing set of technologies I use to build applications, '
                'backend systems, and intelligent solutions.',
          ),

          const SizedBox(height: 60),

          _buildSkillsGrid(context),

          const SizedBox(height: 120),
        ],
      ),
    );
  }

  Widget _buildSkillsGrid(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;

        // One column for smaller screens.
        if (width < 700) {
          return Column(
            children: [
              _buildMobileCard(),
              const SizedBox(height: 20),
              _buildBackendCard(),
              const SizedBox(height: 20),
              _buildMachineLearningCard(),
              const SizedBox(height: 20),
              _buildExploringAiCard(),
            ],
          );
        }

        // Two columns for larger screens.
        return GridView(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
            mainAxisExtent: 300,
          ),
          children: [
            _buildMobileCard(),
            _buildBackendCard(),
            _buildMachineLearningCard(),
            _buildExploringAiCard(),
          ],
        );
      },
    );
  }

  Widget _buildMobileCard() {
    return _buildSkillCard(
      icon: Icons.phone_android_rounded,
      title: 'Mobile Application Development & Frontend',
      subtitle: 'Building modern and responsive applications',
      skills: [
        'Flutter',
        'Dart',
        'Provider',
        'GetX',
        'Riverpod',
        'Local Storage',
        'MVVM',
        'Responsive UI',
        'Firebase',
      ],
    );
  }

  Widget _buildBackendCard() {
    return _buildSkillCard(
      icon: Icons.cloud_outlined,
      title: 'Backend & APIs',
      subtitle: 'Developing APIs and backend systems',
      skills: [
        'Node.js',
        'Express.js',
        'MongoDB',
        'FastAPI',
        'REST APIs',
        'Postman',
      ],
    );
  }

  Widget _buildMachineLearningCard() {
    return _buildSkillCard(
      icon: Icons.auto_awesome_rounded,
      title: 'AI & Machine Learning',
      subtitle: 'Building and exploring intelligent systems',
      skills: [
        'Machine Learning',
        'Deep Learning',
        'Computer Vision',
        'Model Development',
        'Python',
        'NumPy',
        'Pandas',
        'Scikit-learn',
      ],
    );
  }

  Widget _buildExploringAiCard() {
    return _buildSkillCard(
      icon: Icons.psychology_outlined,
      title: 'Exploring AI',
      subtitle: 'Technologies I am currently learning',
      skills: ['Generative AI', 'LLMs', 'RAG', 'AI Agents'],
    );
  }

  Widget _buildSkillCard({
    required IconData icon,
    required String title,
    required String subtitle,
    required List<String> skills,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: AppColors.primary.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Icon(icon, color: AppColors.primary, size: 24),
              ),

              const SizedBox(width: 14),

              Expanded(child: Text(title, style: AppTextStyles.titleLarge)),
            ],
          ),

          const SizedBox(height: 14),

          Text(subtitle, style: AppTextStyles.bodySmall),

          const SizedBox(height: 22),

          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: skills.map((skill) {
              return Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: AppColors.surfaceLight,
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: AppColors.border),
                ),
                child: Text(
                  skill,
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
}

// import 'package:flutter/material.dart';

// import '../../core/responsive/responsive.dart';
// import '../../core/theme/app_colors.dart';
// import '../../core/theme/app_text_styles.dart';
// import '../../widgets/common/section_title.dart';

// class SkillsView extends StatelessWidget {
//   const SkillsView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final isMobile = Responsive.isMobile(context);

//     return Padding(
//       padding: Responsive.pagePadding(context),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           const SizedBox(height: 120),

//           const SectionTitle(
//             eyebrow: 'SKILLS',
//             title: 'Technologies I work with',
//             description:
//                 'A growing set of technologies I use to build applications, '
//                 'backend systems, and intelligent solutions.',
//           ),

//           const SizedBox(height: 60),

//           if (isMobile) _buildMobileSkills() else _buildDesktopSkills(),

//           const SizedBox(height: 120),
//         ],
//       ),
//     );
//   }

//   Widget _buildMobileSkills() {
//     return Column(
//       children: [
//         _buildSkillCard(
//           icon: Icons.phone_android_rounded,
//           title: 'Mobile Application Development & Frontend',
//           subtitle: 'Building modern and responsive applications',
//           skills: [
//             'Flutter',
//             'Dart',
//             'Provider',
//             'GetX',
//             'Riverpod',
//             'Local Storage',
//             'MVVM',
//             'Responsive UI',
//             'Firebase',
//           ],
//         ),

//         const SizedBox(height: 20),

//         _buildSkillCard(
//           icon: Icons.cloud_outlined,
//           title: 'Backend & APIs',
//           subtitle: 'Developing APIs and backend systems',
//           skills: [
//             'Node.js',
//             'Express.js',
//             'MongoDB',
//             'FastAPI',
//             'REST APIs',
//             'Postman',
//           ],
//         ),

//         const SizedBox(height: 20),

//         _buildSkillCard(
//           icon: Icons.auto_awesome_rounded,
//           title: 'AI & Machine Learning',
//           subtitle: 'Building and exploring intelligent systems',
//           skills: [
//             'Machine Learning',
//             'Deep Learning',
//             'Computer Vision',
//             'Model Development',
//             'Python',
//             'NumPy',
//             'Pandas',
//             'Scikit-learn',
//           ],
//         ),

//         const SizedBox(height: 20),

//         _buildSkillCard(
//           icon: Icons.psychology_outlined,
//           title: 'Exploring AI',
//           subtitle: 'Technologies I am currently learning',
//           skills: ['Generative AI', 'LLMs', 'RAG', 'AI Agents'],
//         ),
//       ],
//     );
//   }

//   Widget _buildDesktopSkills() {
//     return LayoutBuilder(
//       builder: (context, constraints) {
//         return GridView.builder(
//           shrinkWrap: true,
//           physics: const NeverScrollableScrollPhysics(),
//           itemCount: 4,
//           gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
//             maxCrossAxisExtent: 600,
//             crossAxisSpacing: 20,
//             mainAxisSpacing: 20,

//             // Allows cards to grow vertically according to their content.
//             mainAxisExtent: 320,
//           ),
//           itemBuilder: (context, index) {
//             return _buildSkillCardByIndex(index);
//           },
//         );
//       },
//     );
//   }

//   Widget _buildSkillCardByIndex(int index) {
//     switch (index) {
//       case 0:
//         return _buildSkillCard(
//           icon: Icons.phone_android_rounded,
//           title: 'Mobile Application Development & Frontend',
//           subtitle: 'Building modern and responsive applications',
//           skills: [
//             'Flutter',
//             'Dart',
//             'Provider',
//             'GetX',
//             'Riverpod',
//             'Local Storage',
//             'MVVM',
//             'Responsive UI',
//             'Firebase',
//           ],
//         );

//       case 1:
//         return _buildSkillCard(
//           icon: Icons.cloud_outlined,
//           title: 'Backend & APIs',
//           subtitle: 'Developing APIs and backend systems',
//           skills: [
//             'Node.js',
//             'Express.js',
//             'MongoDB',
//             'FastAPI',
//             'REST APIs',
//             'Postman',
//           ],
//         );

//       case 2:
//         return _buildSkillCard(
//           icon: Icons.auto_awesome_rounded,
//           title: 'AI & Machine Learning',
//           subtitle: 'Building and exploring intelligent systems',
//           skills: [
//             'Machine Learning',
//             'Deep Learning',
//             'Computer Vision',
//             'Model Development',
//             'Python',
//             'NumPy',
//             'Pandas',
//             'Scikit-learn',
//           ],
//         );

//       case 3:
//         return _buildSkillCard(
//           icon: Icons.psychology_outlined,
//           title: 'Exploring AI',
//           subtitle: 'Technologies I am currently learning',
//           skills: ['Generative AI', 'LLMs', 'RAG', 'AI Agents'],
//         );

//       default:
//         return const SizedBox.shrink();
//     }
//   }

//   Widget _buildSkillCard({
//     required IconData icon,
//     required String title,
//     required String subtitle,
//     required List<String> skills,
//   }) {
//     return Container(
//       width: double.infinity,
//       padding: const EdgeInsets.all(28),
//       decoration: BoxDecoration(
//         color: AppColors.surface,
//         borderRadius: BorderRadius.circular(24),
//         border: Border.all(color: AppColors.border),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Container(
//                 width: 48,
//                 height: 48,
//                 decoration: BoxDecoration(
//                   color: AppColors.primary.withValues(alpha: 0.12),
//                   borderRadius: BorderRadius.circular(14),
//                 ),
//                 child: Icon(icon, color: AppColors.primary, size: 24),
//               ),

//               const SizedBox(width: 14),

//               Expanded(child: Text(title, style: AppTextStyles.titleLarge)),
//             ],
//           ),

//           const SizedBox(height: 14),

//           Text(subtitle, style: AppTextStyles.bodySmall),

//           const SizedBox(height: 22),

//           Expanded(
//             child: SingleChildScrollView(
//               child: Wrap(
//                 spacing: 8,
//                 runSpacing: 8,
//                 children: skills.map((skill) {
//                   return Container(
//                     padding: const EdgeInsets.symmetric(
//                       horizontal: 12,
//                       vertical: 8,
//                     ),
//                     decoration: BoxDecoration(
//                       color: AppColors.surfaceLight,
//                       borderRadius: BorderRadius.circular(30),
//                       border: Border.all(color: AppColors.border),
//                     ),
//                     child: Text(
//                       skill,
//                       style: AppTextStyles.bodySmall.copyWith(
//                         color: AppColors.textSecondary,
//                       ),
//                     ),
//                   );
//                 }).toList(),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// // import 'package:flutter/material.dart';

// // import '../../core/responsive/responsive.dart';
// // import '../../core/theme/app_colors.dart';
// // import '../../core/theme/app_text_styles.dart';
// // import '../../widgets/common/section_title.dart';

// // class SkillsView extends StatelessWidget {
// //   const SkillsView({super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     final isMobile = Responsive.isMobile(context);

// //     return Padding(
// //       padding: Responsive.pagePadding(context),
// //       child: Column(
// //         crossAxisAlignment: CrossAxisAlignment.start,
// //         children: [
// //           const SizedBox(height: 120),

// //           const SectionTitle(
// //             eyebrow: 'SKILLS',
// //             title: 'Technologies I work with',
// //             description:
// //                 'A growing set of technologies I use to build applications, '
// //                 'backend systems, and intelligent solutions.',
// //           ),

// //           const SizedBox(height: 60),

// //           isMobile
// //               ? Column(
// //                   children: [
// //                     _buildSkillCard(
// //                       icon: Icons.phone_android_rounded,
// //                       title: 'Mobile Applicaion Development & Frontend',
// //                       subtitle: 'Building modern and responsive applications',
// //                       skills: [
// //                         'Flutter',
// //                         'Dart',
// //                         'Provider',
// //                         'Getx',
// //                         'Riverpod',
// //                         'Local Storage',
// //                         'MVVM',
// //                         'Responsive UI',
// //                         'Firebase',
// //                       ],
// //                     ),
// //                     const SizedBox(height: 20),
// //                     _buildSkillCard(
// //                       icon: Icons.cloud_outlined,
// //                       title: 'Backend & APIs',
// //                       subtitle: 'Developing APIs and backend systems',
// //                       skills: [
// //                         'Node.js',
// //                         'Express.js',
// //                         'MongoDB',
// //                         'FastAPI',
// //                         'REST APIs',
// //                         'Postman',
// //                       ],
// //                     ),
// //                     const SizedBox(height: 20),
// //                     _buildSkillCard(
// //                       icon: Icons.auto_awesome_rounded,
// //                       title: 'AI & Machine Learning',
// //                       subtitle: 'Building and exploring intelligent systems',
// //                       skills: [
// //                         'Machine Learning',
// //                         'Deep Learning',
// //                         'Computer Vision',
// //                         'Model Development',
// //                         'Python',
// //                         'NumPy',
// //                         'Pandas',
// //                         'Scikit-learn',
// //                       ],
// //                     ),
// //                     const SizedBox(height: 20),
// //                     _buildSkillCard(
// //                       icon: Icons.psychology_outlined,
// //                       title: 'Exploring AI',
// //                       subtitle: 'Technologies I am currently learning',
// //                       skills: ['Generative AI', 'LLMs', 'RAG', 'AI Agents'],
// //                     ),
// //                   ],
// //                 )
// //               : GridView.count(
// //                   crossAxisCount: 2,
// //                   crossAxisSpacing: 20,
// //                   mainAxisSpacing: 20,
// //                   shrinkWrap: true,
// //                   physics: const NeverScrollableScrollPhysics(),
// //                   childAspectRatio: 1.45,
// //                   children: [
// //                     _buildSkillCard(
// //                       icon: Icons.phone_android_rounded,
// //                       title: 'Mobile Applicaion Development & Frontend',
// //                       subtitle: 'Building modern and responsive applications',
// //                       skills: [
// //                         'Flutter',
// //                         'Dart',
// //                         'Provider',
// //                         'Getx',
// //                         'Riverpod',
// //                         'Local Storage',
// //                         'MVVM',
// //                         'Responsive UI',
// //                         'Firebase',
// //                       ],
// //                     ),
// //                     _buildSkillCard(
// //                       icon: Icons.cloud_outlined,
// //                       title: 'Backend & APIs',
// //                       subtitle: 'Developing APIs and backend systems',
// //                       skills: [
// //                         'Node.js',
// //                         'Express.js',
// //                         'MongoDB',
// //                         'FastAPI',
// //                         'REST APIs',
// //                         'Postman',
// //                       ],
// //                     ),
// //                     _buildSkillCard(
// //                       icon: Icons.auto_awesome_rounded,
// //                       title: 'AI & Machine Learning',
// //                       subtitle: 'Building and exploring intelligent systems',
// //                       skills: [
// //                         'Machine Learning',
// //                         'Deep Learning',
// //                         'Computer Vision',
// //                         'Model Development',
// //                         'Python',
// //                         'NumPy',
// //                         'Pandas',
// //                         'Scikit-learn',
// //                       ],
// //                     ),
// //                     _buildSkillCard(
// //                       icon: Icons.psychology_outlined,
// //                       title: 'Exploring AI',
// //                       subtitle: 'Technologies I am currently learning',
// //                       skills: ['Generative AI', 'LLMs', 'RAG', 'AI Agents'],
// //                     ),
// //                   ],
// //                 ),

// //           const SizedBox(height: 120),
// //         ],
// //       ),
// //     );
// //   }

// //   Widget _buildSkillCard({
// //     required IconData icon,
// //     required String title,
// //     required String subtitle,
// //     required List<String> skills,
// //   }) {
// //     return Container(
// //       padding: const EdgeInsets.all(28),
// //       decoration: BoxDecoration(
// //         color: AppColors.surface,
// //         borderRadius: BorderRadius.circular(24),
// //         border: Border.all(color: AppColors.border),
// //       ),
// //       child: Column(
// //         crossAxisAlignment: CrossAxisAlignment.start,
// //         children: [
// //           Row(
// //             children: [
// //               Container(
// //                 width: 48,
// //                 height: 48,
// //                 decoration: BoxDecoration(
// //                   color: AppColors.primary.withValues(alpha: 0.12),
// //                   borderRadius: BorderRadius.circular(14),
// //                 ),
// //                 child: Icon(icon, color: AppColors.primary, size: 24),
// //               ),
// //               const SizedBox(width: 14),
// //               Expanded(child: Text(title, style: AppTextStyles.titleLarge)),
// //             ],
// //           ),

// //           const SizedBox(height: 14),

// //           Text(subtitle, style: AppTextStyles.bodySmall),

// //           const SizedBox(height: 22),

// //           Wrap(
// //             spacing: 8,
// //             runSpacing: 8,
// //             children: skills.map((skill) {
// //               return Container(
// //                 padding: const EdgeInsets.symmetric(
// //                   horizontal: 12,
// //                   vertical: 8,
// //                 ),
// //                 decoration: BoxDecoration(
// //                   color: AppColors.surfaceLight,
// //                   borderRadius: BorderRadius.circular(30),
// //                   border: Border.all(color: AppColors.border),
// //                 ),
// //                 child: Text(
// //                   skill,
// //                   style: AppTextStyles.bodySmall.copyWith(
// //                     color: AppColors.textSecondary,
// //                   ),
// //                 ),
// //               );
// //             }).toList(),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }

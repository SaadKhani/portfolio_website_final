import '../models/education_model.dart';

class EducationData {
  EducationData._();

  static const List<EducationModel> education = [
    EducationModel(
      degree: 'Bachelor of Science in Computer Science',
      institution: 'University of Peshawar',
      location: 'Peshawar, Pakistan',
      duration: '2022 — 2026',
      description:
          'Completed a Bachelor of Science in Computer Science with a focus '
          'on software development, application development, databases, '
          'and emerging technologies.',
      highlights: [
        'Computer Science',
        'Software Development',
        'Mobile Application Development',
        'Databases',
        'Artificial Intelligence',
      ],
    ),

    EducationModel(
      degree: 'F.Sc. (Pre-Medical)',
      institution: 'Edwardes College Peshawar',
      location: 'Peshawar, Pakistan',
      duration: '2019 — 2021',
      description:
          'Completed F.Sc. with a focus on science subjects, providing a '
          'strong academic foundation before pursuing Computer Science.',
      highlights: ['Physics', 'Chemistry', 'Biology', 'Mathematics'],
    ),
  ];
}

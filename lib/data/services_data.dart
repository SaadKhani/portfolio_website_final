import '../models/service_model.dart';

class ServicesData {
  ServicesData._();

  static const List<ServiceModel> services = [
    ServiceModel(
      title: 'Mobile App Development',
      description:
          'Building modern, responsive mobile applications with Flutter '
          'and creating smooth user experiences across different screen sizes.',
      icon: 'mobile',
      technologies: ['Flutter', 'Dart', 'Provider', 'Firebase', 'REST APIs'],
    ),

    ServiceModel(
      title: 'Backend & API Development',
      description:
          'Developing reliable backend systems and REST APIs that connect '
          'applications with databases and external services.',
      icon: 'backend',
      technologies: [
        'Node.js',
        'Express.js',
        'MongoDB',
        'REST APIs',
        'Postman',
      ],
    ),

    ServiceModel(
      title: 'AI & Machine Learning',
      description:
          'Developing practical machine learning solutions for prediction, '
          'classification, and data-driven applications.',
      icon: 'ai',
      technologies: [
        'Python',
        'NumPy',
        'Pandas',
        'Scikit-learn',
        'Machine Learning',
      ],
    ),

    ServiceModel(
      title: 'AI-Powered Applications',
      description:
          'Integrating intelligent capabilities into applications, including '
          'computer vision and other AI-powered features.',
      icon: 'brain',
      technologies: ['Python', 'Computer Vision', 'Deep Learning', 'AI'],
    ),

    ServiceModel(
      title: 'Full-Stack Development',
      description:
          'Building complete applications by combining modern frontends, '
          'backend APIs, databases, and intelligent technologies.',
      icon: 'fullstack',
      technologies: ['Flutter', 'Node.js', 'MongoDB', 'Firebase', 'APIs'],
    ),
  ];
}

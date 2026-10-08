import 'package:flutter/material.dart';

import '../models/project_model.dart';

class ProjectsData {
  ProjectsData._();

  static const List<ProjectCategory> categories = [
    // ─────────────────────────────────────────────
    // MOBILE & FLUTTER
    // ─────────────────────────────────────────────
    ProjectCategory(
      title: 'Mobile & Flutter',
      subtitle:
          'Modern mobile and cross-platform applications built with Flutter.',
      projects: [
        ProjectModel(
          title: 'Habito — Habit Tracking App',
          description:
              'A modern habit tracking application designed to help users '
              'build consistent routines, monitor their progress, and develop '
              'better daily habits through an intuitive mobile experience.',
          screenshotPaths: [
            'lib/resources/images/projects/Ecom_app/1.jpg',
            'lib/resources/images/projects/Ecom_app/2.jpg',
            'lib/resources/images/projects/Ecom_app/3.jpg',
            'lib/resources/images/projects/Ecom_app/4.jpg',
            'lib/resources/images/projects/Ecom_app/5.jpg',
            'lib/resources/images/projects/Ecom_app/6.jpg',
            'lib/resources/images/projects/Ecom_app/7.jpg',
            'lib/resources/images/projects/Ecom_app/8.jpg',
            'lib/resources/images/projects/Ecom_app/9.jpg',
          ],
          videoPath: 'lib/resources/videos/Ecom_app/task.mp4',
          technologies: [
            'Flutter',
            'Dart',
            'Provider',
            'MVVM',
            'Firebase',
            'Firestore',
          ],
          githubUrl: 'https://github.com/SaadKhani/FYP-Habbito_appication.git',
          liveUrl: null,
          details: [
            ProjectDetail(
              title: 'Architecture',
              content: 'MVVM + Provider + Repository Pattern',
              icon: Icons.architecture_rounded,
            ),
            ProjectDetail(
              title: 'Backend',
              content: 'Firebase Authentication + Cloud Firestore',
              icon: Icons.cloud_outlined,
            ),
            ProjectDetail(
              title: 'State Management',
              content: 'Provider',
              icon: Icons.account_tree_outlined,
            ),
          ],
        ),
        ProjectModel(
          title: 'Habito — Habit Tracking App',
          description:
              'A modern habit tracking application designed to help users build consistent habits.',
          imagePath: 'lib/resources/images/projects/habitto.jpeg',
          screenshotPaths: [],
          technologies: ['Flutter', 'Dart', 'Firebase', 'Provider', 'MVVM'],
          githubUrl: 'https://github.com/SaadKhani/FYP-Habbito_appication.git',
        ),

        ProjectModel(
          title: 'E-Commerce Application',
          description:
              'A complete Flutter e-commerce application featuring product '
              'browsing, categories, cart management, authentication, and '
              'a responsive user interface.',
          imagePath: 'lib/resources/images/projects/habbito.jpeg',
          technologies: ['Flutter', 'Dart', 'Firebase', 'REST API', 'Provider'],
          githubUrl: 'https://github.com/SaadKhani/FYP-Habbito_appication.git',
          liveUrl: null,
          details: [
            ProjectDetail(
              title: 'Architecture',
              content: 'MVVM + Repository Pattern',
              icon: Icons.architecture_rounded,
            ),
            ProjectDetail(
              title: 'Authentication',
              content: 'Firebase Authentication',
              icon: Icons.lock_outline_rounded,
            ),
            ProjectDetail(
              title: 'State Management',
              content: 'Provider',
              icon: Icons.account_tree_outlined,
            ),
          ],
        ),

        ProjectModel(
          title: 'Campus Mess Application',
          description:
              'A mobile application designed to simplify hostel and mess '
              'management by connecting students with mess services and '
              'providing a convenient digital experience.',
          imagePath: 'lib/resources/images/projects/habbito.jpeg',
          technologies: ['Flutter', 'Dart', 'Firebase', 'REST API'],
          githubUrl: 'https://github.com/SaadKhani/FYP-Habbito_appication.git',
          liveUrl: null,
          details: [
            ProjectDetail(
              title: 'Platform',
              content: 'Android + Flutter',
              icon: Icons.phone_android_rounded,
            ),
            ProjectDetail(
              title: 'Backend',
              content: 'REST API + Firebase',
              icon: Icons.cloud_outlined,
            ),
          ],
        ),
      ],
    ),

    // ─────────────────────────────────────────────
    // BACKEND & APIs
    // ─────────────────────────────────────────────
    ProjectCategory(
      title: 'Backend & APIs',
      subtitle: 'Backend systems, REST APIs and server-side applications.',
      projects: [
        ProjectModel(
          title: 'Task Manager REST API',
          description:
              'A RESTful backend for managing users and tasks with '
              'authentication, authorization, task ownership, and protected '
              'API endpoints.',
          imagePath: 'lib/resources/images/projects/habbito.jpeg',
          technologies: [
            'Node.js',
            'Express.js',
            'MongoDB',
            'Mongoose',
            'JWT',
            'REST API',
          ],
          githubUrl: 'https://github.com/SaadKhani/FYP-Habbito_appication.git',
          liveUrl: null,
          details: [
            ProjectDetail(
              title: 'Authentication',
              content: 'JWT Authentication',
              icon: Icons.security_rounded,
            ),
            ProjectDetail(
              title: 'Database',
              content: 'MongoDB + Mongoose',
              icon: Icons.storage_rounded,
            ),
            ProjectDetail(
              title: 'API',
              content: 'RESTful API',
              icon: Icons.api_rounded,
            ),
          ],
        ),

        ProjectModel(
          title: 'Hostel & Mess Management Backend',
          description:
              'A backend system for managing hostel blocks, students, '
              'mess services, orders, and related operations through a '
              'structured REST API.',
          imagePath: 'lib/resources/images/projects/habbito.jpeg',
          technologies: [
            'Node.js',
            'Express.js',
            'MongoDB',
            'Mongoose',
            'REST API',
          ],
          githubUrl: 'https://github.com/SaadKhani/FYP-Habbito_appication.git',
          liveUrl: null,
          details: [
            ProjectDetail(
              title: 'Database',
              content: 'MongoDB Atlas',
              icon: Icons.storage_rounded,
            ),
            ProjectDetail(
              title: 'Architecture',
              content: 'Feature-based backend architecture',
              icon: Icons.architecture_rounded,
            ),
            ProjectDetail(
              title: 'API',
              content: 'Express.js REST API',
              icon: Icons.api_rounded,
            ),
          ],
        ),

        ProjectModel(
          title: 'CRUD API Service',
          description:
              'A beginner-friendly backend application demonstrating '
              'complete CRUD operations, API routing, database interaction, '
              'and request handling with Node.js.',
          imagePath: 'lib/resources/images/projects/habbito.jpeg',
          technologies: ['Node.js', 'Express.js', 'MongoDB', 'REST API'],
          githubUrl: 'https://github.com/SaadKhani/FYP-Habbito_appication.git',
          liveUrl: null,
          details: [
            ProjectDetail(
              title: 'Operations',
              content: 'Create, Read, Update and Delete',
              icon: Icons.sync_alt_rounded,
            ),
            ProjectDetail(
              title: 'API',
              content: 'REST API',
              icon: Icons.api_rounded,
            ),
          ],
        ),
      ],
    ),

    // ─────────────────────────────────────────────
    // MACHINE LEARNING
    // ─────────────────────────────────────────────
    ProjectCategory(
      title: 'Machine Learning',
      subtitle:
          'Machine learning projects focused on prediction, classification and data analysis.',
      projects: [
        ProjectModel(
          title: 'House Price Prediction',
          description:
              'A machine learning model that predicts house prices based '
              'on property-related features. The project covers data '
              'preprocessing, model training, evaluation, and prediction.',
          imagePath: 'lib/resources/images/projects/habbito.jpeg',
          technologies: [
            'Python',
            'NumPy',
            'Pandas',
            'Matplotlib',
            'Scikit-learn',
            'Linear Regression',
          ],
          githubUrl: 'https://github.com/SaadKhani/FYP-Habbito_appication.git',
          liveUrl: null,
          details: [
            ProjectDetail(
              title: 'Problem Type',
              content: 'Regression',
              icon: Icons.analytics_outlined,
            ),
            ProjectDetail(
              title: 'Model',
              content: 'Linear Regression',
              icon: Icons.auto_graph_rounded,
            ),
            ProjectDetail(
              title: 'Evaluation',
              content: 'MAE + R² Score',
              icon: Icons.assessment_outlined,
            ),
          ],
        ),

        ProjectModel(
          title: 'Heart Disease Prediction',
          description:
              'A machine learning classification project that analyzes '
              'patient-related features and predicts the likelihood of '
              'heart disease.',
          imagePath: 'lib/resources/images/projects/habbito.jpeg',
          technologies: [
            'Python',
            'Pandas',
            'NumPy',
            'Scikit-learn',
            'Classification',
          ],
          githubUrl: 'https://github.com/SaadKhani/FYP-Habbito_appication.git',
          liveUrl: null,
          details: [
            ProjectDetail(
              title: 'Problem Type',
              content: 'Binary Classification',
              icon: Icons.category_outlined,
            ),
            ProjectDetail(
              title: 'Model',
              content: 'Machine Learning Classifier',
              icon: Icons.model_training_rounded,
            ),
            ProjectDetail(
              title: 'Evaluation',
              content: 'Accuracy + Classification Report',
              icon: Icons.assessment_outlined,
            ),
          ],
        ),

        ProjectModel(
          title: 'Customer Churn Prediction',
          description:
              'A predictive machine learning project designed to identify '
              'customers who may be likely to leave a service based on '
              'historical customer data.',
          imagePath: 'lib/resources/images/projects/habbito.jpeg',
          technologies: [
            'Python',
            'Pandas',
            'NumPy',
            'Scikit-learn',
            'Data Visualization',
          ],
          githubUrl: 'https://github.com/SaadKhani/FYP-Habbito_appication.git',
          liveUrl: null,
          details: [
            ProjectDetail(
              title: 'Problem Type',
              content: 'Classification',
              icon: Icons.category_outlined,
            ),
            ProjectDetail(
              title: 'Workflow',
              content: 'Preprocessing → Training → Evaluation',
              icon: Icons.account_tree_outlined,
            ),
          ],
        ),
      ],
    ),

    // ─────────────────────────────────────────────
    // DEEP LEARNING
    // ─────────────────────────────────────────────
    ProjectCategory(
      title: 'Deep Learning',
      subtitle:
          'Deep learning and computer vision applications using neural networks.',
      projects: [
        ProjectModel(
          title: 'SkinScan AI',
          description:
              'An AI-powered skin lesion analysis application that uses '
              'deep learning and computer vision to analyze skin images '
              'and provide an estimated risk classification.',
          imagePath: 'lib/resources/images/projects/habbito.jpeg',
          technologies: [
            'Python',
            'TensorFlow',
            'Keras',
            'EfficientNetB0',
            'Computer Vision',
            'FastAPI',
            'Flutter',
          ],
          githubUrl: 'https://github.com/SaadKhani/FYP-Habbito_appication.git',
          liveUrl: null,
          details: [
            ProjectDetail(
              title: 'Model',
              content: 'EfficientNetB0',
              icon: Icons.psychology_outlined,
            ),
            ProjectDetail(
              title: 'Backend',
              content: 'FastAPI',
              icon: Icons.api_rounded,
            ),
            ProjectDetail(
              title: 'Computer Vision',
              content: 'Image classification',
              icon: Icons.image_search_rounded,
            ),
          ],
        ),

        ProjectModel(
          title: 'Image Classification System',
          description:
              'A deep learning image classification project exploring '
              'convolutional neural networks, image preprocessing, '
              'training, validation, and model evaluation.',
          imagePath: 'lib/resources/images/projects/habbito.jpeg',
          technologies: [
            'Python',
            'TensorFlow',
            'Keras',
            'CNN',
            'Computer Vision',
          ],
          githubUrl: 'https://github.com/SaadKhani/FYP-Habbito_appication.git',
          liveUrl: null,
          details: [
            ProjectDetail(
              title: 'Model',
              content: 'Convolutional Neural Network',
              icon: Icons.psychology_outlined,
            ),
            ProjectDetail(
              title: 'Domain',
              content: 'Computer Vision',
              icon: Icons.visibility_outlined,
            ),
          ],
        ),
      ],
    ),
  ];
}

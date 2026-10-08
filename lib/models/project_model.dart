import 'package:flutter/material.dart';

class ProjectCategory {
  final String title;
  final String subtitle;
  final List<ProjectModel> projects;

  const ProjectCategory({
    required this.title,
    required this.subtitle,
    required this.projects,
  });
}

class ProjectModel {
  final String title;
  final String description;
  final String? imagePath;

  final List<String> screenshotPaths;

  final List<String> technologies;

  final String? githubUrl;
  final String? liveUrl;

  final List<ProjectDetail> details;
  final String? videoPath;

  const ProjectModel({
    required this.title,
    required this.description,
    this.imagePath,
    this.screenshotPaths = const [],
    this.technologies = const [],
    this.githubUrl,
    this.liveUrl,
    this.details = const [],
    this.videoPath,
  });
}

class ProjectDetail {
  final String title;
  final String content;
  final IconData? icon;

  const ProjectDetail({required this.title, required this.content, this.icon});
}

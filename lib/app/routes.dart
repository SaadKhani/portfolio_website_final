import 'package:flutter/material.dart';
import 'package:portfolio_website/views/about/about_view.dart';
import 'package:portfolio_website/views/certifications/certifications_view.dart';
import 'package:portfolio_website/views/contact/contact_view.dart';
import 'package:portfolio_website/views/education/education_view.dart';
import 'package:portfolio_website/views/experience/experience_view.dart';
import '../views/home/portfolio_home_view.dart';
import 'package:portfolio_website/views/projects/projects_view.dart';
import 'package:portfolio_website/views/services/services_view.dart';
import 'package:portfolio_website/views/skills/skills_view.dart';

class AppRoutes {
  static const String home = '/';
  static const String about = '/about';
  static const String skills = '/skills';
  static const String experience = '/experience';
  static const String projects = '/projects';
  static const String education = '/education';
  static const String certifications = '/certifications';
  static const String services = '/services';
  static const String contact = '/contact';

  static final Map<String, WidgetBuilder> routes = {
    home: (context) => const PortfolioHomeView(),
    about: (context) => const AboutView(),
    skills: (context) => const SkillsView(),
    experience: (context) => const ExperienceView(),
    projects: (context) => const ProjectsView(),
    education: (context) => const EducationView(),
    certifications: (context) => const CertificationsView(),
    services: (context) => const ServicesView(),
    contact: (context) => const ContactView(),
  };
}

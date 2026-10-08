import 'package:flutter/material.dart';

import '../../widgets/home/hero_background.dart';
import '../../widgets/home/hero_section.dart';
import '../../widgets/navigation/navbar.dart';

import '../about/about_view.dart';
import '../skills/skills_view.dart';
import '../experience/experience_view.dart';
import '../projects/projects_view.dart';
import '../education/education_view.dart';
import '../certifications/certifications_view.dart';
import '../services/services_view.dart';
import '../contact/contact_view.dart';

class PortfolioHomeView extends StatefulWidget {
  const PortfolioHomeView({super.key});

  @override
  State<PortfolioHomeView> createState() => _PortfolioHomeViewState();
}

class _PortfolioHomeViewState extends State<PortfolioHomeView> {
  final ScrollController _scrollController = ScrollController();

  final GlobalKey homeKey = GlobalKey();
  final GlobalKey aboutKey = GlobalKey();
  final GlobalKey skillsKey = GlobalKey();
  final GlobalKey experienceKey = GlobalKey();
  final GlobalKey projectsKey = GlobalKey();
  final GlobalKey educationKey = GlobalKey();
  final GlobalKey certificationsKey = GlobalKey();
  final GlobalKey servicesKey = GlobalKey();
  final GlobalKey contactKey = GlobalKey();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void scrollToSection(GlobalKey key) {
    final context = key.currentContext;

    if (context == null) {
      return;
    }

    Scrollable.ensureVisible(
      context,
      duration: const Duration(milliseconds: 800),
      curve: Curves.easeInOutCubic,
      alignment: 0.05,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const Positioned.fill(child: HeroBackground()),

          SafeArea(
            child: Column(
              children: [
                Navbar(
                  onHomeTap: () => scrollToSection(homeKey),
                  onAboutTap: () => scrollToSection(aboutKey),
                  onSkillsTap: () => scrollToSection(skillsKey),
                  onExperienceTap: () => scrollToSection(experienceKey),
                  onProjectsTap: () => scrollToSection(projectsKey),
                  // onEducationTap: () => scrollToSection(educationKey),
                  // onCertificationsTap: () =>
                  //     scrollToSection(certificationsKey),
                  onServicesTap: () => scrollToSection(servicesKey),
                  onContactTap: () => scrollToSection(contactKey),
                ),

                Expanded(
                  child: SingleChildScrollView(
                    controller: _scrollController,
                    child: Column(
                      children: [
                        Container(key: homeKey, child: const HeroSection()),

                        Container(key: aboutKey, child: const AboutView()),

                        Container(key: skillsKey, child: const SkillsView()),

                        Container(
                          key: experienceKey,
                          child: const ExperienceView(),
                        ),

                        Container(
                          key: projectsKey,
                          child: const ProjectsView(),
                        ),

                        Container(
                          key: educationKey,
                          child: const EducationView(),
                        ),

                        // Container(
                        //   key: certificationsKey,
                        //   child: const CertificationsView(),
                        // ),
                        Container(
                          key: servicesKey,
                          child: const ServicesView(),
                        ),

                        Container(key: contactKey, child: const ContactView()),

                        const SizedBox(height: 100),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../../widgets/home/hero_background.dart';
import '../../widgets/home/hero_section.dart';
import '../../widgets/navigation/navbar.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const Positioned.fill(child: HeroBackground()),

          SafeArea(
            child: Column(
              children: [
                const Navbar(),

                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const HeroSection(),

                        // Future sections will be added here.
                        const SizedBox(height: 120),
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

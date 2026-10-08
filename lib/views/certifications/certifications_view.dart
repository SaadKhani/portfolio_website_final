import 'package:flutter/material.dart';

class CertificationsView extends StatelessWidget {
  const CertificationsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 600,
      child: Center(
        child: Text(
          'Certifications Section',
          style: TextStyle(fontSize: 32, color: Colors.white),
        ),
      ),
    );
  }
}

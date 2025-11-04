import 'package:flutter/material.dart';
import '../widgets/home/home_app_bar.dart';
import '../widgets/home/search_section.dart';
import '../widgets/home/quick_actions_section.dart';
import '../widgets/home/specialities_section.dart';
import '../widgets/home/specialists_section.dart';
import 'doctor_details_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void _handleActionTap(String actionTitle, BuildContext context) {
    if (actionTitle == 'Book Appointment') {
      Navigator.of(
        context,
      ).push(MaterialPageRoute(builder: (_) => const DoctorDetailsPage()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F7F7),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HomeAppBar(),
              const SizedBox(height: 24),
              const SearchSection(),
              const SizedBox(height: 24),
              QuickActionsSection(
                onActionTap: (actionTitle) =>
                    _handleActionTap(actionTitle, context),
              ),
              const SizedBox(height: 24),
              const SpecialitiesSection(),
              const SizedBox(height: 24),
              const SpecialistsSection(),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}

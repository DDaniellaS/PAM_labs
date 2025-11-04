import 'package:flutter/material.dart';
import '../widgets/shared/custom_app_bar.dart';
import '../widgets/doctor_details/doctor_info_section.dart';
import '../widgets/doctor_details/stats_section.dart';
import '../widgets/doctor_details/tabs_section.dart';
import '../widgets/doctor_details/appointment_card.dart';
import '../widgets/doctor_details/timing_section.dart';
import '../widgets/doctor_details/location_section.dart';

class DoctorDetailsPage extends StatelessWidget {
  const DoctorDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F7F7),
      appBar: const CustomAppBar(title: 'Cardiologist'),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            DoctorInfoSection(),
            SizedBox(height: 20),
            StatsSection(),
            SizedBox(height: 20),
            TabsSection(),
            SizedBox(height: 20),
            AppointmentCard(),
            SizedBox(height: 24),
            TimingSection(),
            SizedBox(height: 24),
            LocationSection(),
            SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}

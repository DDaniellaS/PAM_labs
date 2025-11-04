import 'package:flutter/material.dart';
import 'date_chip.dart';
import 'time_chip.dart';

class AppointmentCard extends StatelessWidget {
  const AppointmentCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            // ignore: deprecated_member_use
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
              color: Color(0xFFE6F7F7),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'In-Clinic Appointment',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                Text(
                  '\$1,000',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.teal,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHospitalInfo(),
                const SizedBox(height: 16),
                _buildDateSelection(),
                const SizedBox(height: 16),
                _buildTimeSlots(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHospitalInfo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Evercare Hospital Ltd.',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
              ),
              SizedBox(height: 4),
              Text(
                'Boshundhora, Dhaka',
                style: TextStyle(color: Colors.grey, fontSize: 13),
              ),
              SizedBox(height: 2),
              Text(
                '20 mins or less wait time',
                style: TextStyle(color: Colors.grey, fontSize: 12),
              ),
            ],
          ),
        ),
        const Text(
          '2 More clinics',
          style: TextStyle(color: Colors.teal, fontSize: 13),
        ),
      ],
    );
  }

  Widget _buildDateSelection() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: const [
          DateChip(label: 'Today', slot: 'No Slot', selected: false),
          DateChip(label: 'Tomorrow', slot: '20 Slot', selected: true),
          DateChip(label: '17 Oct', slot: '15 Slot', selected: false),
        ],
      ),
    );
  }

  Widget _buildTimeSlots() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: const [
          TimeChip(label: '06:00 - 06:30', selected: true),
          TimeChip(label: '06:30 - 07:00', selected: false),
          TimeChip(label: '07:00 - 07:30', selected: false),
        ],
      ),
    );
  }
}

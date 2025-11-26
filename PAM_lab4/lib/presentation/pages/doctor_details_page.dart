import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/doctor_controller.dart';

class DoctorDetailsPage extends StatelessWidget {
  const DoctorDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final DoctorController controller = Get.find<DoctorController>();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Cardiologist',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Get.back(),
        ),
      ),
      body: SafeArea(
        child: Obx(() {
          if (!controller.isLoaded.value) {
            return const Center(child: CircularProgressIndicator());
          }

          final doctor = controller.doctor.value;
          if (doctor == null) {
            return const Center(child: Text('Error loading doctor data'));
          }

          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            physics: const BouncingScrollPhysics(),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _doctorInfo(doctor),
                const SizedBox(height: 16),
                _stats(controller),
                const SizedBox(height: 16),
                _tabs(controller),
                const SizedBox(height: 16),
                _appointmentHospitalSection(controller),
                const SizedBox(height: 16),
                _timing(controller),
                const SizedBox(height: 16),
                _locations(controller),
                const SizedBox(height: 30),
              ],
            ),
          );
        }),
      ),
    );
  }

  // -------------------------------
  // Doctor Info Section
  // -------------------------------
  Widget _doctorInfo(doctor) => Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      CircleAvatar(radius: 45, backgroundImage: NetworkImage(doctor.imageUrl)),
      const SizedBox(width: 16),
      Expanded(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              doctor.name,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            Text(
              doctor.speciality,
              style: const TextStyle(
                color: Colors.teal,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              doctor.qualification,
              style: const TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
    ],
  );

  // -------------------------------
  // Stats Section
  // -------------------------------
  Widget _stats(DoctorController c) => Container(
    padding: const EdgeInsets.all(16),
    decoration: _boxDecoration(),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _stat(Icons.star, '${c.doctor.value!.rating}', 'Rating & Review', Colors.amber),
        _divider(),
        _stat(Icons.calendar_today, '${c.doctor.value!.yearsOfExperience}', 'Years of work', Colors.teal),
        _divider(),
        _stat(Icons.people, '${c.doctor.value!.numberOfPatients}', 'No. of patients', Colors.teal),
      ],
    ),
  );

  // -------------------------------
  // Tabs Section
  // -------------------------------
  Widget _tabs(DoctorController c) => Container(
    padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 6),
    decoration: BoxDecoration(
      color: Colors.grey.shade200,
      borderRadius: BorderRadius.circular(10),
      border: Border.all(color: Colors.grey.shade300, width: 0.5),
    ),
    child: Row(
      children: c.tabs.map((t) {
        final selected = t == c.tabs.first;
        return Expanded(
          child: Container(
            height: 36,
            decoration: BoxDecoration(
              color: selected ? Colors.white : Colors.transparent,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: selected ? Colors.teal : Colors.transparent,
                width: 0.5,
              ),
            ),
            child: Center(
              child: Text(
                t,
                style: TextStyle(
                  color: selected ? Colors.teal : Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        );
      }).toList(),
    ),
  );

  // -------------------------------
  // Appointment & Hospital Section
  // -------------------------------
  Widget _appointmentHospitalSection(DoctorController c) => Container(
    padding: const EdgeInsets.all(16),
    decoration: _boxDecoration(),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'In-Clinic Appointment',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              '৳${c.consultationFee.value}',
              style: const TextStyle(
                fontSize: 20,
                color: Colors.teal,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              c.hospitalName.value,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 4),
            Text(
              c.hospitalLocation.value,
              style: const TextStyle(color: Colors.grey, fontSize: 14),
            ),
            Text(
              '${c.waitTime.value} wait time',
              style: const TextStyle(color: Colors.grey, fontSize: 12),
            ),
            if (c.moreClinics.isNotEmpty) ...[
              const SizedBox(height: 8),
              Text(
                '${c.moreClinics.length} More clinic',
                style: const TextStyle(
                  color: Colors.teal,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ],
        ),
        const SizedBox(height: 16),
        const Divider(thickness: 0.5, color: Colors.grey),
        const SizedBox(height: 8),

        // Horizontal day list
        SizedBox(
          height: 75,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            itemCount: c.availableDays.length,
            itemBuilder: (_, i) {
              final day = c.availableDays[i];
              final dayName = day['day'].toString();
              final slots = (day['slots'] as List).cast<String>();
              final slotCount = slots.length;

              return Container(
                margin: const EdgeInsets.only(right: 20),
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      dayName,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      slotCount == 0
                          ? 'No Slot'
                          : '$slotCount Slot${slotCount > 1 ? 's' : ''}',
                      style: TextStyle(
                        color: slotCount == 0 ? Colors.grey : Colors.teal,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),

        const SizedBox(height: 8),
        Container(
          height: 3,
          decoration: BoxDecoration(color: Colors.grey.shade300),
          child: Stack(
            children: [
              Positioned(
                left: 0,
                width: 60,
                child: Container(height: 3, color: Colors.teal),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),

        _buildTimeSlotsCarousel(c),
      ],
    ),
  );

  // -------------------------------
  // Time Slots Section
  // -------------------------------
  Widget _buildTimeSlotsCarousel(DoctorController c) {
    Map<String, dynamic>? selectedDay;
    for (var day in c.availableDays) {
      final slots = (day['slots'] as List).cast<String>();
      if (slots.isNotEmpty) {
        selectedDay = day;
        break;
      }
    }

    selectedDay ??= c.availableDays.isNotEmpty ? c.availableDays[0] : null;

    if (selectedDay == null) {
      return const Text('No available slots');
    }

    final slots = (selectedDay['slots'] as List).cast<String>();

    if (slots.isEmpty) {
      return const Text(
        'No slots available for selected day',
        style: TextStyle(color: Colors.grey, fontSize: 14),
      );
    }

    return SizedBox(
      height: 50,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        itemCount: slots.length,
        itemBuilder: (_, i) {
          return Container(
            margin: const EdgeInsets.only(right: 12),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            decoration: BoxDecoration(
              color: Colors.teal.shade50,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.teal.shade300, width: 0.5),
            ),
            child: Text(
              slots[i],
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16,
                color: Colors.teal,
              ),
            ),
          );
        },
      ),
    );
  }

  // -------------------------------
  // Timing Section
  // -------------------------------
  Widget _timing(DoctorController c) => Column(
    mainAxisSize: MainAxisSize.min,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Text(
        'Timing',
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
      ),
      const SizedBox(height: 16),
      SizedBox(
        height: 100,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          clipBehavior: Clip.none,
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          itemCount: c.timings.length,
          itemBuilder: (_, i) {
            final t = c.timings[i];
            return Container(
              width: 140,
              margin: const EdgeInsets.only(right: 12),
              padding: const EdgeInsets.all(12),
              decoration: _boxDecoration(),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    t['day']!,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    t['time']!,
                    style: const TextStyle(color: Colors.grey, fontSize: 14),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    ],
  );

  // -------------------------------
  // Location Section
  // -------------------------------
  Widget _locations(DoctorController c) => Column(
    mainAxisSize: MainAxisSize.min,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Text(
        'Location',
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
      ),
      const SizedBox(height: 16),
      SizedBox(
        height: 70,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          itemCount: c.locations.length,
          itemBuilder: (_, i) {
            final loc = c.locations[i];
            return Container(
              width: 160,
              margin: const EdgeInsets.only(right: 12),
              padding: const EdgeInsets.all(12),
              decoration: _boxDecoration(),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    loc['title']!,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    loc['subtitle']!,
                    style: const TextStyle(color: Colors.grey, fontSize: 12),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    ],
  );

  // -------------------------------
  // Shared Helpers
  // -------------------------------
  BoxDecoration _boxDecoration() => BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(12),
    boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.1),
        blurRadius: 8,
        offset: const Offset(0, 2),
      ),
    ],
    border: Border.all(color: Colors.grey.shade300, width: 0.5),
  );

  Widget _stat(IconData i, String v, String l, Color c) => Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      Icon(i, color: c, size: 20),
      const SizedBox(width: 6),
      Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            v,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
          ),
          Text(l, style: const TextStyle(color: Colors.grey, fontSize: 11)),
        ],
      ),
    ],
  );

  Widget _divider() => Container(width: 1, height: 30, color: Colors.grey.shade300);
}

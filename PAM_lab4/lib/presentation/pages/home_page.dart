import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';
import '../widgets/shared/custom_network_image.dart';
import '../widgets/home/search_section.dart';
import 'doctor_details_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void _onActionTap(String title) {
    if (title == 'Book Appointment') {
      Get.to(() => const DoctorDetailsPage());
    }
  }

  @override
  Widget build(BuildContext context) {
    final homeController = Get.find<HomeController>();

    return Scaffold(
      backgroundColor: const Color(0xFFF7F7F7),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                // App Bar
                _buildAppBar(homeController),
                const SizedBox(height: 20),

                // Search Section
                const SearchSection(),
                const SizedBox(height: 20),

                // Quick Actions
                _buildQuickActions(homeController),
                const SizedBox(height: 25),

                // Specialities
                _buildSpecialities(homeController),
                const SizedBox(height: 25),

                // Specialists
                _buildSpecialists(homeController),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAppBar(HomeController controller) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Obx(
              () => CircleAvatar(
                radius: 24,
                backgroundImage: NetworkImage(controller.profileImage.value),
              ),
            ),
            const SizedBox(width: 12),
            Obx(
              () => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    controller.userName.value,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    controller.userLocation.value,
                    style: const TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                ],
              ),
            ),
          ],
        ),
        IconButton(
          icon: const Icon(Icons.notifications_none, size: 28),
          onPressed: () {},
        ),
      ],
    );
  }

  Widget _buildQuickActions(HomeController controller) {
    return Obx(() {
      if (controller.actions.isEmpty) {
        return const CircularProgressIndicator();
      }

      return Column(
        children: [
          Row(
            children: controller.actions.take(2).map((action) {
              return Expanded(
                child: GestureDetector(
                  onTap: () => _onActionTap(action.title),
                  child: Container(
                    margin: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          // ignore: deprecated_member_use
                          color: Colors.grey.withOpacity(0.1),
                          blurRadius: 6,
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 80,
                          child: CustomNetworkImage(imageUrl: action.image),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: Text(
                            action.title,
                            textAlign: TextAlign.center,
                            style: const TextStyle(fontSize: 14),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
          const SizedBox(height: 8),
          Row(
            children: controller.actions.skip(2).take(3).map((action) {
              return Expanded(
                child: GestureDetector(
                  onTap: () => _onActionTap(action.title),
                  child: Container(
                    margin: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          // ignore: deprecated_member_use
                          color: Colors.grey.withOpacity(0.1),
                          blurRadius: 6,
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 80,
                          child: CustomNetworkImage(imageUrl: action.image),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: Text(
                            action.title,
                            textAlign: TextAlign.center,
                            style: const TextStyle(fontSize: 13),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      );
    });
  }

  Widget _buildSpecialities(HomeController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Specialities',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        const SizedBox(height: 10),
        Obx(() {
          if (controller.specialities.isEmpty) {
            return const CircularProgressIndicator();
          }

          return SizedBox(
            height: 90,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: controller.specialities.length,
              separatorBuilder: (_, __) => const SizedBox(width: 20),
              itemBuilder: (_, index) {
                final speciality = controller.specialities[index];
                return Column(
                  children: [
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        color: Colors.teal.shade50,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: Image.network(
                          speciality.iconName,
                          fit: BoxFit.cover,
                          errorBuilder: (_, __, ___) => const Icon(
                            Icons.medical_services,
                            color: Colors.teal,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      speciality.label,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 12),
                    ),
                  ],
                );
              },
            ),
          );
        }),
      ],
    );
  }

  Widget _buildSpecialists(HomeController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Specialists',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        const SizedBox(height: 12),
        Obx(() {
          if (controller.specialists.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }

          return SizedBox(
            height: 200,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: controller.specialists.length,
              separatorBuilder: (_, __) => const SizedBox(width: 16),
              itemBuilder: (_, index) {
                final specialist = controller.specialists[index];
                return Container(
                  width: 160,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        // ignore: deprecated_member_use
                        color: Colors.grey.withOpacity(0.1),
                        blurRadius: 8,
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: CustomNetworkImage(
                          imageUrl: specialist.image,
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(16),
                            topRight: Radius.circular(16),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          specialist.name,
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          );
        }),
      ],
    );
  }
}

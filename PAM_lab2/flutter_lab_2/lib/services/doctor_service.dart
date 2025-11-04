import '../models/doctor_model.dart';

class DoctorService {
  static Doctor getSampleDoctor() {
    return Doctor(
      id: '1',
      name: 'Dr. Emma Kathrin',
      specialty: 'Cardiologist',
      qualification: 'MBBS',
      imageUrl:
          'https://pic.rutubelist.ru/user/00/00/a538f80ca3c4a32f33cbbc0048347de1_78.jpg',
      rating: 4.3,
      yearsOfExperience: 14,
      numberOfPatients: 125,
      consultationFee: 1000.0,
      clinics: [
        Clinic(
          name: 'Evercare Hospital Ltd.',
          address: 'Boshundhora, Dhaka',
          waitTime: '20 mins or less',
          availability: [
            Availability(
              date: DateTime.now().add(const Duration(days: 1)),
              slots: '20 Slot',
              timeSlots: ['06:00 - 06:30', '06:30 - 07:00', '07:00 - 07:30'],
            ),
          ],
        ),
      ],
      schedule: [
        WorkingDay(day: 'Monday', time: '09:00 AM - 05:00 PM'),
        WorkingDay(day: 'Tuesday', time: '09:00 AM - 05:00 PM'),
        WorkingDay(day: 'Wednesday', time: '09:00 AM - 05:00 PM'),
        WorkingDay(day: 'Thursday', time: '09:00 AM - 05:00 PM'),
        WorkingDay(day: 'Friday', time: '09:00 AM - 05:00 PM'),
        WorkingDay(day: 'Saturday', time: '10:00 AM - 02:00 PM'),
        WorkingDay(day: 'Sunday', time: 'Closed'),
      ],
      reviews: [],
    );
  }
}

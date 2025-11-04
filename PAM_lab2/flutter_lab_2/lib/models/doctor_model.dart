class Doctor {
  final String id;
  final String name;
  final String specialty;
  final String qualification;
  final String imageUrl;
  final double rating;
  final int yearsOfExperience;
  final int numberOfPatients;
  final double consultationFee;
  final List<Clinic> clinics;
  final List<WorkingDay> schedule;
  final List<Review> reviews;

  Doctor({
    required this.id,
    required this.name,
    required this.specialty,
    required this.qualification,
    required this.imageUrl,
    required this.rating,
    required this.yearsOfExperience,
    required this.numberOfPatients,
    required this.consultationFee,
    required this.clinics,
    required this.schedule,
    required this.reviews,
  });
}

class Clinic {
  final String name;
  final String address;
  final String waitTime;
  final List<Availability> availability;

  Clinic({
    required this.name,
    required this.address,
    required this.waitTime,
    required this.availability,
  });
}

class Availability {
  final DateTime date;
  final String slots;
  final List<String> timeSlots;

  Availability({
    required this.date,
    required this.slots,
    required this.timeSlots,
  });
}

class WorkingDay {
  final String day;
  final String time;

  WorkingDay({required this.day, required this.time});
}

class Review {
  final String patientName;
  final double rating;
  final String comment;
  final DateTime date;

  Review({
    required this.patientName,
    required this.rating,
    required this.comment,
    required this.date,
  });
}

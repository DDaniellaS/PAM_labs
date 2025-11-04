import 'package:flutter/material.dart';
import '../models/quick_action.dart';
import '../models/speciality.dart';
import '../models/specialist.dart';

class HomeDataService {
  static List<QuickAction> getQuickActions() {
    return [
      QuickAction(
        title: 'Book Appointment',
        image:
            'https://www.astridverlag.com/wp-content/uploads/2022/08/burst2-scaled.jpg',
      ),
      QuickAction(
        title: 'Instant Video Consult',
        image:
            'https://prod-img.noordhollandsdagblad.nl/public/incoming/mszecs-351fd1e6-bd91-11ed-8ce6-0218eaf05005.jpg/alternates/BASE_SIXTEEN_NINE/351fd1e6-bd91-11ed-8ce6-0218eaf05005.jpg',
      ),
      QuickAction(
        title: 'Medicines',
        image:
            'https://static1.cbrimages.com/wordpress/wp-content/uploads/2021/10/medication.jpg',
      ),
      QuickAction(
        title: 'Lab Tests',
        image:
            'https://cdn-images-1.medium.com/v2/resize:fill:1600:480/gravity:fp:0.5:0.4/format:jpg/1*AY2ip8Q17b7qqcnW0sTSFw.jpeg',
      ),
      QuickAction(
        title: 'Emergency',
        image:
            'https://i.ytimg.com/vi/FzVTO9TEnfg/maxresdefault.jpg?sqp=-oaymwEmCIAKENAF8quKqQMa8AEB-AH-CYAC0AWKAgwIABABGH8gEygUMA8=&amp;rs=AOn4CLBb-QEuaR44xH70ho_YVhlNahG3KQ',
      ),
    ];
  }

  static List<Speciality> getSpecialities() {
    return [
      Speciality(icon: Icons.remove_red_eye, label: 'Eye Specialist'),
      Speciality(icon: Icons.medical_services, label: 'Dentist'),
      Speciality(icon: Icons.favorite, label: 'Cardiologist'),
      Speciality(icon: Icons.air, label: 'Pulmonologist'),
      Speciality(icon: Icons.psychology, label: 'Physician'),
    ];
  }

  static List<Specialist> getSpecialists() {
    return [
      Specialist(
        name: 'Dr. Emma Kathrin',
        image:
            'https://krayt.biz/upload/sites/519/dalton-ngangi-ZCztndOWdjs-unsplash_2x.jpg',
      ),
      Specialist(
        name: 'Dr. John Doe',
        image:
            'https://static.tildacdn.com/tild3962-6132-4164-a462-623531373163/usman-yousaf-pTrhfmj.jpg',
      ),
      Specialist(
        name: 'Dr. George Ray',
        image:
            'https://thumbs.dreamstime.com/z/smart-doctor-5645557.jpg?ct=jpeg',
      ),
      Specialist(
        name: 'Dr. Mark Smith',
        image:
            'https://thumbs.dreamstime.com/z/portrait-middle-aged-male-doctor-11717229.jpg?ct=jpeg',
      ),
      Specialist(
        name: 'Dr. John Brown',
        image:
            'https://hips.hearstapps.com/hmg-prod/images/portrait-of-a-happy-young-doctor-in-his-clinic-royalty-free-image-1661432441.jpg?crop=0.66698xw:1xh;center,top&resize=1200:*',
      ),
    ];
  }
}

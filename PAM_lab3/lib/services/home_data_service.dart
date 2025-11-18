import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/app_models.dart';

class HomeDataService {
  static Future<Map<String, dynamic>> _loadData() async {
    final jsonString = await rootBundle.loadString('assets/data/app_data.json');
    return json.decode(jsonString);
  }

  static Future<List<QuickAction>> getQuickActions() async {
    final data = await _loadData();
    return (data['actions'] as List)
        .map((e) => QuickAction(title: e['title'], image: e['image']))
        .toList();
  }

  static Future<List<Speciality>> getSpecialities() async {
    final data = await _loadData();
    return (data['specialities'] as List)
        .map((e) => Speciality(label: e['label'], iconName: e['icon']))
        .toList();
  }

  static Future<List<Specialist>> getSpecialists() async {
    final data = await _loadData();
    return (data['specialists'] as List)
        .map((e) => Specialist(name: e['name'], image: e['image']))
        .toList();
  }
}

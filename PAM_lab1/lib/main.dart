import 'package:flutter/material.dart';

void main() {
  runApp(const CalorieCalculatorApp());
}

class CalorieCalculatorApp extends StatelessWidget {
  const CalorieCalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator Calorii',
      theme: ThemeData(primarySwatch: Colors.green),
      home: const CalorieHomePage(),
    );
  }
}

class CalorieHomePage extends StatefulWidget {
  const CalorieHomePage({super.key});

  @override
  _CalorieHomePageState createState() => _CalorieHomePageState();
}

class _CalorieHomePageState extends State<CalorieHomePage> {
  final TextEditingController _foodController = TextEditingController();
  final TextEditingController _calorieController = TextEditingController();

  final List<Map<String, dynamic>> _foods = [];
  int _totalCalories = 0;

  void _addFood() {
    final String food = _foodController.text.trim();
    final String calorieText = _calorieController.text.trim();

    if (food.isEmpty || calorieText.isEmpty) return;

    final int? calories = int.tryParse(calorieText);
    if (calories == null) return;

    setState(() {
      _foods.add({'food': food, 'calories': calories});
      _totalCalories += calories;
      _foodController.clear();
      _calorieController.clear();
    });
  }

  void _deleteFood(int index) {
    setState(() {
      _totalCalories -= _foods[index]['calories'] as int;
      _foods.removeAt(index);
    });
  }

  void _editFood(int index) {
    _foodController.text = _foods[index]['food'] as String;
    _calorieController.text = (_foods[index]['calories'] as int).toString();

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Editează aliment"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: _foodController,
              decoration: const InputDecoration(labelText: "Aliment"),
            ),
            TextField(
              controller: _calorieController,
              decoration: const InputDecoration(labelText: "Calorii"),
              keyboardType: TextInputType.number,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Anulează"),
          ),
          TextButton(
            onPressed: () {
              final String food = _foodController.text.trim();
              final String calorieText = _calorieController.text.trim();
              final int? calories = int.tryParse(calorieText);

              if (food.isNotEmpty && calories != null) {
                setState(() {
                  _foods[index] = {'food': food, 'calories': calories};
                  _totalCalories = _foods.fold<int>(
                    0,
                        (sum, item) => sum + (item['calories'] as int),
                  );
                });
              }
              Navigator.pop(context);
            },
            child: const Text("Salvează"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Calculator Calorii")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _foodController,
              decoration: const InputDecoration(
                labelText: "Aliment",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _calorieController,
              decoration: const InputDecoration(
                labelText: "Calorii per aliment",
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: _addFood,
              child: const Text("Adaugă"),
            ),
            const SizedBox(height: 20),
            Text(
              "Total calorii zilnice: $_totalCalories",
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const Divider(),
            Expanded(
              child: ListView.builder(
                itemCount: _foods.length,
                itemBuilder: (context, index) {
                  final item = _foods[index];
                  return ListTile(
                    title: Text(item['food'] as String),
                    subtitle: Text("${item['calories']} kcal"),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.edit, color: Colors.blue),
                          onPressed: () => _editFood(index),
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete, color: Colors.red),
                          onPressed: () => _deleteFood(index),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

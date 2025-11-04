import 'package:flutter/material.dart';
import 'tab_button.dart';

class TabsSection extends StatelessWidget {
  const TabsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Row(
        children: [
          Expanded(child: TabButton(label: 'Info', selected: true)),
          Container(width: 1, height: 40, color: Colors.grey.shade300),
          Expanded(child: TabButton(label: 'History', selected: false)),
          Container(width: 1, height: 40, color: Colors.grey.shade300),
          Expanded(child: TabButton(label: 'Review', selected: false)),
        ],
      ),
    );
  }
}

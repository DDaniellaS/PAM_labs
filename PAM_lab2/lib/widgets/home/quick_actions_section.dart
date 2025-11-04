import 'package:flutter/material.dart';
import 'quick_action_card.dart';
import '../../services/home_data_service.dart';

class QuickActionsSection extends StatelessWidget {
  final Function(String) onActionTap;

  const QuickActionsSection({super.key, required this.onActionTap});

  @override
  Widget build(BuildContext context) {
    final quickActions = HomeDataService.getQuickActions();

    return Column(
      children: [
        Row(
          children: quickActions.take(2).map((action) {
            return Expanded(
              child: QuickActionCard(
                action: action,
                height: 140,
                onTap: () => onActionTap(action.title),
              ),
            );
          }).toList(),
        ),
        const SizedBox(height: 12),
        Row(
          children: quickActions.skip(2).take(3).map((action) {
            return Expanded(
              child: QuickActionCard(
                action: action,
                height: 120,
                onTap: () => onActionTap(action.title),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}

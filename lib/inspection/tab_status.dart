// models/tab_model.dart
import 'package:flutter/material.dart';

enum TabStatus { active, pending, completed }

class CustomTab {
  final String title;
  final String icon;
  final TabStatus status;
  final int index;

  CustomTab({
    required this.title,
    required this.icon,
    required this.status,
    required this.index,
  });
}
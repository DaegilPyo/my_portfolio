import 'package:flutter/material.dart';

class TetbeeFunctionModel {
  final String header;
  final String title;
  final String description;
  final IconData? icon;
  final String? imagePath;
  final Widget detailWidget;
  final List<String> images;

  TetbeeFunctionModel({
    required this.description,
    required this.header,
    required this.title,
    required this.detailWidget,
    required this.images,
    this.icon,
    this.imagePath,
  });
}

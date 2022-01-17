import 'package:flutter/material.dart';

class SkOnboardingModel {
  String title;
  String description;
  Color titleColor;
  Color descripColor;
  String? imageAssetPath;
  String? imageFromUrl;

  SkOnboardingModel({
    required this.title,
    required this.description,
    this.imageAssetPath,
    this.imageFromUrl,
    required this.titleColor,
    required this.descripColor,
  });
}

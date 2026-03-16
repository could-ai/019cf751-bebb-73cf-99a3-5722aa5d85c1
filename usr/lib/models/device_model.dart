import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';

class DeviceModel {
  final String name;
  final Size size;
  final String platform;

  DeviceModel({
    required this.name,
    required this.size,
    required this.platform,
  });
}

class LanguageModel {
  final String name;
  final String code;

  LanguageModel({
    required this.name,
    required this.code,
  });
}
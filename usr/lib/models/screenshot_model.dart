class ScreenshotModel {
  final String id;
  final String deviceType;
  final String language;
  final String imagePath;

  ScreenshotModel({
    required this.id,
    required this.deviceType,
    required this.language,
    required this.imagePath,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'deviceType': deviceType,
      'language': language,
      'imagePath': imagePath,
    };
  }

  factory ScreenshotModel.fromJson(Map<String, dynamic> json) {
    return ScreenshotModel(
      id: json['id'],
      deviceType: json['deviceType'],
      language: json['language'],
      imagePath: json['imagePath'],
    );
  }
}
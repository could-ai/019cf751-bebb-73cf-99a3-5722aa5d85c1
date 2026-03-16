import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'dart:typed_data';

class UploadScreen extends StatefulWidget {
  const UploadScreen({super.key});

  @override
  State<UploadScreen> createState() => _UploadScreenState();
}

class _UploadScreenState extends State<UploadScreen> {
  final ImagePicker _picker = ImagePicker();
  List<XFile>? _images;
  List<Uint8List>? _webImages;

  Future<void> _pickImages() async {
    final List<XFile> images = await _picker.pickMultiImage();
    if (images.isNotEmpty) {
      setState(() {
        _images = images;
        if (kIsWeb) {
          _loadWebImages(images);
        }
      });
    }
  }

  Future<void> _loadWebImages(List<XFile> images) async {
    List<Uint8List> webImages = [];
    for (var image in images) {
      final bytes = await image.readAsBytes();
      webImages.add(bytes);
    }
    setState(() {
      _webImages = webImages;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Upload Screenshots'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              'Upload your app screenshots',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _pickImages,
              child: const Text('Select Images'),
            ),
            const SizedBox(height: 20),
            if (_images != null && _images!.isNotEmpty)
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemCount: _images!.length,
                  itemBuilder: (context, index) {
                    if (kIsWeb && _webImages != null) {
                      return Image.memory(_webImages![index]);
                    } else {
                      return Image.file(File(_images![index].path));
                    }
                  },
                ),
              ),
            if (_images != null && _images!.isNotEmpty)
              ElevatedButton(
                onPressed: () {
                  // Pass images to next screen
                  Navigator.pushNamed(context, '/generator');
                },
                child: const Text('Next'),
              ),
          ],
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import '../models/device_model.dart';
import '../models/language_model.dart';

class GeneratorScreen extends StatefulWidget {
  const GeneratorScreen({super.key});

  @override
  State<GeneratorScreen> createState() => _GeneratorScreenState();
}

class _GeneratorScreenState extends State<GeneratorScreen> {
  String _selectedDevice = 'iPhone';
  String _selectedLanguage = 'English';

  final List<String> devices = ['iPhone', 'iPad', 'Android Phone', 'Android Tablet'];
  final List<String> languages = ['English', 'Spanish', 'French', 'German', 'Chinese'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Generate Screenshots'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Select device and language',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            DropdownButton<String>(
              value: _selectedDevice,
              items: devices.map((String device) {
                return DropdownMenuItem<String>(
                  value: device,
                  child: Text(device),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _selectedDevice = newValue!;
                });
              },
            ),
            const SizedBox(height: 20),
            DropdownButton<String>(
              value: _selectedLanguage,
              items: languages.map((String language) {
                return DropdownMenuItem<String>(
                  value: language,
                  child: Text(language),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _selectedLanguage = newValue!;
                });
              },
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                // Generate screenshots with selected options
                Navigator.pushNamed(context, '/preview');
              },
              child: const Text('Generate Screenshots'),
            ),
          ],
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';

class PreviewScreen extends StatelessWidget {
  const PreviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Preview Screenshots'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              'Generated Screenshots Preview',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: 4, // Mock 4 screenshots
                itemBuilder: (context, index) {
                  return Container(
                    color: Colors.grey[300],
                    child: Center(
                      child: Text('Screenshot ${index + 1}'),
                    ),
                  );
                },
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // Export screenshots
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Screenshots exported!')),
                );
              },
              child: const Text('Export Screenshots'),
            ),
          ],
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';

class MusicPageLayout extends StatelessWidget {
  const MusicPageLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Yexider Music'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: List.generate(30, (index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Container(
                  color: Colors.grey[300],
                  height: 100,
                  child: Center(
                    child: Text('Item ${index + 1}'),
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';

class ExplorePageLayout extends StatelessWidget {
  const ExplorePageLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Yexider Explore'),
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
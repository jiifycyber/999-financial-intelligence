import 'package:flutter/material.dart';

class ModuleScreen extends StatelessWidget {
  final String title;
  final String subtitle;
  final List<String> features;
  const ModuleScreen(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.features});
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: Text(title)),
        body: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            Text(subtitle, style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 16),
            ...features.map((f) => Card(
                child: ListTile(
                    leading: const Icon(Icons.auto_awesome), title: Text(f)))),
          ],
        ),
      );
}

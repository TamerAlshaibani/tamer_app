
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../helpers/theme_provider.dart';
import '../widgets/tamer_button.dart';
import '../widgets/tamer_card.dart';
import '../widgets/tamer_textfild.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Tamer App'),
        actions: [
          IconButton(
            icon: Icon(
              themeProvider.isDarkMode ? Icons.light_mode : Icons.dark_mode,
            ),
            onPressed: () {
              themeProvider.toggleTheme();
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TamerCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    'Tamer Card Title',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),
                  const TamerTextField(
                    hintText: 'Enter First Text',
                  ),
                  const SizedBox(height: 16),
                  const TamerTextField(
                    hintText: 'Enter Second Text',
                  ),
                  const SizedBox(height: 16),
                  TamerButton(
                    label: 'Submit',
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Tamer Button Pressed')),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

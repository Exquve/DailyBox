import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'theme/modern_theme.dart';
import 'theme/theme_provider.dart';
import 'screens/clean_modern_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          return MaterialApp(
            title: 'DailyBox',
            theme: ModernTheme.lightTheme,
            darkTheme: ModernTheme.darkTheme,
            themeMode: themeProvider.themeMode,
            home: const CleanModernScreen(),
            debugShowCheckedModeBanner: false,
          );
        },
      ),
    );
  }
}

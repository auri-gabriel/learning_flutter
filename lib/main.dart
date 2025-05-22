import 'package:flutter/material.dart';
import 'package:unicode_converter/screens/cursive.dart';
import 'package:unicode_converter/screens/home.dart';
import 'package:unicode_converter/screens/strikethrough.dart';

var kColorScheme = ColorScheme.fromSeed(
  seedColor: Color.fromARGB(255, 180, 60, 140),
);

var kDarkColorScheme = ColorScheme.fromSeed(
  brightness: Brightness.dark,
  seedColor: Color.fromARGB(255, 180, 60, 140),
);

void main() {
  runApp(const StrikethroughApp());
}

class StrikethroughApp extends StatelessWidget {
  const StrikethroughApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Unicode Converter',
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/strikethrough': (context) => const StrikethroughConverterScreen(),
        '/cursive': (context) => const CursiveConverterScreen(),
      },
      darkTheme: ThemeData.dark().copyWith(
        colorScheme: kDarkColorScheme,
        textTheme: TextTheme().copyWith(),
        cardTheme: CardThemeData().copyWith(
          color: kDarkColorScheme.secondaryContainer,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kDarkColorScheme.primaryContainer,
            foregroundColor: kDarkColorScheme.onPrimaryContainer,
            shape: ContinuousRectangleBorder(
              borderRadius: BorderRadiusGeometry.circular(16),
            ),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme().copyWith(),
      ),
      theme: ThemeData().copyWith(
        colorScheme: kColorScheme,
        appBarTheme: AppBarTheme().copyWith(
          backgroundColor: kColorScheme.onPrimaryContainer,
          foregroundColor: kColorScheme.primaryContainer,
        ),
        scaffoldBackgroundColor: kColorScheme.surface,
        cardTheme: CardThemeData().copyWith(
          color: kColorScheme.secondaryContainer,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kColorScheme.primaryContainer,
            shape: ContinuousRectangleBorder(
              borderRadius: BorderRadiusGeometry.circular(16),
            ),
          ),
        ),
        textTheme: ThemeData().textTheme.copyWith(
          titleLarge: TextStyle(
            fontWeight: FontWeight.bold,
            color: kColorScheme.onSecondaryContainer,
            fontSize: 16,
          ),
        ),
      ),
      themeMode: ThemeMode.system,
    );
  }
}

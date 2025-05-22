import 'package:flutter/material.dart';
import 'package:unicode_converter/screens/cursive.dart';
import 'package:unicode_converter/screens/home.dart';
import 'package:unicode_converter/screens/strikethrough.dart';

var kColorScheme = ColorScheme.fromSeed(
  seedColor: Color.fromARGB(255, 180, 60, 140),
);

var kDarkColorScheme = ColorScheme.fromSeed(
  brightness: Brightness.dark,
  seedColor: Color.fromARGB(255, 86, 24, 140),
);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Strikethrough App',
      darkTheme: ThemeData.dark().copyWith(
        colorScheme: kDarkColorScheme,
        textTheme: TextTheme().copyWith(),
        cardTheme: CardThemeData().copyWith(
          color: kDarkColorScheme.secondaryContainer,
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kDarkColorScheme.primaryContainer,
            foregroundColor: kDarkColorScheme.onPrimaryContainer,
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
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kColorScheme.primaryContainer,
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
      home: const StrikethroughApp(),
    );
  }
}

class StrikethroughApp extends StatelessWidget {
  const StrikethroughApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Unicode Strikethrough',
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/strikethrough': (context) => const StrikethroughConverterScreen(),
        '/cursive': (context) => const CursiveConverterScreen(),
      },
    );
  }
}

import 'package:flutter/material.dart';
import "package:flutter_localizations/flutter_localizations.dart";
import "package:provider/provider.dart";
import 'package:google_fonts/google_fonts.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.system;

  void toggleTheme() {
    themeMode = themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',

      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blueAccent,
          brightness: Brightness.light,
          primary: Colors.blueAccent,
          onPrimary: Colors.white,
          secondary: Colors.lightBlueAccent,
          onSecondary: Colors.white,
          tertiary: Colors.cyan,
          onTertiary: Colors.white,
          surface: Colors.white,
          onSurface: Colors.black87,
          error: Colors.redAccent,
          onError: Colors.white,
        ),
        textTheme: GoogleFonts.cairoTextTheme().copyWith(
          headlineLarge: GoogleFonts.cairo(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
          headlineMedium: GoogleFonts.cairo(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
          headlineSmall: GoogleFonts.cairo(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
          bodyLarge: GoogleFonts.cairo(fontSize: 20),
          bodyMedium: GoogleFonts.cairo(fontSize: 16),
          bodySmall: GoogleFonts.cairo(fontSize: 14),
        ),
        scaffoldBackgroundColor: Colors.white, // أو استخدم colorScheme.surface
        appBarTheme: AppBarTheme(
          backgroundColor:
              Colors.blueAccent, // سيتم استبدال هذا باللون من colorScheme
          foregroundColor: Colors.white,
          elevation: 0,
        ),
      ),
      themeMode: context.watch<ThemeProvider>().themeMode, // غيرنا للوضع الفاتح
      darkTheme: ThemeData.dark().copyWith(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          brightness: Brightness.dark,
        ),
        textTheme: GoogleFonts.cairoTextTheme(),
      ),

      locale: const Locale("ar", "SA"),
      supportedLocales: const [Locale("ar", "SA"), Locale("en", "US")],
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],

      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("تطبيق المراسلة"),
        actions: [
          IconButton(
            onPressed: () {
              context.read<ThemeProvider>().toggleTheme();
            },
            icon: context.watch<ThemeProvider>().themeMode == ThemeMode.light
                ? const Icon(Icons.nightlight_sharp, size: 16)
                : const Icon(Icons.sunny, size: 16),
          ),
        ],
      ),
      body: Center(),
    );
  }
}

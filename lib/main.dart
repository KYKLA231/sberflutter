import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'providers/finance_provider.dart';
import 'screens/home_screen.dart';
import 'screens/welcome_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final initialName = prefs.getString('username');

  runApp(MyApp(initialName: initialName));
}

class MyApp extends StatelessWidget {
  final String? initialName;
  const MyApp({super.key, this.initialName});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => FinanceProvider(),
      child: MaterialApp(
        title: "Finance Analyzer",
        debugShowCheckedModeBanner: false,
        theme: appTheme.copyWith(
          textTheme: GoogleFonts.interTextTheme(appTheme.textTheme),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xff22A447),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
            ),
          ),
        ),
        home: initialName == null ? const WelcomeScreen() : HomeScreen(username: initialName),
      ),
    );
  }
}
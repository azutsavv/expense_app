import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:personal_expense_app/fonts/font1.dart';
import 'package:personal_expense_app/widgets/homepage.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized;
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
        fontFamily: GoogleFonts.bizUDPMincho().toString(),
      ),
      initialRoute: 'welcome',
      routes: {
        'welcome': (context) => homepage(),
      },
    );
  }
}

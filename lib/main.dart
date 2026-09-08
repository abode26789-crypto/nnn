import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screens/homepage.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: "https://cntxhmdomcoxolbopwyw.supabase.co",
    publishableKey: "sb_publishable_WVdUKlY12Y8FfTfrMen1wg_ub-J9Vbn",
  );
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Homepage(),
    );
  }
}

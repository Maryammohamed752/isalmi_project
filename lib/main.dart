import 'package:flutter/material.dart';
import 'package:project_islami/core/services/local_storage_service.dart';
import 'package:project_islami/features/layout/pages/layout_page.dart';
import 'package:project_islami/features/layout/quran/quran_details_view.dart';
import 'package:project_islami/features/onboarding/pages/onboarding_page.dart';
import 'package:project_islami/features/splash/pages/splash_page.dart';
import 'package:project_islami/provider/radio_manager_provider.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalStorageServices.init();
  runApp(ChangeNotifierProvider(
      create: (context) => RadioManagerProvider(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: SplashPage.routeName,
      routes: {
        SplashPage.routeName: (_) => SplashPage(),
        OnboardingPage.routeName: (_) => OnboardingPage(),
        LayoutPage.routeName: (_) => LayoutPage(),
        QuranDetailsView.routeName: (_) => QuranDetailsView(),
      },
    );
  }
}

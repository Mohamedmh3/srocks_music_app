import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:srocks_music_app/src/routing/router.dart';

import 'firebase_options.dart';
import 'src/di/locator.dart';
import 'features/home_page/viewmodels/home_viewmodel.dart';
import 'features/home_page/viewmodels/home_navigation_viewmodel.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(428, 926),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider<HomeViewModel>(
              create: (_) => locator<HomeViewModel>(),
            ),
            ChangeNotifierProvider<HomeNavigationViewModel>(
              create: (_) => locator<HomeNavigationViewModel>(),
            ),
          ],
          child: MaterialApp.router(
            title: 'S.Rocks Music App',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: Colors.deepPurple,
              visualDensity: VisualDensity.adaptivePlatformDensity,
              scaffoldBackgroundColor: Colors.black,
              appBarTheme: const AppBarTheme(
                backgroundColor: Colors.black,
                foregroundColor: Colors.white,
                elevation: 0,
              ),
              textTheme: GoogleFonts.interTextTheme(
                Theme.of(context).textTheme.apply(
                  bodyColor: Colors.white,
                  displayColor: Colors.white,
                ),
              ),
              colorScheme: ColorScheme.fromSwatch(
                primarySwatch: Colors.deepPurple,
              ).copyWith(secondary: const Color(0xFF9C27B0)),
            ),
            routerConfig: goRouter,
          ),
        );
      },
    );
  }
}

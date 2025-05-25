import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:srocks_music_app/features/home_page/views/home_screen.dart';

import '../di/locator.dart';
import '../../features/home_page/viewmodels/home_viewmodel.dart';
import '../../features/home_page/views/detail_screen.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();

final goRouter = GoRouter(
  navigatorKey: _rootNavigatorKey,
  routes: [
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return ChangeNotifierProvider<HomeViewModel>(
          create: (context) => locator<HomeViewModel>(),
          child: const HomeScreen(),
        );
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'details/:serviceTitle',
          builder: (BuildContext context, GoRouterState state) {
            final serviceTitle = state.pathParameters['serviceTitle']!;
            return DetailScreen(serviceTitle: serviceTitle);
          },
        ),
      ],
    ),
  ],
);

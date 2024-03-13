import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:leader_board/schemas.dart';
import 'package:leader_board/ui/pages/leader_board_page.dart';
import 'package:leader_board/ui/pages/main_page.dart';
import 'package:leader_board/ui/pages/profile_page.dart';
import 'package:leader_board/ui/pages/user_details_page.dart';

final GoRouter router = GoRouter(
  debugLogDiagnostics: true,
  initialLocation: '/',
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const MainPage(
          selectedIndex: 0,
          child: LeaderBoardPage(),
        );
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'profile',
          builder: (BuildContext context, GoRouterState state) {
            return MainPage(
              selectedIndex: 1,
              child: ProfilePage(),
            );
          },
        ),
        GoRoute(
          path: 'details',
          builder: (BuildContext context, GoRouterState state) {
            User user = state.extra as User;
            return MainPage(
              selectedIndex: 1,
              child: UserDetailsPage(
                user: user,
              ),
            );
          },
        ),
      ],
    ),
  ],
);

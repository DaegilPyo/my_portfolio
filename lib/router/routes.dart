import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:myportfolio/commons/widgets/new_theme_mode_button.dart';
import 'package:myportfolio/main_scaffold/ui/presentations/main_scaffold.dart';
import 'package:myportfolio/tetbee/tetbee_main_scaffold.dart';

const String _homePath = '/';
final GoRouter router = GoRouter(routes: <GoRoute>[
  GoRoute(
    path: _homePath,
    builder: (BuildContext context, GoRouterState state) {
      return const Stack(
        alignment: Alignment.topRight,
        children: [
          MainScaffold(),
          Padding(
            padding: EdgeInsets.all(32.0),
            child: NewThemeModeButton(),
          )
        ],
      );
    },
  ),
  GoRoute(
    path: '/tetbee',
    builder: (BuildContext context, GoRouterState state) {
      return const TetBeeMainScaffold();
    },
  ),
], onException: (_, __, ___) {});

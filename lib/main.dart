import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myportfolio/main_scaffold/provider/main_controller.dart';
import 'package:myportfolio/main_scaffold/provider/main_provider.dart';
import 'package:myportfolio/main_scaffold/ui/widgets/particle_widget.dart';
import 'package:myportfolio/router/routes.dart';
import 'package:myportfolio/theme/my_theme.dart';
import 'package:provider/provider.dart' as provider;
import 'package:responsive_framework/responsive_framework.dart';

void main() {
  ProviderScope app = const ProviderScope(
    child: ResponsiveBreakpoints(
      breakpoints: [
        Breakpoint(start: 0, end: 450, name: MOBILE),
        Breakpoint(start: 451, end: 800, name: TABLET),
        Breakpoint(start: 801, end: 1920, name: DESKTOP),
      ],
      child: MyApp(),
    ),
  );
  runApp(app);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return provider.MultiProvider(
      providers: [
        provider.ChangeNotifierProvider<MainController>(
          create: (_) => MainController(),
        ),
      ],
      child: Consumer(
        builder: (_, WidgetRef ref, __) {
          final mainPro = ref.watch(mainProvider);
          return MaterialApp(
              title: 'Daegil\'s portfolio',
              theme: MyTheme.getTheme(context, mainPro.themeMode),
              home: Scaffold(
                body: Stack(
                  alignment: Alignment.topRight,
                  children: [
                    if (mainPro.themeMode == ThemeMode.dark)
                      for (int i = 0;
                          i < MediaQuery.of(context).size.width / 20;
                          i++)
                        ParticleWidget(
                          key: ValueKey(i),
                          left: i * 20,
                        ),

                    MaterialApp.router(
                      theme: MyTheme.getTheme(context, mainPro.themeMode),
                      debugShowCheckedModeBanner: false,
                      routeInformationProvider: router.routeInformationProvider,
                      routeInformationParser: router.routeInformationParser,
                      routerDelegate: router.routerDelegate,
                    )
                    // const MoonWidget(),
                  ],
                ),
              ));
        },
      ),
    );
  }
}

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myportfolio/experience/provider/experince_provider.dart';
import 'package:myportfolio/helpers/enums.dart';
import 'package:myportfolio/helpers/helpers.dart';
import 'package:myportfolio/main_scaffold/provider/main_controller.dart';
import 'package:myportfolio/main_scaffold/provider/main_provider.dart';
import 'package:myportfolio/main_scaffold/ui/presentations/side_pannel.dart';
import 'package:provider/provider.dart' as provider;

class MainScaffold extends StatefulWidget {
  const MainScaffold({super.key});

  @override
  State<MainScaffold> createState() => _MainScaffoldState();
}

class _MainScaffoldState extends State<MainScaffold> {
  static const defaultMouseOffset = Offset(0, 0);
  late Offset mouseOffset;

  @override
  void initState() {
    super.initState();
    if (kIsWeb) {
      context
          .read<MainController>()
          .scrollController
          .addListener(() => onScroll(context));
      mouseOffset = defaultMouseOffset;
    }
  }

  onScroll(BuildContext context) {
    if (!context.read<MainController>().diableScrollerListener) {
      double currnetPosition =
          context.read<MainController>().scrollController.offset;
      double aboutMePosition = Helpers.getWidgetPosition(
              MainProvider.getKeyBySection(PanelContents.aboutMe))
          .dy;
      double expriencePosition = Helpers.getWidgetPosition(
              MainProvider.getKeyBySection(PanelContents.experience))
          .dy;
      double projectPosition = Helpers.getWidgetPosition(
              MainProvider.getKeyBySection(PanelContents.projects))
          .dy;
      PanelContents? target;
      if (expriencePosition < currnetPosition) {
        target = PanelContents.experience;
      } else if (projectPosition < currnetPosition) {
        target = PanelContents.projects;
      } else if (aboutMePosition < currnetPosition) {
        target = PanelContents.aboutMe;
      }

      if (target != null &&
          context.read<MainController>().selectedPanelContents != target) {
        context.read<MainController>().selectPanel(target, disable: false);
      }
    }
  }

  static const double radius = 400;
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (_, WidgetRef ref, __) {
      final prov = ref.watch(mainProvider);
      bool useMouseRegion = kIsWeb && prov.themeMode == ThemeMode.dark;

      Widget child = Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 64,
          horizontal: 86,
        ),
        child: Row(
          children: [
            const Expanded(
              flex: 4,
              child: SidePannel(),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: SizedBox(
                width: 16,
              ),
            ),
            Expanded(
              flex: 6,
              child: SingleChildScrollView(
                controller: context.read<MainController>().scrollController,
                child: Column(
                  children: [
                    ...PanelContents.values.map(
                      (e) => MainProvider.getPanelWidget(
                        e,
                      ),
                    ),
                    Container(
                      height: 200,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
      return useMouseRegion ? buildMouseRegion(child) : child;
    });
  }

  Widget buildMouseRegion(Widget child) {
    return MouseRegion(
      onExit: (_) {
        mouseOffset = defaultMouseOffset;
        setState(() {});
      },
      onHover: (PointerHoverEvent event) {
        setState(() {
          mouseOffset = event.position;
        });
      },
      child: Stack(
        children: [
          if (mouseOffset.dx != 0 && mouseOffset.dy != 0)
            AnimatedPositioned(
              top: mouseOffset.dy - radius / 2,
              left: mouseOffset.dx - radius / 2,
              duration: const Duration(microseconds: 1),
              child: Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: RadialGradient(colors: [
                      Colors.white.withOpacity(0.2),
                      Colors.transparent,
                    ])),
                width: radius,
                height: radius,
              ),
            ),
          child,
        ],
      ),
    );
  }
}

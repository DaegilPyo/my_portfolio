import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myportfolio/helpers/enums.dart';
import 'package:myportfolio/helpers/helpers.dart';
import 'package:myportfolio/main_scaffold/provider/main_controller.dart';
import 'package:myportfolio/main_scaffold/provider/main_provider.dart';
import 'package:provider/provider.dart' as provider;

class SectionButtonWidget extends StatefulWidget {
  final PanelContents panelContents;
  const SectionButtonWidget({
    super.key,
    required this.panelContents,
  });

  @override
  State<SectionButtonWidget> createState() => _SectionButtonWidgetState();
}

class _SectionButtonWidgetState extends State<SectionButtonWidget> {
  ButtonStatus buttonStatus = ButtonStatus.notSelected;
  @override
  void initState() {
    super.initState();
  }

  static const baseMiliseconds = 300;

  double getWidth() {
    switch (buttonStatus) {
      case ButtonStatus.notSelected:
      case ButtonStatus.hovered:
        return 24;
      case ButtonStatus.selected:
      default:
        return 48;
    }
  }

  double getFontSize() {
    switch (buttonStatus) {
      case ButtonStatus.notSelected:
      case ButtonStatus.hovered:
        return 20;
      case ButtonStatus.selected:
      default:
        return 26;
    }
  }

//
  Color getConentsColor(BuildContext context) {
    switch (buttonStatus) {
      case ButtonStatus.notSelected:
        return Colors.grey;
      case ButtonStatus.hovered:
        return Theme.of(context).primaryColorLight.withOpacity(0.5);
      case ButtonStatus.selected:
      default:
        return Theme.of(context).primaryColorLight;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (_, WidgetRef ref, __) {
      if (context.watch<MainController>().selectedPanelContents ==
          widget.panelContents) {
        buttonStatus = ButtonStatus.selected;
      } else if (buttonStatus != ButtonStatus.hovered) {
        buttonStatus = ButtonStatus.notSelected;
      }
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: SizedBox(
          height: 40,
          child: InkWell(
            focusColor: Colors.transparent,
            overlayColor: MaterialStateProperty.resolveWith((states) {
              return Colors.transparent;
            }),
            hoverColor: Colors.transparent,
            onHover: buttonStatus == ButtonStatus.selected
                ? null
                : (bool h) {
                    setState(() {
                      buttonStatus =
                          h ? ButtonStatus.hovered : ButtonStatus.notSelected;
                    });
                  },
            onTap: buttonStatus == ButtonStatus.selected
                ? null
                : () {
                    context
                        .read<MainController>()
                        .selectPanel(widget.panelContents);
                    Offset widgetPosition = Helpers.getWidgetPosition(
                        MainProvider.getKeyBySection(widget.panelContents));
                    context
                        .read<MainController>()
                        .scrollController
                        .animateTo(
                            context
                                    .read<MainController>()
                                    .scrollController
                                    .offset +
                                widgetPosition.dy -
                                60,
                            curve: Curves.linear,
                            duration: const Duration(
                              milliseconds: 300,
                            ))
                        .then((value) => context
                            .read<MainController>()
                            .ableScrollerListener());
                  },
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AnimatedContainer(
                  duration:
                      const Duration(milliseconds: (baseMiliseconds ~/ 2)),
                  width: getWidth(),
                  height: 1,
                  color: getConentsColor(context),
                ),
                const SizedBox(
                  width: 8,
                ),
                AnimatedDefaultTextStyle(
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                        color: getConentsColor(context),
                        fontSize: getFontSize(),
                        fontWeight: FontWeight.bold,
                      ),
                  duration: const Duration(
                    milliseconds: baseMiliseconds,
                  ),
                  child: Text(
                    MainProvider.getPanelText(widget.panelContents),
                  ),
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}

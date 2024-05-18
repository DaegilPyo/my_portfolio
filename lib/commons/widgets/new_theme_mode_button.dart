import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myportfolio/helpers/enums.dart';
import 'package:myportfolio/main_scaffold/provider/main_provider.dart';
import 'package:myportfolio/theme/my_theme.dart';

class NewThemeModeButton extends StatefulWidget {
  const NewThemeModeButton({super.key});

  @override
  State<NewThemeModeButton> createState() => _NewThemeModeButtonState();
}

class _NewThemeModeButtonState extends State<NewThemeModeButton>
    with TickerProviderStateMixin {
  late final AnimationController animationController;
  late final Animation animation;

  ButtonStatus buttonStatus = ButtonStatus.notSelected;
  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 200))
      ..addListener(() {
        setState(() {});
      });

    animation = Tween<double>(begin: 0, end: 43).animate(
        CurvedAnimation(parent: animationController, curve: Curves.linear));
  }

  Color getConentsColor(BuildContext context) {
    switch (buttonStatus) {
      case ButtonStatus.notSelected:
        return Colors.grey;
      case ButtonStatus.hovered:
        return Theme.of(context).primaryColorLight;
      case ButtonStatus.selected:
      default:
        return Theme.of(context).primaryColorLight;
    }
  }

  String getTextByThemeMode(ThemeMode themeMode) {
    switch (themeMode) {
      case ThemeMode.dark:
        return 'DARK';
      case ThemeMode.light:
      default:
        return 'LIGHT';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (_, WidgetRef ref, __) {
      final provider = ref.watch(mainProvider);

      TextStyle baseTextStyle = Theme.of(context).textTheme.labelMedium!;

      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: Theme.of(context).baseTextColor.withOpacity(
                    0.1,
                  )),
          width: 90,
          height: 30,
          child: Stack(
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      buildButton(ThemeMode.dark, provider, baseTextStyle),
                      const Spacer(),
                      buildButton(ThemeMode.light, provider, baseTextStyle),
                    ],
                  ),
                ),
              ),
              Positioned(
                  left: animation.value,
                  child: InkWell(
                    onTap: () {},
                    focusColor: Colors.transparent,
                    overlayColor: MaterialStateProperty.resolveWith((states) {
                      return Colors.transparent;
                    }),
                    hoverColor: Colors.transparent,
                    onHover: buttonStatus == ButtonStatus.selected
                        ? null
                        : (bool h) {
                            setState(() {
                              buttonStatus = h
                                  ? ButtonStatus.hovered
                                  : ButtonStatus.notSelected;
                            });
                          },
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: getConentsColor(context),
                            border: Border.all(
                                width: 2,
                                color: buttonStatus == ButtonStatus.hovered
                                    ? Colors.white
                                    : Colors.transparent)),
                        width: 43,
                        height: 25,
                        child: Center(
                          child: Text(
                            getTextByThemeMode(provider.themeMode),
                            style: baseTextStyle,
                          ),
                        ),
                      ),
                    ),
                  ))
            ],
          ),
        ),
      );
    });
  }

  Widget buildButton(
      ThemeMode themeMode, MainProvider provider, TextStyle baseStyle) {
    return InkWell(
      focusColor: Colors.transparent,
      overlayColor: MaterialStateProperty.resolveWith((states) {
        return Colors.transparent;
      }),
      hoverColor: Colors.transparent,
      onTap: provider.themeMode == themeMode
          ? null
          : () {
              if (provider.themeMode == ThemeMode.dark) {
                animationController.forward();
              } else {
                animationController.reverse();
              }
              provider.changeTheme();
            },
      child: Text(
        getTextByThemeMode(themeMode),
        style: baseStyle,
      ),
    );
  }
}

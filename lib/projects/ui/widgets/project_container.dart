import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:myportfolio/commons/widgets/custom_icon_button.dart';
import 'package:myportfolio/commons/widgets/fade_text.dart';
import 'package:myportfolio/helpers/enums.dart';
import 'package:myportfolio/projects/date_model/project_model.dart';
import 'dart:math' as math;
import 'package:url_launcher/url_launcher.dart' as launcher;

class ProjectContainer extends StatefulWidget {
  final ProjectModel projectModel;
  const ProjectContainer({
    super.key,
    required this.projectModel,
  });

  @override
  State<ProjectContainer> createState() => _ProjectContainerState();
}

class _ProjectContainerState extends State<ProjectContainer>
    with SingleTickerProviderStateMixin {
  ButtonStatus buttonStatus = ButtonStatus.notSelected;

  late final AnimationController animationController;
  late final Animation<double> animation;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );

    animation = Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(parent: animationController, curve: Curves.linear));
  }

  double getBoxScale() {
    switch (buttonStatus) {
      case ButtonStatus.hovered:
        return 0.5;
      case ButtonStatus.notSelected:
      case ButtonStatus.selected:
      default:
        return 20;
    }
  }

  double getBorderRadius() {
    switch (buttonStatus) {
      case ButtonStatus.hovered:
        return 40;
      case ButtonStatus.notSelected:
      case ButtonStatus.selected:
      default:
        return 10;
    }
  }

  double getOpacity() {
    switch (buttonStatus) {
      case ButtonStatus.hovered:
        return 1;
      case ButtonStatus.notSelected:
      case ButtonStatus.selected:
      default:
        return 0.5;
    }
  }

  double getAngle() {
    switch (buttonStatus) {
      case ButtonStatus.hovered:
        return (math.pi);
      case ButtonStatus.notSelected:
      case ButtonStatus.selected:
      default:
        return 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
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
                if (h) {
                  animationController.forward();
                } else {
                  animationController.reverse();
                }
              });
            },
      onTap: () {
        context.go(widget.projectModel.route);
      },
      child: AnimatedBuilder(
        animation: animation,
        builder: (_, Widget? child) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AnimatedContainer(
                  duration: const Duration(milliseconds: 500),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(getBorderRadius()),
                    image: DecorationImage(
                      image: AssetImage(
                        widget.projectModel.logos.first,
                      ),
                      opacity: getOpacity(),
                    ),
                  ),
                  height: 250,
                  width: 250,
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 16,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FadeText(
                          firstText: widget.projectModel.title,
                          secondText: widget.projectModel.secondTitle,
                          firstTextStyle:
                              Theme.of(context).textTheme.titleLarge,
                          secondTextStyle: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(
                                  color: Theme.of(context)
                                      .textTheme
                                      .titleMedium!
                                      .color!
                                      .withOpacity(0.8)),
                          opacity: animation.value,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Text(
                            widget.projectModel.description,
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ),
                        const SizedBox(
                          height: 48,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            if (widget.projectModel.webLink != null)
                              CustomIconButton(
                                toolTipMessage: widget.projectModel.webLink,
                                iconData: FontAwesomeIcons.link,
                                onTap: () {
                                  launcher.launchUrl(
                                      Uri.parse(widget.projectModel.webLink!));
                                },
                              ),
                            if (widget.projectModel.appStoreLink != null)
                              CustomIconButton(
                                toolTipMessage: 'App Store',
                                iconData: FontAwesomeIcons.apple,
                                onTap: () {
                                  launcher.launchUrl(Uri.parse(
                                      widget.projectModel.appStoreLink!));
                                },
                              ),
                            if (widget.projectModel.playStoreLink != null)
                              CustomIconButton(
                                toolTipMessage: 'Play Store',
                                iconData: FontAwesomeIcons.google,
                                onTap: () {
                                  launcher.launchUrl(Uri.parse(
                                      widget.projectModel.playStoreLink!));
                                },
                              ),
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}

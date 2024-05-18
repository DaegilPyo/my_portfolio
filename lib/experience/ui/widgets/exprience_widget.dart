import 'package:flutter/material.dart';
import 'package:myportfolio/experience/models/work_experience.dart';
import 'package:myportfolio/experience/ui/widgets/skill_component_chip.dart';
import 'package:myportfolio/helpers/enums.dart';
import 'package:myportfolio/theme/constants/theme_constants.dart';
import 'package:myportfolio/theme/my_theme.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:url_launcher/url_launcher.dart' as launcher;

class ExperienceWidget extends StatefulWidget {
  final WorkExperience workExperience;
  const ExperienceWidget({
    super.key,
    required this.workExperience,
  });

  @override
  State<ExperienceWidget> createState() => _ExperienceWidgetState();
}

class _ExperienceWidgetState extends State<ExperienceWidget>
    with SingleTickerProviderStateMixin {
  ButtonStatus buttonStatus = ButtonStatus.notSelected;
  static const baseMiliseconds = 600;

  late final AnimationController animationController;
  late final Animation<double?> animation;

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 250))
      ..addListener(() {
        setState(() {});
      });

    animation = Tween<double>(begin: 0, end: 30).animate(
        CurvedAnimation(parent: animationController, curve: Curves.linear));
  }

  double getWidth() {
    switch (buttonStatus) {
      case ButtonStatus.notSelected:
        return 24;
      case ButtonStatus.hovered:
        return 36;
      case ButtonStatus.selected:
      default:
        return 48;
    }
  }

//
  Color getConentsColor(BuildContext context) {
    switch (buttonStatus) {
      case ButtonStatus.notSelected:
        return Colors.transparent;
      case ButtonStatus.hovered:
        return Theme.of(context).primaryColorLight.withOpacity(0.1);
      case ButtonStatus.selected:
      default:
        return Theme.of(context).primaryColor;
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
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
                buttonStatus =
                    h ? ButtonStatus.hovered : ButtonStatus.notSelected;
                if (buttonStatus == ButtonStatus.hovered) {
                  animationController.forward();
                } else if (buttonStatus == ButtonStatus.notSelected) {
                  animationController.reverse();
                }
              });
            },
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: AnimatedContainer(
              decoration: BoxDecoration(
                  color: getConentsColor(context),
                  borderRadius: BorderRadius.circular(
                    10,
                  )),
              duration: const Duration(milliseconds: baseMiliseconds),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 8,
                      ),
                      child: Text(
                        widget.workExperience.period,
                        style:
                            Theme.of(context).textTheme.labelMedium!.copyWith(
                                  color: Theme.of(context)
                                      .baseTextColor
                                      .withOpacity(0.5),
                                  fontWeight: FontWeight.bold,
                                ),
                      ),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    SizedBox(
                      width: ResponsiveBreakpoints.of(context).isMobile
                          ? MediaQuery.of(context).size.width * 0.8
                          : MediaQuery.of(context).size.width * 0.35,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.workExperience.companyName,
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
                          Text(
                            widget.workExperience.jobTitle.toUpperCase(),
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge!
                                .copyWith(
                                  color:
                                      ThemeConstants.softAlice.withOpacity(0.8),
                                ),
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Text(
                            widget.workExperience.desc,
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Row(
                            children: [
                              ...widget.workExperience.skills.map(
                                (e) => SkillComponentChip(
                                  skills: e,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          if (widget.workExperience.link != null)
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: InkWell(
                onTap: () {
                  launcher.launchUrl(Uri.parse(widget.workExperience.link!));
                },
                child: Icon(
                  Icons.link,
                  size: animation.value,
                  color: Theme.of(context).baseTextColor,
                ),
              ),
            )
        ],
      ),
    );
  }
}

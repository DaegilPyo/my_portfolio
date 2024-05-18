import 'package:flutter/material.dart';
import 'package:myportfolio/commons/widgets/header_widget.dart';
import 'package:myportfolio/commons/widgets/section_layout.dart';
import 'package:myportfolio/experience/provider/experince_provider.dart';
import 'package:myportfolio/experience/ui/widgets/exprience_widget.dart';
import 'package:myportfolio/main_scaffold/provider/main_controller.dart';

class ExperienceMainScreen extends StatelessWidget {
  const ExperienceMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SectionLayOut(
      key: MainController.experienceKey,
      title: 'Expriences',
      child: Column(
        children: [
          ...ExperienceProvider.experiences.map(
            (e) => ExperienceWidget(
              workExperience: e,
            ),
          ),
        ],
      ),
    );
  }
}

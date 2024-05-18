import 'package:flutter/material.dart';
import 'package:myportfolio/commons/widgets/section_layout.dart';
import 'package:myportfolio/main_scaffold/provider/main_controller.dart';
import 'package:myportfolio/projects/date_model/project_model.dart';
import 'package:myportfolio/projects/ui/widgets/project_container.dart';

class ProjectsMainScreen extends StatelessWidget {
  const ProjectsMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SectionLayOut(
        key: MainController.projectKey,
        title: 'Projects',
        child: Column(
          children: [
            ...projects.map(
              (e) => ProjectContainer(projectModel: e),
            ),
          ],
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myportfolio/aboutme/ui/presentaion/about_me_main_screen.dart';
import 'package:myportfolio/experience/ui/presentations/experience_main_screen.dart';
import 'package:myportfolio/helpers/enums.dart';
import 'package:myportfolio/main_scaffold/provider/main_controller.dart';
import 'package:myportfolio/projects/ui/presentation/projects_main_screen.dart';
import 'package:myportfolio/text_constant/language.dart';

final mainProvider =
    ChangeNotifierProvider<MainProvider>((ref) => MainProvider());

class MainProvider with ChangeNotifier {
  Language mainLanguage = Language.en;
  ThemeMode themeMode = ThemeMode.dark;

  void changeTheme() {
    themeMode = themeMode == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
    notifyListeners();
  }

  static GlobalKey getKeyBySection(PanelContents panelContents) {
    switch (panelContents) {
      case PanelContents.aboutMe:
        return MainController.aboutMeKey;
      case PanelContents.projects:
        return MainController.projectKey;
      case PanelContents.experience:
        return MainController.experienceKey;
    }
  }

  static String getPanelText(PanelContents panelContents) {
    switch (panelContents) {
      case PanelContents.aboutMe:
        return 'About Me';
      case PanelContents.projects:
        return 'Projects';
      case PanelContents.experience:
        return 'Experiences';
    }
  }

  static Widget getPanelWidget(PanelContents panelContents) {
    switch (panelContents) {
      case PanelContents.aboutMe:
        return const AboutMeMainScreen();
      case PanelContents.projects:
        return const ProjectsMainScreen();
      case PanelContents.experience:
        return const ExperienceMainScreen();
    }
  }
}

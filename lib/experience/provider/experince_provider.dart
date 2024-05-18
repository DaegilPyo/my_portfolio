import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myportfolio/experience/models/work_experience.dart';
import 'package:myportfolio/helpers/enums.dart';

final experienceProvider =
    ChangeNotifierProvider<ExperienceProvider>((ref) => ExperienceProvider());

class ExperienceProvider with ChangeNotifier {
  static final List<WorkExperience> experiences = [
    WorkExperience(
        companyName: 'Danihel Group',
        jobTitle: 'Full stack Developer',
        desc:
            "As a Full Stack Developer, I attained a comprehensive understanding of both front-end and back-end technologies. My focus on the back end, particularly with Nest.js, enriched my skill set. Known for adept task management and a problem-solving approach, I consistently delivered effective solutions in a dynamic and collaborative development environment.",
        period: 'JAN 2023 - CURRENT',
        skills: [
          Skills.dart,
          Skills.flutter,
          Skills.typeScript,
          // Skills.javaScript,
          Skills.nestJs,
          // Skills.db2,
        ],
        link: 'https://www.danihelgroup.com'),
    WorkExperience(
        companyName: 'Fandemand',
        jobTitle: 'Jr Flutter Developer',
        desc:
            "As a Jr Flutter Developer, I pioneered an innovative developer platform empowering users to autonomously craft mobile apps. Proficient in clean code, database management, and possessing a profound grasp of Firebase and Flutter animation, I honed my skills in my inaugural professional role, contributing to a dynamic and collaborative development environment.",
        period: 'MAR 2021 - DEC 2022',
        skills: [
          Skills.dart,
          Skills.flutter,
          Skills.firebase,
        ]),
  ];
}

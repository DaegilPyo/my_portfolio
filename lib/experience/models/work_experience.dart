import 'package:myportfolio/helpers/enums.dart';

class WorkExperience {
  final String companyName;
  final String jobTitle;
  final String desc;
  final String period;
  final String? link;
  final List<Skills> skills;
  WorkExperience({
    required this.companyName,
    required this.jobTitle,
    required this.desc,
    required this.period,
    required this.skills,
    this.link,
  });
}

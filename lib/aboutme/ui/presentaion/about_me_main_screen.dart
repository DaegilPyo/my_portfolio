import 'package:flutter/material.dart';
import 'package:myportfolio/commons/widgets/section_layout.dart';
import 'package:myportfolio/main_scaffold/provider/main_controller.dart';

class AboutMeMainScreen extends StatelessWidget {
  const AboutMeMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SectionLayOut(
        key: MainController.aboutMeKey,
        title: 'About me',
        child: Text(
          """
Hi there! I'm a Full Stack Developer with over 4 years of experience, specializing in Flutter and Node.js. I love writing efficient, clean, and maintainable code, and I'm always up for a challenge when it comes to troubleshooting and solving complex issues quickly. My goal is to deliver high-quality solutions and keep my code well-organized.
I enjoy collaborating with my team and sharing technical advice and assistance. Building strong relationships with my co-workers is important to me, and I take pride in contributing to a positive and productive work environment.
""",
          style: Theme.of(context).textTheme.bodySmall,
        ));
  }
}

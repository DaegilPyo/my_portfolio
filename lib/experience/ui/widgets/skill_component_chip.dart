import 'package:flutter/material.dart';
import 'package:myportfolio/helpers/enums.dart';
import 'package:myportfolio/helpers/helpers.dart';

class SkillComponentChip extends StatelessWidget {
  final Skills skills;
  const SkillComponentChip({
    super.key,
    required this.skills,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 4),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white38, width: 3),
          borderRadius: BorderRadius.circular(
            100,
          ),
          color: Helpers.getSkillsColor(
            skills,
          ).withOpacity(0.1),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 2,
          ),
          child: Text(
            Helpers.getSkillsText(
              skills,
            ).toUpperCase(),
            style: Theme.of(context).textTheme.labelMedium,
          ),
        ),
      ),
    );
  }
}

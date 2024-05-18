import 'package:flutter/material.dart';
import 'package:myportfolio/theme/my_theme.dart';

class SectionFooterWidget extends StatelessWidget {
  const SectionFooterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Divider(
      indent: 16,
      endIndent: 32,
      color: Theme.of(context).baseTextColor.withOpacity(
            0.1,
          ),
    );
  }
}

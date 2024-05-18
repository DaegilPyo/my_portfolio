import 'package:flutter/material.dart';
import 'package:myportfolio/commons/widgets/header_widget.dart';
import 'package:myportfolio/commons/widgets/section_footer_widget.dart';

class SectionLayOut extends StatelessWidget {
  final Widget child;
  final String title;
  const SectionLayOut({
    super.key,
    required this.title,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HeaderWidget(text: title.toUpperCase()),
        const SizedBox(
          height: 16,
        ),
        child,
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 32),
          child: SectionFooterWidget(),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myportfolio/commons/widgets/custom_icon_button.dart';
import 'package:myportfolio/helpers/enums.dart';
import 'package:myportfolio/helpers/helpers.dart';
import 'package:myportfolio/main_scaffold/provider/main_constants.dart';
import 'package:myportfolio/main_scaffold/ui/widgets/section_button_widget.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:myportfolio/theme/my_theme.dart';
import 'package:url_launcher/url_launcher.dart' as launcher;

class SidePannel extends ConsumerWidget {
  const SidePannel({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              'HI',
              style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                    fontFamily: MainConstants.boldBaseFontFamily,
                    color: Theme.of(context).baseTextColor.withOpacity(
                          0.6,
                        ),
                  ),
            ),
            Text(
              ', ',
              style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                  fontFamily: MainConstants.boldBaseFontFamily,
                  color: Theme.of(context).baseTextColor),
            ),
            Text(
              'I',
              style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                    fontFamily: MainConstants.boldBaseFontFamily,
                    color: Theme.of(context).baseTextColor.withOpacity(
                          0.6,
                        ),
                  ),
            ),
            Text(
              '\'',
              style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                  fontFamily: MainConstants.boldBaseFontFamily,
                  color: Theme.of(context).baseTextColor),
            ),
            Text(
              'M',
              style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                    fontFamily: MainConstants.boldBaseFontFamily,
                    color: Theme.of(context).baseTextColor.withOpacity(
                          0.6,
                        ),
                  ),
            ),
          ],
        ),
        Text(
          'Daegil Pyo',
          style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                fontFamily: MainConstants.boldBaseFontFamily,
                fontSize: Helpers.getBaseFontSize(context) * 20,
              ),
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          'Flutter Developer',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          'I\'m a passionate developer based in Toronto, specializing in Flutter. My love for coding extends beyond expertise, as I\'m always eager to embrace new challenges and expand my skills. Through my portfolio, I showcase a blend of proficiency and enthusiasm for creating innovative solutions in the dynamic world of Flutter development.',
          style: Theme.of(context).textTheme.bodySmall,
        ),
        const SizedBox(
          height: 32,
        ),
        ...PanelContents.values.map((value) => SectionButtonWidget(
              panelContents: value,
            )),
        const Spacer(),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CustomIconButton(
              iconData: FontAwesomeIcons.github,
              onTap: () {
                launcher.launchUrl(Uri.parse(MainConstants.gitHubLink));
              },
            ),
            CustomIconButton(
              iconData: FontAwesomeIcons.linkedin,
              onTap: () {
                launcher.launchUrl(Uri.parse(MainConstants.linkedInLink));
              },
            ),
          ],
        )
      ],
    );
  }
}

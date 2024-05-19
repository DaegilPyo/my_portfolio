import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:myportfolio/commons/widgets/custom_icon_button.dart';
import 'package:myportfolio/projects/date_model/project_model.dart';
import 'package:url_launcher/url_launcher.dart' as launcher;

class TetbeeInfoMainWidget extends StatelessWidget {
  const TetbeeInfoMainWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'STAFF MANAGEMENT / SCHEDULING SOFTWARE',
          style: Theme.of(context).textTheme.titleSmall,
        ),
        const SizedBox(
          height: 16,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      20,
                    ),
                    image: const DecorationImage(
                      image: AssetImage(
                        'assets/tetbee/logo_512.png',
                      ),
                    )),
              ),
              const SizedBox(
                width: 32,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "TetBee",
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 6,
                    ),
                    child: Text(
                      "The Easier The Better",
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    children: [
                      CustomIconButton(
                        toolTipMessage: tetBeeModel.webLink!,
                        iconData: FontAwesomeIcons.link,
                        onTap: () {
                          launcher.launchUrl(Uri.parse(tetBeeModel.webLink!));
                        },
                      ),
                      CustomIconButton(
                        toolTipMessage: 'App Store',
                        iconData: FontAwesomeIcons.apple,
                        onTap: () {
                          launcher
                              .launchUrl(Uri.parse(tetBeeModel.appStoreLink!));
                        },
                      ),
                      CustomIconButton(
                        toolTipMessage: 'Play Store',
                        iconData: FontAwesomeIcons.google,
                        onTap: () {
                          launcher
                              .launchUrl(Uri.parse(tetBeeModel.playStoreLink!));
                        },
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        Text(
          "Save Time, Manage Your Workplace Efficiently!",
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        const SizedBox(
          height: 16,
        ),
      ],
    );
  }
}

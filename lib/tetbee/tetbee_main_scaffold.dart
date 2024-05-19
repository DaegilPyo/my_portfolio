import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:myportfolio/commons/widgets/custom_icon_button.dart';
import 'package:myportfolio/projects/date_model/project_model.dart';
import 'package:myportfolio/tetbee/functions_section/functions_displayer.dart';
import 'package:myportfolio/tetbee/functions_section/model/tetbee_function_model.dart';
import 'package:myportfolio/tetbee/information_section/tetbee_info_main_widget.dart';
import 'package:myportfolio/theme/my_theme.dart';
import 'package:url_launcher/url_launcher.dart' as launcher;

class TetBeeMainScaffold extends StatelessWidget {
  const TetBeeMainScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.topLeft,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                InkWell(
                  onTap: () {
                    context.go('/');
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.arrow_back_ios_sharp,
                        color: Theme.of(context).baseTextColor,
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      const Text('Home'),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              right: 32,
              left: 32,
              top: 32,
            ),
            child: ListView(
              children: [
                const TetbeeInfoMainWidget(),
                FunctionsDisplayer(
                  functions: [
                    TetbeeFunctionModel(
                      header: 'Work Place',
                      title: 'Your Own Place',
                      icon: FontAwesomeIcons.building,
                      description:
                          "Open workspace! Effortlessly hire and manage your team with joy and simplicity. Let's create a workplace where everyone flourishes!",
                      detailWidget: Container(),
                      images: [
                        'assets/tetbee/wp_1.jpeg',
                        'assets/tetbee/wp_2.jpeg',
                        'assets/tetbee/wp_3.jpeg',
                      ],
                    ),
                    TetbeeFunctionModel(
                      header: 'Schedule',
                      title: 'Efficient Scheduling',
                      icon: Icons.calendar_month_rounded,
                      description:
                          'Feeling bogged down by scheduling? Struggling with flexible scheduling? Tetbee has got you covered!',
                      detailWidget: Container(),
                      images: [
                        'assets/tetbee/sc_1.jpeg',
                        'assets/tetbee/sc_2.jpeg',
                        'assets/tetbee/sc_3.jpeg',
                      ],
                    ),
                    TetbeeFunctionModel(
                      header: 'Posting , Messaging',
                      title: 'Communication',
                      icon: FontAwesomeIcons.message,
                      description:
                          'Stay connected with your team! Share work-related updates and messages in real-time for seamless communication.',
                      detailWidget: Container(),
                      images: [
                        'assets/tetbee/cm_1.jpeg',
                        'assets/tetbee/cm_2.jpeg',
                        'assets/tetbee/cm_3.jpeg',
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 100,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

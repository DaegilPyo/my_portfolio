import 'package:flutter/material.dart';
import 'package:myportfolio/helpers/enums.dart';

class ProjectModel {
  const ProjectModel({
    required this.title,
    required this.secondTitle,
    required this.route,
    this.appStoreLink,
    this.playStoreLink,
    required this.description,
    required this.destination,
    required this.projectTypes,
    required this.logos,
    this.webLink,
    required this.previewImages,
  });

  final String title;
  final String route;
  final String secondTitle;
  final Widget destination;
  final String description;
  final List<ProjectType> projectTypes;
  final List<String> logos;
  final String? webLink;
  final String? appStoreLink;
  final String? playStoreLink;
  final List<String> previewImages;
}

ProjectModel tetBeeModel = ProjectModel(
  logos: ['tetbee/logo_512.png'],
  title: 'TetBee',
  route: '/tetbee',
  secondTitle: 'The Easier The Better !',
  description:
      'My very first Project in Market. Developed a mobile and web application with Flutter and Firebase to optimize restaurant staff scheduling and communication, enhancing overall operational efficiency.',
  destination: Container(),
  projectTypes: [
    ProjectType.mobile,
    ProjectType.web,
  ],
  webLink: 'https://tetbee.com',
  appStoreLink: 'https://apps.apple.com/ca/app/tetbeee/id1644028744',
  playStoreLink:
      'https://play.google.com/store/apps/details?id=com.daegil.timetowork&hl=en&gl=US',
  previewImages: [
    'tetbee/scheduling.png',
    'tetbee/availability.png',
    'tetbee/chat.png'
  ],
);

List<ProjectModel> projects = [
  tetBeeModel,
];

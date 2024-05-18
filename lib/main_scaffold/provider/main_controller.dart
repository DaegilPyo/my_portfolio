import 'package:flutter/material.dart';
import 'package:myportfolio/helpers/enums.dart';

class MainController extends ChangeNotifier {
  final ScrollController _scrollController = ScrollController();
  ScrollController get scrollController => _scrollController;

  static GlobalKey aboutMeKey = GlobalKey();
  static GlobalKey projectKey = GlobalKey();
  static GlobalKey experienceKey = GlobalKey();

  PanelContents get selectedPanelContents => _selectedPanelContents;

  PanelContents _selectedPanelContents = PanelContents.values.first;
  bool _diableScrollerListener = false;

  bool get diableScrollerListener => _diableScrollerListener;

  void selectPanel(PanelContents panelContents, {bool disable = true}) {
    _selectedPanelContents = panelContents;
    _diableScrollerListener = disable;
    notifyListeners();
  }

  void ableScrollerListener() {
    _diableScrollerListener = false;
    notifyListeners();
  }
}

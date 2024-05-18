import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:myportfolio/theme/my_theme.dart';

class TetBeeMainScaffold extends StatelessWidget {
  const TetBeeMainScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.topLeft,
        children: [
          InkWell(
            onTap: () {
              context.go('/');
            },
            child: SizedBox(
              width: 200,
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.arrow_back_ios_sharp,
                      color: Theme.of(context).baseTextColor,
                    ),
                  ),
                  const Text('Home')
                ],
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 32),
            child: Column(
              children: [],
            ),
          )
        ],
      ),
    );
  }
}

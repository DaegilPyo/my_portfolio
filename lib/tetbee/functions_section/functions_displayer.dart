import 'package:flutter/material.dart';
import 'package:myportfolio/tetbee/functions_section/model/tetbee_function_model.dart';
import 'package:myportfolio/tetbee/functions_section/widgets/tetbee_function_info_widget.dart';

class FunctionsDisplayer extends StatefulWidget {
  final List<TetbeeFunctionModel> functions;
  const FunctionsDisplayer({
    super.key,
    required this.functions,
  });

  @override
  State<FunctionsDisplayer> createState() => _FunctionsDisplayerState();
}

class _FunctionsDisplayerState extends State<FunctionsDisplayer> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...widget.functions.map(
          (e) => TetbeeFunctionInfoWidget(
            tetbeeFunctionModel: e,
            isEven: widget.functions.indexOf(e) % 2 == 0,
          ),
        ),
      ],
    );
  }
}

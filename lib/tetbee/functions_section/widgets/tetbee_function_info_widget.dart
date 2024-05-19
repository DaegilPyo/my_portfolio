import 'package:flutter/material.dart';
import 'package:myportfolio/helpers/enums.dart';
import 'package:myportfolio/helpers/helpers.dart';
import 'package:myportfolio/tetbee/functions_section/model/tetbee_function_model.dart';
import 'package:myportfolio/theme/my_theme.dart';
import 'dart:math' as math;

class TetbeeFunctionInfoWidget extends StatefulWidget {
  final TetbeeFunctionModel tetbeeFunctionModel;
  final bool isEven;
  const TetbeeFunctionInfoWidget({
    super.key,
    required this.tetbeeFunctionModel,
    required this.isEven,
  });

  @override
  State<TetbeeFunctionInfoWidget> createState() =>
      _TetbeeFunctionInfoWidgetState();
}

class _TetbeeFunctionInfoWidgetState extends State<TetbeeFunctionInfoWidget>
    with SingleTickerProviderStateMixin {
  ButtonStatus buttonStatus = ButtonStatus.notSelected;

  late final AnimationController animationController;
  late final Animation<double> animation;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );

    animation = Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(parent: animationController, curve: Curves.linear));
  }

  double getBoxScale() {
    switch (buttonStatus) {
      case ButtonStatus.hovered:
        return 0.5;
      case ButtonStatus.notSelected:
      case ButtonStatus.selected:
      default:
        return 20;
    }
  }

  double getBorderRadius() {
    switch (buttonStatus) {
      case ButtonStatus.hovered:
        return 40;
      case ButtonStatus.notSelected:
      case ButtonStatus.selected:
      default:
        return 10;
    }
  }

  double getOpacity() {
    switch (buttonStatus) {
      case ButtonStatus.hovered:
        return 1;
      case ButtonStatus.notSelected:
      case ButtonStatus.selected:
      default:
        return 0.5;
    }
  }

  double getAngle() {
    switch (buttonStatus) {
      case ButtonStatus.hovered:
        return (math.pi);
      case ButtonStatus.notSelected:
      case ButtonStatus.selected:
      default:
        return 0;
    }
  }

  Widget buildHeader() {
    return InkWell(
      focusColor: Colors.transparent,
      overlayColor: MaterialStateProperty.resolveWith((states) {
        return Colors.transparent;
      }),
      hoverColor: Colors.transparent,
      onHover: buttonStatus == ButtonStatus.selected
          ? null
          : (bool h) {
              setState(() {
                buttonStatus =
                    h ? ButtonStatus.hovered : ButtonStatus.notSelected;
                if (h) {
                  animationController.forward();
                } else {
                  animationController.reverse();
                }
              });
            },
      onTap: null,
      child: AnimatedBuilder(
        animation: animation,
        builder: (_, Widget? child) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: Helpers.getMQWidth(context: context) / 4.5,
              height: Helpers.getMQWidth(context: context) / 3,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Theme.of(context).baseTextColor.withOpacity(0.4),
                ),
                borderRadius: BorderRadius.circular(
                  15,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Text(
                        widget.tetbeeFunctionModel.header,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ),
                    const Divider(),
                    Expanded(
                      flex: 4,
                      child: (widget.tetbeeFunctionModel.icon != null)
                          ? Center(
                              child: Icon(
                                widget.tetbeeFunctionModel.icon,
                                size: Helpers.getMQWidth(context: context) / 12,
                                color: Theme.of(context).baseTextColor,
                              ),
                            )
                          : const SizedBox.shrink(),
                    ),
                    Expanded(
                      flex: 5,
                      child: Column(
                        children: [
                          Text(
                            widget.tetbeeFunctionModel.title,
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                    fontSize: Theme.of(context)
                                            .textTheme
                                            .titleMedium!
                                            .fontSize! *
                                        Helpers.getMQWidth(context: context) /
                                        1500),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              widget.tetbeeFunctionModel.description,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                      fontSize: Theme.of(context)
                                              .textTheme
                                              .bodySmall!
                                              .fontSize! *
                                          Helpers.getMQWidth(context: context) /
                                          1200),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (widget.isEven) buildHeader(),
              ...widget.tetbeeFunctionModel.images.map((path) => Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                    ),
                    child: Container(
                      width: Helpers.getMQWidth(context: context) / 6,
                      height: Helpers.getMQWidth(context: context) / 3 - 20,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            10,
                          ),
                          image: DecorationImage(
                              image: AssetImage(path), fit: BoxFit.cover)),
                    ),
                  )),
              if (!widget.isEven) buildHeader(),
            ],
          ),
        ),
        const Divider(),
      ],
    );
  }
}

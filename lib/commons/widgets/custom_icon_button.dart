import 'package:flutter/material.dart';
import 'package:myportfolio/helpers/enums.dart';
import 'package:myportfolio/theme/my_theme.dart';

class CustomIconButton extends StatefulWidget {
  final IconData iconData;
  final VoidCallback onTap;
  final String? toolTipMessage;
  const CustomIconButton({
    super.key,
    required this.iconData,
    required this.onTap,
    this.toolTipMessage,
  });

  @override
  State<CustomIconButton> createState() => _CustomIconButtonState();
}

class _CustomIconButtonState extends State<CustomIconButton>
    with SingleTickerProviderStateMixin {
  late final AnimationController sizeAnimationController;
  late final Animation<double> animation;

  @override
  void initState() {
    super.initState();
    sizeAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    animation = Tween<double>(begin: 32, end: 46).animate(
        CurvedAnimation(parent: sizeAnimationController, curve: Curves.linear))
      ..addListener(() {
        setState(() {});
      });
  }

  ButtonStatus buttonStatus = ButtonStatus.notSelected;
  Color getConentsColor(BuildContext context) {
    switch (buttonStatus) {
      case ButtonStatus.notSelected:
        return Colors.grey;
      case ButtonStatus.hovered:
        return Theme.of(context).baseTextColor;
      case ButtonStatus.selected:
      default:
        return Theme.of(context).primaryColor;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: InkWell(
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
                    sizeAnimationController.forward();
                  } else {
                    sizeAnimationController.reverse();
                  }
                });
              },
        onTap: buttonStatus == ButtonStatus.selected ? null : widget.onTap,
        child: Tooltip(
          message: widget.toolTipMessage ?? '',
          child: Icon(
            widget.iconData,
            color: getConentsColor(context),
            size: animation.value,
          ),
        ),
      ),
    );
  }
}

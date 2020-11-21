import 'package:flutter/material.dart';
import 'package:helper_widgets/loading_spinner.dart';
import 'package:spending_tracker/app_colors.dart';

class CButton extends MaterialButton {
  const CButton(
      {this.title,
      @required onPressed,
      Key key,
      color = AppColors.primary,
      textColor = Colors.white,
      isElevated = false,
      this.isInverted = false,
      this.child,
      this.showProgress = false,
      this.expanded = true,
      height = 52.0})
      : outline = false,
        assert(child != null || title != null),
        assert(onPressed != null),
        super(
            key: key,
            color: color,
            textColor: textColor,
            elevation: isElevated ? null : 0.0,
            height: height,
            onPressed: onPressed);

  const CButton.outline({
    this.title,
    @required onPressed,
    Key key,
    color = AppColors.primary,
    textColor = Colors.white,
    isElevated = false,
    this.isInverted = false,
    this.child,
    this.showProgress = false,
    height = 48.0,
    this.expanded = true,
  })  : outline = true,
        assert(child != null || title != null),
        assert(onPressed != null),
        super(
            key: key,
            color: color,
            textColor: textColor,
            elevation: isElevated ? 2.0 : null,
            height: height,
            onPressed: onPressed);

  final String title;
  final bool outline;
  final bool isInverted;
  final Widget child;
  final bool showProgress;
  final bool expanded;

  @override
  Widget build(BuildContext context) {
    var shape =
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0));
    if (outline) {
      return SizedBox(
        height: height,
        width: expanded ? double.maxFinite : null,
        child: OutlineButton(
            color: color,
            borderSide: BorderSide(color: color),
            shape: shape,
            onPressed: () {
              if (showProgress) return;
              onPressed();
            },
            child: showProgress
                ? LoadingSpinner(color: color)
                : child != null
                    ? child
                    : Text(
                        title,
                        style: TextStyle(color: color),
                      )),
      );
    }
    return MaterialButton(
        color: isInverted ? AppColors.primary : color,
        minWidth: double.maxFinite,
        height: height,
        elevation: elevation,
        shape: shape,
        onPressed: () {
          if (showProgress) return;
          onPressed();
        },
        child: showProgress
            ? LoadingSpinner(color: isInverted ? color : Colors.white)
            : child != null
                ? child
                : Text(
                    title,
                    style: TextStyle(
                        color: isInverted ? color : textColor ?? Colors.white),
                  ));
  }
}

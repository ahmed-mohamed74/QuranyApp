import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../SharedWidgets/main_divider_widget.dart';

extension BuildContextOperations on BuildContext {
  ThemeData get theme => Theme.of(this);

  double get screenHeight => MediaQuery.of(this).size.height;
  double get screenWidth => MediaQuery.of(this).size.width;
}

extension PaddingListOperations on List<Widget> {
  List<Widget> paddingFrom({
    double? top,
    double? bottom,
    double? right,
    double? left,
  }) {
    return map(
      (listOneChild) => Padding(
        padding: EdgeInsets.only(
          bottom: bottom ?? 0,
          right: right ?? 0,
          left: left ?? 0,
          top: top ?? 0,
        ),
        child: listOneChild,
      ),
    ).toList();
  }

  List<Widget> paddingFromSymmetric({double? vertical, double? horizontal}) {
    return map(
      (e) => Padding(
        padding: EdgeInsetsDirectional.symmetric(
          vertical: vertical ?? 0,
          horizontal: horizontal ?? 0,
        ),
        child: e,
      ),
    ).toList();
  }

  List<Widget> gapPadding({dynamic mainAxisExtent}) {
    return map((child) => Gap(mainAxisExtent)).toList();
  }

  List<Widget> generateDivider({dynamic mainAxisExtent}) {
    return map((child) => const CustomDivider()).toList();
  }
}

extension PaddingExtension on Widget {
  Widget paddingAll(double padding) {
    return Padding(
      padding: EdgeInsets.all(padding),
      child: this,
    );
  }

  Widget paddingHorizontal(double horizontalPadding) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
      child: this,
    );
  }

  Widget paddingVertical(double verticalPadding) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: verticalPadding),
      child: this,
    );
  }

  Widget paddingLeft(double leftPadding) {
    return Padding(
      padding: EdgeInsets.only(left: leftPadding),
      child: this,
    );
  }

  Widget paddingRight(double rightPadding) {
    return Padding(
      padding: EdgeInsets.only(right: rightPadding),
      child: this,
    );
  }

  Widget paddingTop(double topPadding) {
    return Padding(
      padding: EdgeInsets.only(top: topPadding),
      child: this,
    );
  }

  Widget paddingBottom(double bottomPadding) {
    return Padding(
      padding: EdgeInsets.only(bottom: bottomPadding),
      child: this,
    );
  }
}

extension Helpers on String {
  int get toInt => int.parse(this);
}

//TODO:! generate padding using gap  concept
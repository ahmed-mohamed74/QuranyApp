import 'package:flutter/material.dart';

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

  // List<Widget> gapPadding({dynamic mainAxisExtent}) {
  //   return map((e) => Gap(mainAxisExtent)).toList();
  // }
}

extension Helpers on String {
  int get toInt => int.parse(this);
}

//TODO:! generate padding using gap  concept
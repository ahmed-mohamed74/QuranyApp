import 'package:flutter/material.dart';

class CustomSliverAppBar extends StatelessWidget {
  const CustomSliverAppBar({
    super.key,
    required this.title,
    this.isPinned = false,
    this.expandedHeight = 70,
    this.bottomFromTitle = 20,
    this.rightFromTitle = 20,
    this.actions,
    this.bottom,
    this.isCenterTitle = false,
  });

  final String title;

  final bool isPinned;
  final bool isCenterTitle;

  final double expandedHeight;

  final double bottomFromTitle;

  final double rightFromTitle;
  final List<Widget>? actions;
  final PreferredSizeWidget? bottom;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      floating: false,

      stretch: true,
      centerTitle: isCenterTitle,
      forceElevated: true,

      pinned: isPinned,
      actions: actions,
      //TODO: reuse it later same as home widget

      onStretchTrigger: () async {},

      stretchTriggerOffset: 300.0,

      expandedHeight: expandedHeight,
      bottom: bottom,
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: EdgeInsets.fromLTRB(
          0,
          0,
          rightFromTitle,
          bottomFromTitle,
        ),
        title: Text(
          'السبحه',
          style: Theme.of(context).textTheme.titleLarge!,
        ),
      ),
    );
  }
}

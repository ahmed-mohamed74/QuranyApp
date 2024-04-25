import 'package:flutter/material.dart';
import 'package:list_tile_switch/list_tile_switch.dart';

import '../../../../../core/global/app_sizes.dart';

//TODO:!?  From the external package
class ListTileSwitchItem extends StatelessWidget {
  const ListTileSwitchItem({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return ListTileSwitch(
      value: true,
      enabled: true,
      // listTileStyle: ListTileStyle.drawer,
      selected: true,
      leading: Icon(
        Icons.access_alarms,
        color: Theme.of(context).iconTheme.color,
      ),

      onChanged: (value) {},

      visualDensity: VisualDensity.adaptivePlatformDensity,

      switchInactiveColor: Theme.of(context).appBarTheme.backgroundColor,

      switchType: SwitchType.cupertino,

      switchActiveColor: Theme.of(context).primaryColor,

      title: Text(
        text,
        style: Theme.of(context)
            .textTheme
            .headlineLarge!
            .copyWith(fontSize: AppSizes.bodyTextSize),
      ),
    );
  }
}

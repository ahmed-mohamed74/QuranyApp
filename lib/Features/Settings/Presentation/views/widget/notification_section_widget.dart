import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/global/SharedWidgets/main_divider_widget.dart';
import '../../../../../core/global/app_sizes.dart';
import '../../../../../core/global/app_strings.dart';
import 'list_tile_switch_item.dart';
import 'text_inside_container_widget.dart';

class NotifcationSection extends StatelessWidget {
  const NotifcationSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: .99.sh,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColorDark,
        borderRadius: BorderRadius.circular(AppSizes.appCircularBorder),
      ),
      child: const Column(
        children: [
          ListTileSwitchItem(
            text: AppStrings.taf3eelSala3alaElnapy,
          ),
          CustomDivider(),
          ListTileSwitchItem(
            text: 'تفعيل تنبيه الصلاه على النبى ',
          ),
          TextInsideContainer(
            text: 'وقت التنبيه هو 8:00 ص',
          ),
          CustomDivider(),
          ListTileSwitchItem(
            text: 'تفعيل تنبيه الصلاه على النبى ',
          ),
          TextInsideContainer(
            text: 'وقت التنبيه هو 8:00 ص',
          ),
          CustomDivider(),
          ListTileSwitchItem(
            text: 'تفعيل تنبيه الصلاه على النبى ',
          ),
          TextInsideContainer(
            text: 'وقت التنبيه هو 8:00 ص',
          ),
          CustomDivider(),
          ListTileSwitchItem(
            text: 'تفعيل تنبيه الصلاه على النبى ',
          ),
          TextInsideContainer(
            text: AppStrings.wa2tEltanbeh,
          ),
        ],
      ),
    );
  }
}

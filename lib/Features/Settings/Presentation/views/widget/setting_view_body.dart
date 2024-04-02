import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:list_tile_switch/list_tile_switch.dart';

import '../../../../../../core/global/app_sizes.dart';
import '../../../../../core/global/Helpers/url_launcher.dart';
import '../../../../../core/global/SharedWidgets/custom_sliver_app_bar_widget.dart';
import '../../../../../core/global/SharedWidgets/main_divider_widget.dart';
import '../../../../../core/global/app_strings.dart';
import '../../../../../core/global/localization/generated/l10n.dart';

class SettingViewBody extends StatelessWidget {
  const SettingViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      scrollDirection: Axis.vertical,
      physics: const BouncingScrollPhysics(),
      slivers: [
        CustomSliverAppBar(
          title: S.of(context).settingTitle,
        ),
        SliverPadding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSizes.horizentalPadding,
            vertical: AppSizes.verticalPadding,
          ),
          sliver: SliverList(
            delegate: SliverChildListDelegate(
              [
                //! remove compenent : List tile switch
                const NamedIcon(
                  icon: Icons.brightness_1,
                  text: AppStrings.elMazhar,
                ),
                const Gap(
                  14,
                ),
                const ListTileItemWithBackGroundColor(
                  text: AppStrings.elMazhar,
                ),

                const Gap(
                  14,
                ),

                const NamedIcon(
                  icon: Icons.brightness_1,
                  text: AppStrings.shareOurApp,
                ),

                const Gap(
                  14,
                ),

                const NotifcationSection(),

                const Gap(
                  14,
                ),
                const NamedIcon(
                  icon: Icons.brightness_1,
                  text: AppStrings.general,
                ),
                const Gap(
                  14,
                ),
                const ListTileTextWithIcon(
                  icon: Icons.share,
                  text: AppStrings.shareOurApp,
                ),
                const Gap(
                  14,
                ),

                const Gap(
                  14,
                ),
                const NamedIcon(
                  icon: Icons.ac_unit,
                  text: AppStrings.connectWithDeveloper,
                ),

                const Gap(
                  14,
                ),
                ListTileIcon(
                  icon: Icons.face,
                  child: const NamedIcon(
                    areInRow: false,
                    icon: Icons.production_quantity_limits_outlined,
                    text: AppStrings.facebook,
                  ),
                  onTap: () => launchSpecificUrl(
                    context,
                    url: AppStrings.faceBookAccount,
                  ),
                ),

                const Gap(
                  14,
                ),
                const NamedIcon(
                  icon: Icons.ac_unit,
                  text: AppStrings.tabe3na,
                ),
                const Gap(
                  14,
                ),

                ListTileIcon(
                  icon: Icons.face,
                  child: const NamedIcon(
                    areInRow: false,
                    icon: Icons.production_quantity_limits_outlined,
                    text: AppStrings.instaGram,
                  ),
                  onTap: () => launchSpecificUrl(
                    context,
                    url: AppStrings.faceBookAccount,
                  ),
                ),
                const Gap(
                  80,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class NotifcationSection extends StatelessWidget {
  const NotifcationSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600,
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

//! refactor it later
class NamedIcon extends StatelessWidget {
  const NamedIcon({
    super.key,
    required this.icon,
    required this.text,
    this.areInRow = true,
    this.haveSubtitle = false,
    this.subtitleText = '', //! recheck it again later !
  });
  final IconData icon;
  final String text;
  // final CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.center;
  // final MainAxisAlignment mainAxisAlignment = MainAxisAlignment.start;
  final bool areInRow;
  final bool haveSubtitle;
  final String subtitleText;
  @override
  Widget build(BuildContext context) {
    if (areInRow) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(
            icon,
            color: Theme.of(context).iconTheme.color,
          ),
          const Gap(
            10,
          ),
          if (haveSubtitle)
            Column(
              children: [
                Text(
                  subtitleText,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const Gap(5),
                Text(
                  // counter goes here
                  text,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ],
            ),
          Text(
            text,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ],
      );
    } else {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: Theme.of(context).iconTheme.color,
          ),
          const Gap(
            10,
          ),
          Text(
            text,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ],
      );
    }
  }
}

class ListTileIcon extends StatelessWidget {
  const ListTileIcon({
    super.key,
    required this.icon,
    required this.onTap,
    required this.child,
  });
  final IconData icon;

  final void Function()? onTap;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColorDark,
        borderRadius: const BorderRadius.all(
          Radius.circular(AppSizes.appCircularBorder),
        ),
      ),
      child: Center(
        child: child,
      ),
    );
  }
}

class ListTileTextWithIcon extends StatelessWidget {
  const ListTileTextWithIcon({
    super.key,
    required this.text,
    required this.icon,
  });

  final String text;

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColorDark,
        borderRadius: const BorderRadius.all(
          Radius.circular(AppSizes.appCircularBorder),
        ),
      ),
      child: ListTile(
        title: Text(
          text,
          style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                fontSize: AppSizes.bodyTextSize,
              ),
        ),
        trailing: Icon(
          icon,
          color: Theme.of(context).iconTheme.color,
        ),
      ),
    );
  }
}

class TextInsideContainer extends StatelessWidget {
  const TextInsideContainer({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 200,
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
      decoration: const BoxDecoration(
        color: Color(0xff111E2E),
        borderRadius: BorderRadius.all(
          Radius.circular(11),
        ),
      ),
      child: Center(
        child: Text(
          text,
          style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                color: Colors.blueAccent,
              ), //TODO! make it acustom color later
        ),
      ),
    );
  }
}

class ListTileItemWithBackGroundColor extends StatelessWidget {
  const ListTileItemWithBackGroundColor({
    super.key,
    this.height = 60,
    required this.text,
  });

  final double height;

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColorDark,
        borderRadius: BorderRadius.circular(AppSizes.appCircularBorder),
      ),
      child: ListTileSwitchItem(
        text: text,
      ),
    );
  }
}

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

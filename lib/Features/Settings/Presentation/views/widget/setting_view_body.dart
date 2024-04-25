import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../../../core/global/app_sizes.dart';
import '../../../../../core/global/Helpers/url_launcher.dart';
import '../../../../../core/global/SharedWidgets/custom_sliver_app_bar_widget.dart';
import '../../../../../core/global/app_strings.dart';
import '../../../../../core/global/localization/generated/l10n.dart';
import 'list_tile_icon_widget.dart';
import 'list_tile_with_background_color.dart';
import 'list_tile_with_icon.dart';
import 'named_icon.dart';
import 'notification_section_widget.dart';

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
                  icon: Icons.alarm,
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
                  icon: Icons.alarm,
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
                  icon: Icons.alarm,
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
                    icon: Icons.account_circle_outlined,
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

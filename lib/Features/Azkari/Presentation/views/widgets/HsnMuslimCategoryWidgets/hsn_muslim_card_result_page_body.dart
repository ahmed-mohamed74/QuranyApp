import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../../../../../core/global/Helpers/extensions.dart';
import '../../../../../../core/global/SharedWidgets/main_divider_widget.dart';
import '../../../../../../core/global/app_sizes.dart';
import '../../../../../../core/global/themes/AppColors/app_colors_dark.dart';
import '../../../../data/models/zekr_model.dart';
import 'page_indicator_widget.dart';

class HsnMuslimCardResultPageBody extends StatefulWidget {
  final List<ZekrModel> zekrList;
  const HsnMuslimCardResultPageBody({
    super.key,
    required this.zekrList,
  });

  @override
  State<HsnMuslimCardResultPageBody> createState() =>
      _HsnMuslimCardResultPageBodyState();
}

class _HsnMuslimCardResultPageBodyState
    extends State<HsnMuslimCardResultPageBody> {
  late PageController pageController;

  @override
  void initState() {
    pageController = PageController();

    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: AppSizes.pageViewBuildervertical,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          PageIndicator(pageController: pageController),
          SizedBox(
            // width: double.infinity,
            height: context.screenHeight * .825,
            child: PageView(
              physics: const BouncingScrollPhysics(),

              //! can be scrollable in order to fix long zekr

              onPageChanged: (value) {},

              controller: pageController,

              //!FIX change it when handling dealing with data with data base or api

              children: [
                ...List.generate(
                  5,
                  (index) => const Page1(),
                ),
              ].paddingFromSymmetric(horizontal: 3),
            ),
          ),
        ].paddingFrom(bottom: .001.sh),
      ),
    );
  }
}

class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.screenHeight - context.screenHeight * .2,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 20,
      ),
      decoration: const BoxDecoration(
        color: AppColorsDark.schemeColor,
        borderRadius: BorderRadius.all(
          Radius.circular(
            AppSizes.appCircularBorder,
          ),
        ),
      ),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.start,

        // crossAxisAlignment: ,

        children: [
          Text(
            'أَعُوذُ بِاللهِ مِنْ الشَّيْطَانِ الرَّجِيمِ\n\nاللّهُ لاَ إِلَـهَ إِلاَّ هُوَ الْحَيُّ الْقَيُّومُ لاَ تَأْخُذُهُ سِنَةٌ وَلاَ نَوْمٌ لَّهُ مَا فِي السَّمَاوَاتِ وَمَا فِي الأَرْضِ مَن ذَا الَّذِي يَشْفَعُ عِنْدَهُ إِلاَّ بِإِذْنِهِ يَعْلَمُ مَا بَيْنَ أَيْدِيهِمْ وَمَا خَلْفَهُمْ وَلاَ يُحِيطُونَ بِشَيْءٍ مِّنْ عِلْمِهِ إِلاَّ بِمَا شَاء وَسِعَ كُرْسِيُّهُ السَّمَاوَاتِ وَالأَرْضَ وَلاَ يَؤُودُهُ حِفْظُهُمَا وَهُوَ الْعَلِيُّ الْعَظِيمُ.\n\n[آية الكرسى - البقرة 255].',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          //   const Spacer(),
          CircularPercentIndicator(
            radius: 20.0,
            lineWidth: 8.0,
            percent: 0.5,
            backgroundColor: AppColorsDark.primaryColor.withOpacity(.3),
            progressColor: AppColorsDark.primaryColor,
          ),
          const CustomDivider(),
          const Gap(200),
          const Center(
            child: Icon(
              Icons.share,
            ),
          ),
        ].paddingFrom(
          left: 20,
          right: 20,
          top: 20,
          bottom: 20,
        ),
      ),
    );
  }
}

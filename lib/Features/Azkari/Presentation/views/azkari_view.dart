import 'package:flutter/material.dart';

import '../../../../core/global/Helpers/extensions.dart';
import '../../../../core/global/Helpers/generate_random_strings.dart';
import '../../../../core/global/app_sizes.dart';
import '../../../../core/global/app_strings.dart';
import 'widgets/AzkarModafaCategoryWidgets/azkar_modafa_list_widget.dart';
import 'widgets/HsnMuslimCategoryWidgets/hsn_muslim_list_widget.dart';

class AzkariView extends StatefulWidget {
  const AzkariView({super.key});

  @override
  State<AzkariView> createState() => _AzkariViewState();
}

class _AzkariViewState extends State<AzkariView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  late int _selectedTabIndex =
      0; // Initial tab index, assuming AzkarModafaMainScrollingList is the default.

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener((_setActiveTabIndex));
  }

  _setActiveTabIndex() {
    _selectedTabIndex = _tabController.index;
    setState(() {});
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      animationDuration: const Duration(
        microseconds: 20,
      ),
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: _selectedTabIndex == 1
            ? Padding(
                padding: const EdgeInsets.only(bottom: 50),
                child: FloatingActionButton(
                  onPressed: () {},
                  heroTag: generateRandomNumber(),
                  child: const Icon(
                    Icons.add,
                  ),
                ),
              )
            : null,
        appBar: AppBar(
          //! can be refactored later , with custom_sliver app bar widget
          toolbarHeight: 70,
          elevation: 0,
          titleSpacing: 30,
          backgroundColor: const Color(0xff1C191C),
          title: Text(
            AppStrings.alAzkar,
            style: Theme.of(context).textTheme.titleLarge!,
          ),
          actions: [
            SizedBox(
              height: 30,
              width: 60,
              child: Icon(
                Icons.search, // To change
                color: Theme.of(context).iconTheme.color,
                size: AppSizes.appIconsSize,
              ),
            ),
          ],
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
          ),
          bottom: TabBar(
            indicatorSize: TabBarIndicatorSize.label,
            controller: _tabController,
            indicatorColor:
                context.theme.indicatorColor, //! to change dynamically
            indicatorWeight: 6,
            labelColor: Colors.transparent,
            dividerHeight: 0,
            splashFactory: NoSplash.splashFactory,
            physics: const ClampingScrollPhysics(),
            tabs: [
              Padding(
                padding: const EdgeInsets.only(bottom: 15.0),
                child: Text(
                  AppStrings.hesnElMoslim,
                  style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                        fontSize: 20,
                      ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 15.0),
                child: Text(
                  AppStrings.azkarMoadafa,
                  style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                        fontSize: 20,
                      ),
                ),
              ),
            ],
            onTap: (value) {},
          ),
        ),
        body: TabBarView(
          physics: const ClampingScrollPhysics(),
          controller: _tabController,
          clipBehavior: Clip.antiAlias,
          children: const [
            HsnMuslimMainScrollingList(),
            AzkarModafaMainScrollingList(),
          ],
        ),
      ),
    );
  }
}

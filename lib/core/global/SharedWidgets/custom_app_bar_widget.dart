import 'package:flutter/material.dart';

import '../themes/AppColors/app_colors_dark.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    required this.title,
    this.actions,
    this.hasLeading = false,
    this.leadingOnTap,
  });

  final String title;

  final List<Widget>? actions;

  final bool hasLeading;
  final void Function()? leadingOnTap;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      leading: hasLeading
          ? InkWell(
              onTap: leadingOnTap,
              child: const Icon(
                Icons.arrow_back_ios,
                color: Colors.white, //Theme.of(context).iconTheme.color,
              ),
            )
          : null,
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleLarge,
      ),
      actions: [
        SizedBox(
          height: 50,
          width: 50,
          child: ElevatedButton(
            onPressed: () {},
            style: const ButtonStyle(
              // //! to change it later
              // visualDensity: VisualDensity.comfortable,
              padding: MaterialStatePropertyAll(
                EdgeInsets.all(10),
              ),
              backgroundColor: MaterialStatePropertyAll(
                AppColorsDark.buttonColor,
              ),
            ),
            child: Center(
              child: Text(
                'حفظ',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override

  // TODO: implement preferredSize

  Size get preferredSize => const Size.fromRadius(35);
}

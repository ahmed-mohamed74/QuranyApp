import 'package:flutter/material.dart';

class ListTileSharedWidget extends StatelessWidget {
  const ListTileSharedWidget({
    super.key,
    this.onTap,
    this.subTitle = '',
    required this.title,
    required this.leadingIcon,
  });

  final void Function()? onTap;

  final String title;

  final String subTitle;

  final IconData leadingIcon;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      //contentPadding: EdgeInsetsDirectional.zero, //!ToChange: remove this
      leading: Icon(
        leadingIcon,
        color: Theme.of(context).iconTheme.color,
      ),
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleLarge,
      ),
      subtitle: Padding(
        padding: const EdgeInsets.only(
          top: 8,
        ),
        child: Text(
          subTitle,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      onTap: onTap,
    );
  }
}

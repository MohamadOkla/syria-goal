import 'package:flutter/material.dart';
import 'package:syriagoal/utils/constant.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String appBarTitle;
  final Widget? leadingIcon; 

  const AppBarWidget({
    Key? key,
    required this.appBarTitle,
    this.leadingIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 85,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.notifications, color: Colors.white),
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('لا توجد إشعارات جديدة'),
                duration: Duration(seconds: 2),
              ),
            );
          },
        )
      ],
      backgroundColor: Constant.primaryColor,
      leading: leadingIcon ??
          Builder(
            builder: (context) => IconButton(
              icon: const Icon(Icons.sports_soccer, color: Colors.white),
              onPressed: () => Scaffold.of(context).openDrawer(),
            ),
          ),
      title: Text(
        appBarTitle,
        style: const TextStyle(
          fontWeight: FontWeight.w400,
          color: Colors.white,
          shadows: [
            Shadow(
              color: Colors.black54,
              offset: Offset(1, 1),
              blurRadius: 2,
            ),
          ],
        ),
      ),
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(85);
}

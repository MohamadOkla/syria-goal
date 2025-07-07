import 'package:flutter/material.dart';

class ListtileDrawer extends StatelessWidget {
  final Icon listTileIcon;
  final String listTileTitle;
  final VoidCallback? onTap;
  final Color? textColor;

  const ListtileDrawer({
    super.key,
    required this.listTileIcon,
    required this.listTileTitle,
    this.onTap, this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        splashColor: Colors.green,
        onTap: onTap ?? () => Navigator.pop(context),
        child: ListTile(
          leading: Icon(
            listTileIcon.icon,
            color: Colors.green,
            size: 28,
          ),
          title: Text(
            listTileTitle,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 16),
          horizontalTitleGap: 8,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}

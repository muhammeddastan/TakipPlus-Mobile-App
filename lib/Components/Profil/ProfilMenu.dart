// ignore_for_file: file_names

import "package:flutter/material.dart";
import 'package:takip_plus/Colors/Renkler.dart';

class ProfileMenuWidget extends StatelessWidget {
  const ProfileMenuWidget({
    super.key,
    required this.title,
    required this.icon,
    // ignore: non_constant_identifier_names
    required this.OnPress,
    this.endIcon = true,
    this.textColor,
    required,
  });

  final String title;
  final IconData icon;
  // ignore: non_constant_identifier_names
  final VoidCallback OnPress;
  final bool endIcon;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 5,
      ),
      child: ListTile(
        onTap: OnPress,
        leading: Container(
          width: 35,
          height: 35,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: Renkler.Green.withOpacity(0.1),
          ),
          child: Icon(
            icon,
            color: Renkler.Green,
          ),
        ),
        title: Text(
          title,
          style: const TextStyle(
            color: Renkler.Grey,
            fontWeight: FontWeight.w500,
          ).apply(color: textColor),
        ),
        trailing: endIcon
            ? Container(
                width: 21,
                height: 21,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Renkler.Grey.withOpacity(0.1),
                ),
                child: const Icon(
                  Icons.arrow_forward_ios,
                  color: Renkler.Grey,
                  size: 14.0,
                ))
            : null,
      ),
    );
  }
}

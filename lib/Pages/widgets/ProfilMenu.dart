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
      padding: const EdgeInsets.only(left: 5, top: 5),
      child: ListTile(
        onTap: OnPress,
        leading: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: Renkler.BlueDark.withOpacity(0.1),
          ),
          child: Icon(
            icon,
            color: Renkler.Blue,
          ),
        ),
        title: Text(
          title,
          style: const TextStyle(
            color: Renkler.Grey,
            fontWeight: FontWeight.w700,
          ).apply(color: textColor),
        ),
        trailing: endIcon
            ? Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Renkler.Grey.withOpacity(0.1),
                ),
                child: const Icon(
                  Icons.arrow_forward_ios,
                  color: Renkler.Grey,
                  size: 18.0,
                ))
            : null,
      ),
    );
  }
}

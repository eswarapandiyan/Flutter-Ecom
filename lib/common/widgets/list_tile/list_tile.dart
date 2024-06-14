import 'package:flutter/material.dart';
import 'package:my_store/utils/constants/colors.dart';

class SettingListTile extends StatelessWidget {
  const SettingListTile(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.icon,
      this.trailing,
      this.onTap});
  final String title, subtitle;
  final IconData icon;
  final Widget? trailing;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleMedium,
      ),
      leading: Icon(
        icon,
        size: 23,
        color: TColors.primary,
      ),
      subtitle: Text(
        subtitle,
        style: Theme.of(context).textTheme.labelMedium,
      ),
      trailing: trailing,
      onTap: onTap,
    );
  }
}

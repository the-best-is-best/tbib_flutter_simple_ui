import 'package:flutter/material.dart';
import 'package:tbib_flutter_simple_ui/tbib_flutter_simple_ui.dart';

/// render list tile
class MyListTile extends StatelessWidget {
  /// render list tile
  const MyListTile({
    required this.title,
    super.key,
    this.trailing,
    this.leading,
    this.onTap,
  });

  /// title
  final String title;

  /// trailing
  final Widget? trailing;

  /// leading
  final Widget? leading;

  /// onTap
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: leading,
      title: Text(
        title,
        style: getRegularStyle(color: Colors.black),
      ),
      trailing: trailing,
      onTap: onTap,
    );
  }
}

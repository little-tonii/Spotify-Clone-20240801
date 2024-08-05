import 'package:flutter/material.dart';
import 'package:spotify_clone/common/helpers/is_dark_mode.dart';

class BasicAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? title;
  final bool hideBack;

  const BasicAppBar({
    super.key,
    this.title,
    this.hideBack = false,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: title != null ? true : null,
      title: title,
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: hideBack
          ? null
          : IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  color: context.isDarkMode
                      ? Colors.white.withOpacity(0.03)
                      : Colors.black.withOpacity(0.04),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.arrow_back_ios_new,
                  size: 16,
                  color: context.isDarkMode ? Colors.white : Colors.black,
                ),
              ),
            ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

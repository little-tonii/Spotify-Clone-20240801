import 'package:flutter/material.dart';
import 'package:spotify_clone/core/configs/theme/app_colors.dart';

class BasicAppButton extends StatelessWidget {
  final void Function() onPressed;
  final String title;
  final double? height;

  const BasicAppButton({
    super.key,
    required this.onPressed,
    required this.title,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: Size.fromHeight(height ?? 80),
        foregroundColor: AppColors.lightBackground,
      ),
      child: Text(title),
    );
  }
}

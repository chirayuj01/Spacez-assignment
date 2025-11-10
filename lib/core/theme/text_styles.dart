import 'package:flutter/material.dart';
import 'package:spacez/core/theme/app_colors.dart';

class TextStyles {
  TextStyles._();

  static const TextStyle appBarLogo = TextStyle(
    color: AppColors.primaryBrown,
    fontSize: 20,
    fontWeight: FontWeight.w600,
    letterSpacing: 1.2,
  );

  static final TextTheme textTheme = TextTheme(
    titleLarge: appBarLogo,
    titleMedium: const TextStyle(color: AppColors.textDark, fontSize: 18, fontWeight: FontWeight.w700),
    bodyMedium: const TextStyle(color: AppColors.textGrey, fontSize: 14),
    bodySmall: const TextStyle(color: AppColors.textGrey, fontSize: 13),
  );
}

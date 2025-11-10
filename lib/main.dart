import 'package:flutter/material.dart';
import 'package:spacez/views/coupons_page.dart';
import 'package:spacez/viewmodels/coupon_viewmodel.dart';
import 'package:spacez/core/theme/app_colors.dart';
import 'package:spacez/core/theme/text_styles.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Spacez - Coupons',
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.background,
        primaryColor: AppColors.primaryBrown,
        colorScheme: ColorScheme.fromSwatch().copyWith(primary: AppColors.primaryBrown),
        textTheme: TextStyles.textTheme,
      ),
      home: CouponsPage(viewModel: CouponViewModel()),
    );
  }
}

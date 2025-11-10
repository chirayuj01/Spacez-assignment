import 'package:flutter/material.dart';
import 'package:spacez/core/theme/app_colors.dart';
import 'package:spacez/core/constants/strings.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.white,
      elevation: 0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SizedBox(
                height: 28,
                child: Image.asset(
                  'assets/image/logo.png',
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) {
                    return const Text('SPACEZ', style: TextStyle(fontWeight: FontWeight.w800, color: Color(0xFF4B4E4B)));
                  },
                ),
              ),
            ],
          ),
          InkWell(
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Menu clicked')));
            },
              child: Icon(Icons.menu, color: AppColors.primaryBrown)),
        ],
      ),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(48),
        child: Container(
          color: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          child: Row(
            children: [
              InkWell(
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Back clicked')));
                  Navigator.of(context).maybePop();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

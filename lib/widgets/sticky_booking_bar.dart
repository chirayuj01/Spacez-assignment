import 'package:flutter/material.dart';
import 'package:spacez/core/theme/app_colors.dart';

class StickyBookingBar extends StatelessWidget {
  final VoidCallback? onReserve;
  const StickyBookingBar({super.key, this.onReserve});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            color: AppColors.bannerGreen,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.star, color: Colors.white, size: 18),
                  SizedBox(width: 8),
                  Text(
                    'Book now & Unlock exclusive rewards!',
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Flexible(
                                  child: Text(
                                    '₹19,500',
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(color: AppColors.priceRed, decoration: TextDecoration.lineThrough),
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Flexible(
                                  child: Text(
                                    '₹16,000',
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(fontWeight: FontWeight.w800, color: AppColors.textDark),
                                  ),
                                ),
                              ],
                            ),

                            const SizedBox(width: 8),

                            ConstrainedBox(
                              constraints: const BoxConstraints(maxWidth: 120),
                              child: const Text(
                                'for 2 nights',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(color: AppColors.textGrey, fontSize: 12),
                              ),
                            ),
                          ],
                        ),


                        const SizedBox(height: 6),

                        Row(
                          children: [
                            Text('24 Apr - 26 Apr | 8 guests', style: const TextStyle(color: AppColors.textGrey, fontSize: 12), overflow: TextOverflow.ellipsis),
                            SizedBox(width: 8,),
                            InkWell(
                              onTap: () {
                                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Edit clicked')));
                              },
                              child: const Icon(Icons.edit, size: 16, color: AppColors.textGrey),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  SizedBox(
                    width: 110,
                    height: 44,
                    child: ElevatedButton(
                      onPressed: onReserve,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryBrown,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                      ),
                      child: const FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text('Reserve', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

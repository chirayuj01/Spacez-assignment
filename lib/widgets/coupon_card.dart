// Responsive, stable CouponCard implementation to avoid render overflow on small screens.
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:spacez/models/coupon.dart';
import 'package:spacez/core/theme/app_colors.dart';
import 'package:spacez/core/constants/strings.dart';

class CouponCard extends StatelessWidget {
  final Coupon coupon;
  final VoidCallback? onApply;

  const CouponCard({super.key, required this.coupon, this.onApply});

  Widget _buildDashedDivider() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(13, (i) {
        return Container(
          width: 2,
          height: 6,
          margin: const EdgeInsets.symmetric(vertical: 2),
          color: Colors.white,
        );
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final cardHeight = min(180.0, max(130.0, screenHeight * 0.18));
    final descMaxLines = cardHeight > 150 ? 5 : 4;

    return Container(
      decoration: BoxDecoration(
        color: AppColors.primaryBrown,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          // Left brown strip with rotated price
          Container(
            width: 72,
            height: cardHeight,
            decoration: const BoxDecoration(
              color: AppColors.primaryBrown,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8),
                bottomLeft: Radius.circular(8),
              ),
            ),
            child: Center(
              child: RotatedBox(
                quarterTurns: 3,
                child: Text(
                  coupon.priceText,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                    fontSize: 24, // bigger price text
                    letterSpacing: 1.0,
                  ),
                ),
              ),
            ),
          ),

          // dashed divider
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 1,vertical: 1),
            child: SizedBox(height: cardHeight - 24, child: _buildDashedDivider(),),
          ),

          // Right content area (white inner panel) to match image with pink border around
          Expanded(
            child: Container(
              height: cardHeight,
              decoration: BoxDecoration(
                color: Color(0xFFFDF9F7),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(8),
                  bottomRight: Radius.circular(8),
                ),
              ),
              padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Text(
                          coupon.title.toUpperCase(),
                          style: const TextStyle(
                            fontSize: 18, // slightly larger title
                            fontWeight: FontWeight.w800,
                            color: Color(0xFF4B4E4B), // title colored like price strip
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      InkWell(
                        onTap: onApply,
                        child: Row(
                          children: const [
                            Icon(Icons.local_offer_outlined, size: 18, color: AppColors.primaryBrown),
                            SizedBox(width: 6),
                            Text(AppStrings.apply, style: TextStyle(color: AppColors.primaryBrown, fontWeight: FontWeight.w700)),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  // Description area - allow it to grow but avoid overflow via maxLines and Flexible
                  Flexible(
                    child: Text(
                      coupon.description,
                      maxLines: descMaxLines,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(color: AppColors.textGrey, fontSize: 14, height: 1.4),
                    ),
                  ),

                  const SizedBox(height: 12),
                  const Divider(color: Colors.grey, thickness: 0.5, height: 0.5,),
                  const SizedBox(height: 8),
                  const Text(AppStrings.readMore, style: TextStyle(color: AppColors.textGrey, fontSize: 13, fontWeight: FontWeight.w600)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

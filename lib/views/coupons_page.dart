import 'package:flutter/material.dart';
import 'package:spacez/viewmodels/coupon_viewmodel.dart';
import 'package:spacez/widgets/custom_app_bar.dart';
import 'package:spacez/widgets/coupon_card.dart';
import 'package:spacez/widgets/sticky_booking_bar.dart';
import 'package:spacez/core/constants/strings.dart';

class CouponsPage extends StatefulWidget {
  final CouponViewModel viewModel;
  const CouponsPage({super.key, required this.viewModel});

  @override
  State<CouponsPage> createState() => _CouponsPageState();
}

class _CouponsPageState extends State<CouponsPage> {
  void _showMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    final coupons = widget.viewModel.coupons;
    // height of the sticky booking bar widget
    const double bottomBarHeight = 120.0;
    final bottomSafeArea = MediaQuery.of(context).viewPadding.bottom;
    final listBottomPadding = bottomBarHeight + bottomSafeArea + 12.0;

    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(92),
        child: CustomAppBar(),
      ),
      body: Stack(
        children: [
          // Main scrollable content
          ListView(
            padding: EdgeInsets.fromLTRB(16, 12, 16, listBottomPadding),
            children: [
              const SizedBox(height: 8),

              // General coupons
              for (final c in coupons)
                Padding(
                  padding: const EdgeInsets.only(bottom: 12.0),
                  child: CouponCard(
                    coupon: c,
                    onApply: () {
                      final msg = widget.viewModel.applyCoupon(c.id);
                      _showMessage(msg);
                    },
                  ),
                ),

              const SizedBox(height: 8),
              const Text(AppStrings.paymentOffers, style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16)),
              const SizedBox(height: 12),

              // Payment offers (reuse same mock data)
              for (final c in coupons)
                Padding(
                  padding: const EdgeInsets.only(bottom: 12.0),
                  child: CouponCard(
                    coupon: c,
                    onApply: () {
                      final msg = widget.viewModel.applyCoupon(c.id);
                      _showMessage(msg);
                    },
                  ),
                ),
            ],
          ),

          // Positioned sticky booking bar overlay
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: SafeArea(
              top: false,
              child: SizedBox(
                height: bottomBarHeight,
                child: StickyBookingBar(
                  onReserve: () {
                    final msg = widget.viewModel.reserve();
                    _showMessage(msg);
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

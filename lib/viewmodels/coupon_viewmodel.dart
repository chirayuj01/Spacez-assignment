import 'package:flutter/foundation.dart';
import '../models/coupon.dart';

class CouponViewModel extends ChangeNotifier {
  final List<Coupon> _coupons = [
    const Coupon(
      id: '1',
      code: 'LONGSTAY',
      title: 'LONGSTAY',
      description: '15% off when you book for 5 days or more and 20% off when you book for 30 days or more.',
      priceText: '₹6,900',
    ),
    const Coupon(
      id: '2',
      code: 'WEEKEND',
      title: 'WEEKEND',
      description: '10% off for weekend bookings. Applicable on select properties.',
      priceText: '₹2,500',
    ),
    const Coupon(
      id: '3',
      code: 'PAYMENT',
      title: 'PAYMENT',
      description: 'Exclusive payment partner offer for limited period.',
      priceText: '₹900',
    ),
  ];

  List<Coupon> get coupons => List.unmodifiable(_coupons);

  String applyCoupon(String id) {
    // In a real app, this would perform logic and update state.
    return 'Coupon Applied Successfully!';
  }

  String reserve() {
    return 'Reservation clicked';
  }
}


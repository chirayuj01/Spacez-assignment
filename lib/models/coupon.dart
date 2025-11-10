class Coupon {
  final String id;
  final String code;
  final String title;
  final String description;
  final String priceText; // shown on left brown strip
  final String? oldPriceText;

  const Coupon({
    required this.id,
    required this.code,
    required this.title,
    required this.description,
    required this.priceText,
    this.oldPriceText,
  });
}


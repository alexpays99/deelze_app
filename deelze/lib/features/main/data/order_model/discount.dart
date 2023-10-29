import 'package:freezed_annotation/freezed_annotation.dart';

part 'discount.freezed.dart';
part 'discount.g.dart';

@freezed
class Discount with _$Discount {
  factory Discount({
    String? type,
    int? value,
  }) = _Discount;

  factory Discount.fromJson(Map<String, dynamic> json) =>
      _$DiscountFromJson(json);
}

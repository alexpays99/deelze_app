import 'package:freezed_annotation/freezed_annotation.dart';

import 'discount.dart';

part 'item.freezed.dart';
part 'item.g.dart';

@freezed
class Item with _$Item {
  factory Item({
    @JsonKey(name: 'QTY') int? qty,
    double? price,
    String? name,
    String? nameAr,
    String? notes,
    String? option,
    String? serving,
    bool? isOffer,
    List<dynamic>? ing,
    bool? isShared,
    String? logo,
    @JsonKey(name: 'VAT') int? vat,
    Discount? discount,
    @JsonKey(name: 'total_price') double? totalPrice,
  }) = _Item;

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);
}

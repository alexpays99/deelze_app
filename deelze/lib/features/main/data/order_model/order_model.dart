import 'package:freezed_annotation/freezed_annotation.dart';

import 'footer.dart';
import 'item.dart';

part 'order_model.freezed.dart';
part 'order_model.g.dart';

@freezed
class OrderModel with _$OrderModel {
  factory OrderModel({
    String? orderNumber,
    String? orderTime,
    String? tableNumber,
    String? deliveryMethod,
    String? paymentMethod,
    String? paymentStatus,
    List<Item>? items,
    Footer? footer,
  }) = _OrderModel;

  factory OrderModel.fromJson(Map<String, dynamic> json) =>
      _$OrderModelFromJson(json);
}

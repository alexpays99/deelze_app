import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'restaurant.freezed.dart';
part 'restaurant.g.dart';

@freezed
class Restaurant with _$Restaurant {
  factory Restaurant({
    String? id,
    String? image,
    String? title,
    String? type,
    String? details,
    String? recomendations,
    List<Restaurant>? relatedRecipes,
  }) = _Restaurant;

  factory Restaurant.fromJson(Map<String, Object?> json) =>
      _$RestaurantFromJson(json);

  // factory Restaurant.fromSnapshot(
  //     DocumentSnapshot<Map<String, dynamic>> document) {
  //   return Restaurant(
  //     id: document.data()!,
  //   );
  // }
}

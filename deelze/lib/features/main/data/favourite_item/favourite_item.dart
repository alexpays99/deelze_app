import 'package:deelze/core/keys/hive_adapters.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'favourite_item.freezed.dart';
part 'favourite_item.g.dart';

@freezed
class FavouriteItemModel with _$FavouriteItemModel {
  @HiveType(typeId: 1, adapterName: HiveAdapters.favouriteItemAdapter)
  factory FavouriteItemModel({
    @HiveField(0) required String title,
    @HiveField(1) required String vaucher,
    @HiveField(2) required String image,
  }) = _FavouriteItemModel;

  factory FavouriteItemModel.fromJson(Map<String, Object?> json) =>
      _$FavouriteItemModelFromJson(json);

  // factory FavouriteItemModel.fromHive(FavouriteItemModel item) => FavouriteItemModel(
  //       title: item,
  //       englishTitle: item.englishTitle,
  //       calories: item.calories,
  //       ingredients: item.ingredients,
  //       directions: item.directions,
  //       image: item.image,
  //       totalWeight: item.totalWeight,
  //     );

  // factory FavouriteItemModel.toHive(FavouriteItemModel item) => FavouriteItemModel(
  //       title: item.title,
  //       englishTitle: item.englishTitle,
  //       calories: item.calories,
  //       ingredients: item.ingredients,
  //       directions: item.directions,
  //       image: item.image,
  //       totalWeight: item.totalWeight,
  //     );
}

// class FavouriteItemModel {
//   @HiveType(typeId: 1, adapterName: HiveAdapters.favouriteItemAdapter)
//   FavouriteItemModel({
//     required String title,
//     required int calories,
//     required List<dynamic> ingredients,
//     required List<String> directions,
//     required String? image,
//     required double? totalWeight,
//     String? englishTitle,
//   });

//   @HiveField(0)
//   String? title;
//   @HiveField(1)
//   int? calories;
//   @HiveField(2)
//   List<dynamic>? ingredients;
//   @HiveField(3)
//   List<String>? directions;
//   @HiveField(4)
//   String? image;
//   @HiveField(5)
//   double? totalWeight;
//   @HiveField(6)
//   String? englishTitle;

//   // factory FavouriteItemModel.fromHive(FavouriteItemModel item) => FavouriteItemModel(
//   //       title: item,
//   //       englishTitle: item.englishTitle,
//   //       calories: item.calories,
//   //       ingredients: item.ingredients,
//   //       directions: item.directions,
//   //       image: item.image,
//   //       totalWeight: item.totalWeight,
//   //     );

//   // factory FavouriteItemModel.toHive(FavouriteItemModel item) => FavouriteItemModel(
//   //       title: item.title,
//   //       englishTitle: item.englishTitle,
//   //       calories: item.calories,
//   //       ingredients: item.ingredients,
//   //       directions: item.directions,
//   //       image: item.image,
//   //       totalWeight: item.totalWeight,
//   //     );
// }

import 'package:deelze/core/keys/box_names.dart';
import 'package:deelze/features/main/data/favourite_item/favourite_item.dart';
import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveService {
  ValueListenable<Box>? getBoxListenable() {
    try {
      Hive.openBox(BoxName.favouriteItems).then((_) {
        final box = Hive.box(BoxName.favouriteItems);
        final valueNotifier = ValueNotifier<Box>(box);
        return valueNotifier;
      });
    } catch (e) {
      print(e);
    }
    return null;
  }

  Future<List<FavouriteItemModel>> readRecipesFromBox() async {
    try {
      final box = await Hive.openBox(BoxName.favouriteItems);
      final favouriteItemsList = box.values.map((e) {
        return e as FavouriteItemModel;
      }).toList();
      print(
          'Amount favourite items in Box:${favouriteItemsList.length};\FavouriteItemsList List From Box: $favouriteItemsList');
      return favouriteItemsList;
    } catch (e) {
      print(e);
      return [];
    }
  }

  Future<void> insert(FavouriteItemModel recipeModel) async {
    final box = await Hive.openBox(BoxName.favouriteItems);
    box.add(recipeModel);
    final favouriteItemsBox = await Hive.openBox(BoxName.favouriteItems);
    favouriteItemsBox.values.forEach((item) {
      print(item.toString());
    });
  }

  Future<void> delete(int index) async {
    final box = await Hive.openBox(BoxName.favouriteItems);
    box.deleteAt(index);
    final favouriteItemsList = box.values.map((e) {
      return e as FavouriteItemModel;
    }).toList();
    print('Amount favourite items in Box:${favouriteItemsList.length}');
  }
}

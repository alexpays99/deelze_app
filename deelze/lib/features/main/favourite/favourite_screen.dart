import 'package:deelze/core/keys/box_names.dart';
import 'package:deelze/core/presentation/widgets/vaucher_list_item_widget.dart';
import 'package:deelze/features/main/data/favourite_item/favourite_item.dart';
import 'package:deelze/features/main/home/widgets/greating_section.dart';
import 'package:deelze/navigation/router_paths.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/hive_flutter.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ValueListenable<Box<dynamic>> boxListener =
        Hive.box(BoxName.favouriteItems).listenable();
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const GreatingSection(
              image: "assets/images/logo.png",
            ),
            ValueListenableBuilder(
              valueListenable: boxListener,
              builder: (context, value, child) {
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: Hive.box(BoxName.favouriteItems).length,
                  itemBuilder: (context, index) {
                    final recipe = value;
                    final favouriteItems =
                        recipe.getAt(index) as FavouriteItemModel;
                    return Padding(
                      padding: const EdgeInsets.only(
                        left: 20.0,
                        right: 20.0,
                        bottom: 20,
                      ),
                      child: GestureDetector(
                        onTap: () {
                          // context.push(
                          //     "${RoutePaths.authWrapper}/${RoutePaths.vaucherInfo}");
                        },
                        child: VaucherListItemWidget(
                          title: favouriteItems.title,
                          vaucher: favouriteItems.vaucher,
                          image: favouriteItems.image,
                          price: '190 EGP',
                          favouriteButtonVisibile: false,
                          index: index,
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

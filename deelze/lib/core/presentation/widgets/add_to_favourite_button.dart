import 'package:deelze/features/main/data/favourite_item/favourite_item.dart';
import 'package:flutter/material.dart';

class AddToFavouriteButton extends StatefulWidget {
  const AddToFavouriteButton({
    super.key,
    required this.favouriteItem,
    required this.index,
    this.isFavourite = false,
    required this.onPressed,
  });

  final FavouriteItemModel favouriteItem;
  final int index;
  final bool isFavourite;
  final void Function() onPressed;

  @override
  State<AddToFavouriteButton> createState() => _AddToFavouriteButtonState();
}

class _AddToFavouriteButtonState extends State<AddToFavouriteButton> {
  // bool _isFavourite = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => widget.onPressed(),
      // onPressed: () {
      //   setState(() {
      //     _isFavourite = !_isFavourite;
      //   });
      // if (_isFavourite) {
      //   getIt.get<HiveService>().insert(widget.favouriteItem);
      // } else {
      //   getIt.get<HiveService>().delete(widget.index);
      // }
      // },
      icon: widget.isFavourite
          ? const Icon(
              Icons.favorite,
              color: Color.fromARGB(255, 243, 137, 8),
            )
          : const Icon(
              Icons.favorite_outline_rounded,
              color: Color.fromARGB(255, 255, 167, 161),
            ),
      // Icon(
      //   _isFavourite ? Icons.favorite : Icons.favorite_outline,
      //   color: _isFavourite
      //       ? const Color.fromARGB(255, 243, 137, 8)
      //       : const Color.fromARGB(255, 255, 167, 161),
      // ),
    );
  }
}

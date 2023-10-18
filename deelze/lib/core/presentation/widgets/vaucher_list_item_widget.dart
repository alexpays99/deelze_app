import 'package:flutter/material.dart';

class VaucherListItemWidget extends StatefulWidget {
  const VaucherListItemWidget({
    super.key,
    required this.title,
    required this.vaucher,
    required this.price,
    required this.image,
    required this.favouriteButtonVisibile,
    this.hasQrCode,
    this.onTap,
  });
  final String title;
  final String vaucher;
  final String price;
  final String image;
  final bool favouriteButtonVisibile;
  final bool? hasQrCode;
  final void Function()? onTap;

  @override
  State<VaucherListItemWidget> createState() => _VaucherListItemWidgetState();
}

class _VaucherListItemWidgetState extends State<VaucherListItemWidget> {
  bool isFavourite = false;
  bool _qrCodeIncreased = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: 124,
          decoration: BoxDecoration(
            color: const Color.fromRGBO(239, 239, 239, 100),
            borderRadius: BorderRadius.circular(24),
          ),
          child: Row(
            children: [
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      widget.title,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.w800,
                            color: const Color.fromRGBO(7, 106, 127, 1),
                          ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      widget.vaucher,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.w900,
                            color: const Color.fromRGBO(131, 131, 131, 1),
                          ),
                    ),
                  ),
                  Row(
                    children: [
                      FittedBox(
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 243, 137, 8),
                            borderRadius: BorderRadius.circular(24),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              widget.price,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 8.0),
                      FittedBox(
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(7, 106, 127, 1),
                            borderRadius: BorderRadius.circular(24),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.location_on,
                                  color: Colors.white,
                                ),
                                Text(
                                  'Get directions',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {
                        setState(() {
                          isFavourite = !isFavourite;
                        });
                      },
                      icon: widget.favouriteButtonVisibile
                          ? FavouriteIconWidget(isFavourite: isFavourite)
                          : const SizedBox.shrink(),
                    ),
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(24),
                        child: GestureDetector(
                          onTap: widget.onTap,
                          child: widget.image == ""
                              ? Image.network(
                                  "https://via.placeholder.com/200x200.png?fa=user&bg=3498db&fg=ffffff",
                                )
                              : Image.network(
                                  widget.image,
                                ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 16)
                  ],
                ),
              ),
            ],
          ),
        ),
        if (_qrCodeIncreased)
          DecoratedBox(
            decoration: const BoxDecoration(color: Colors.white),
            child: Center(
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  image: DecorationImage(
                    image: Image.asset(widget.image).image,
                  ),
                ),
              ),
            ),
          ),
        _qrCodeIncreased
            ? Positioned(
                top: MediaQuery.of(context).size.height / 6,
                right: 70,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      _qrCodeIncreased = !_qrCodeIncreased;
                    });
                  },
                  child: Image.asset('assets/images/close_map_icon.png'),
                ),
              )
            : const SizedBox.shrink(),
      ],
    );
  }
}

class FavouriteIconWidget extends StatelessWidget {
  const FavouriteIconWidget({
    super.key,
    required this.isFavourite,
  });

  final bool isFavourite;

  @override
  Widget build(BuildContext context) {
    return isFavourite
        ? const Icon(
            Icons.favorite,
            color: Color.fromARGB(255, 243, 137, 8),
          )
        : const Icon(
            Icons.favorite_outline_rounded,
            color: Color.fromARGB(255, 255, 167, 161),
          );
  }
}

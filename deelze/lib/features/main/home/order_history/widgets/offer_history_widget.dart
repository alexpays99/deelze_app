import 'package:deelze/features/main/data/order_model/order_model.dart';
import 'package:deelze/navigation/router_paths.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class OfferHistoryWidget extends StatefulWidget {
  const OfferHistoryWidget({
    super.key,
    required this.title,
    required this.vaucher,
    required this.price,
    required this.date,
    required this.image,
    required this.orerModel,
  });
  final String title;
  final String vaucher;
  final String price;
  final String date;
  final String image;
  final OrderModel orerModel;

  @override
  State<OfferHistoryWidget> createState() => _OfferHistoryWidgetState();
}

class _OfferHistoryWidgetState extends State<OfferHistoryWidget> {
  bool isFavourite = false;
  final ColorFilter greyscale = const ColorFilter.matrix(<double>[
    0.2126,
    0.7152,
    0.0722,
    0,
    0,
    0.2126,
    0.7152,
    0.0722,
    0,
    0,
    0.2126,
    0.7152,
    0.0722,
    0,
    0,
    0,
    0,
    0,
    1,
    0,
  ]);
  @override
  Widget build(BuildContext context) {
    return Container(
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
                child: Row(
                  children: [
                    Text(
                      widget.vaucher,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.w900,
                            color: const Color.fromARGB(255, 50, 47, 47),
                          ),
                    ),
                    const SizedBox(width: 16),
                    Text(
                      widget.price,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.w900,
                            color: const Color.fromARGB(255, 243, 137, 8),
                          ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  FittedBox(
                    child: ColorFiltered(
                      colorFilter: greyscale,
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 243, 137, 8),
                          borderRadius: BorderRadius.circular(24),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text(
                            widget.date,
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
                  ),
                  const SizedBox(width: 8.0),
                  GestureDetector(
                    onTap: () {
                      context.push(
                        "${RoutePaths.authWrapper}/${RoutePaths.paymentDetails}",
                        extra: {
                          "orderModel": widget.orerModel,
                        },
                      );
                    },
                    child: FittedBox(
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(7, 106, 127, 1),
                          borderRadius: BorderRadius.circular(24),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text(
                            'Check Receipt',
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
                  ),
                ],
              ),
            ],
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(24),
                    child: ColorFiltered(
                      colorFilter: greyscale,
                      child: Image.network(
                        widget.image,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
        ],
      ),
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

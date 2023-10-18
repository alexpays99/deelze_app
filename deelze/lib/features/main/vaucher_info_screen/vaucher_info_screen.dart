import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class VaucherInfoScreen extends StatefulWidget {
  const VaucherInfoScreen({
    super.key,
    required this.title,
    required this.vaucher,
    required this.image,
    required this.lattitude,
    required this.longitude,
  });
  final String title;
  final String vaucher;
  final String image;
  final double lattitude;
  final double longitude;

  @override
  State<VaucherInfoScreen> createState() => _VaucherInfoScreenState();
}

class _VaucherInfoScreenState extends State<VaucherInfoScreen> {
  bool _openMap = false;

  @override
  Widget build(BuildContext context) {
    print("lattitude: ${widget.lattitude},longitude: ${widget.longitude}");
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        alignment: Alignment.center,
        children: [
          CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                bottom: PreferredSize(
                  preferredSize: const Size(0, 20),
                  child: Container(),
                ),
                pinned: false,
                expandedHeight: MediaQuery.of(context).size.height * 0.4,
                flexibleSpace: Stack(
                  children: [
                    Positioned(
                      top: 0,
                      left: 0,
                      right: 0,
                      bottom: 0,
                      child: Image.network(
                        widget.image,
                        // 'assets/images/info_appbar_image.png',
                        fit: BoxFit.fill,
                      ),
                    ),
                    Positioned(
                      bottom: -1,
                      left: 0,
                      right: 0,
                      child: Container(
                        height: 30,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(42),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 28.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            // 'Day use for 430 egp',
                            widget.title,
                            style: const TextStyle(
                              fontFamily: "Nutrio",
                              fontSize: 24.0,
                              fontWeight: FontWeight.w500,
                              color: Color.fromRGBO(7, 106, 127, 1),
                            ),
                          ),
                          const SizedBox(height: 8.0),
                          Text(
                            // 'Splash aqua park',
                            widget.vaucher,
                            style: const TextStyle(
                              fontFamily: "Nutrio",
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                              color: Color.fromRGBO(131, 131, 131, 1),
                            ),
                          ),
                          const SizedBox(height: 8.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Details',
                                style: TextStyle(
                                  fontFamily: "Nutrio",
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromRGBO(131, 131, 131, 1),
                                ),
                              ),
                              FittedBox(
                                child: GestureDetector(
                                  onTap: () {
                                    print('claim');
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: const Color.fromARGB(
                                          255, 243, 137, 8),
                                      borderRadius: BorderRadius.circular(24),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 16.0,
                                        vertical: 4.0,
                                      ),
                                      child: Text(
                                        "Claim it",
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
                          const SizedBox(height: 8.0),
                          const Text(
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                              fontFamily: "Nutrio",
                              fontSize: 18.0,
                              fontWeight: FontWeight.normal,
                              color: Color.fromRGBO(131, 131, 131, 1),
                            ),
                          ),
                          const SizedBox(height: 8.0),
                          const Text(
                            'Terms and conditions',
                            style: TextStyle(
                              fontFamily: "Nutrio",
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                              color: Color.fromRGBO(131, 131, 131, 1),
                            ),
                          ),
                          const SizedBox(height: 8.0),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: List.generate(
                              5,
                              (index) {
                                return const Padding(
                                  padding: EdgeInsets.only(bottom: 8.0),
                                  child: Text(
                                    '* Lorem ipsum dolor sit amet, consectetur',
                                    style: TextStyle(
                                      fontFamily: "Nutrio",
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.normal,
                                      color: Color.fromRGBO(131, 131, 131, 1),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                          const SizedBox(height: 8.0),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _openMap = !_openMap;
                              });
                              print('tapped');
                            },
                            child: const Row(
                              children: [
                                Icon(
                                  Icons.location_on_outlined,
                                  color: Color.fromARGB(255, 243, 137, 8),
                                ),
                                Text(
                                  '42 Lorem ipsum dolor street, town, city',
                                  style: TextStyle(
                                    fontFamily: "Nutrio",
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 243, 137, 8),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          if (_openMap)
            Positioned.fill(
              child: DecoratedBox(
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    // horizontal: MediaQuery.of(context).size.width /,
                    vertical: MediaQuery.of(context).size.height / 5,
                  ),
                  child: Card(
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 2,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(50))),
                      child: MapSample(
                        lat: widget.lattitude,
                        lng: widget.longitude,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          _openMap
              ? Positioned(
                  top: MediaQuery.of(context).size.height / 5.5,
                  right: 0,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _openMap = !_openMap;
                      });
                    },
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.amber,
                      ),
                      child: const Icon(
                        Icons.close,
                        color: Colors.white,
                        size: 35,
                      ),
                    ),
                  ),
                )
              : const SizedBox.shrink(),
        ],
      ),
    );
  }
}

class MapSample extends StatefulWidget {
  const MapSample({
    super.key,
    required this.lat,
    required this.lng,
  });

  final double lat;
  final double lng;

  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      mapType: MapType.normal,
      initialCameraPosition: CameraPosition(
        target: LatLng(widget.lat, widget.lng),
        zoom: 14.4746,
      ),
      onMapCreated: (GoogleMapController controller) {
        _controller.complete(controller);
      },
    );
  }
}

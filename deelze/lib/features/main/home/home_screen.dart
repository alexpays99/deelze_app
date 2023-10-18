import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deelze/core/presentation/widgets/vaucher_list_item_widget.dart';
import 'package:deelze/features/main/home/widgets/greating_section.dart';
import 'package:deelze/navigation/router_paths.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isFavourite = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const GreatingSection(
              title: 'Unwrap Joyful Saving: Your Best Dealls Await!',
            ),
            const SizedBox(height: 40.0),
            // Image.asset(
            //   "assets/images/logo.png",
            // ),
            SvgPicture.asset("assets/images/logo.svg"),
            StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection("Restaurants")
                  .snapshots(),
              builder: ((context, snapshot) {
                final restaurants = snapshot.data?.docs;

                if (snapshot.hasData) {
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: restaurants?.length ?? 0,
                    itemBuilder: (context, index) {
                      final title = restaurants?[index]["name"] as String;
                      final vaucher = restaurants?[index]["name"] as String;
                      final logo = restaurants?[index]["logo"] as String;
                      final lattitude =
                          restaurants?[index]["location"]["lat"] as double;
                      final longitude =
                          restaurants?[index]["location"]["lng"] as double;
                      return Padding(
                        padding: const EdgeInsets.only(
                            left: 20.0, right: 20.0, bottom: 20),
                        child: GestureDetector(
                          onTap: () {
                            context.push(
                              "${RoutePaths.authWrapper}/${RoutePaths.vaucherInfo}",
                              extra: {
                                "title": title,
                                "vaucher": vaucher,
                                "logo": logo,
                                "lattitude": lattitude,
                                "longitude": longitude,
                              },
                            );
                          },
                          child: VaucherListItemWidget(
                            title: title,
                            vaucher: vaucher,
                            image: logo,
                            price: '190 EGP',
                            favouriteButtonVisibile: true,
                          ),
                        ),
                      );
                    },
                  );
                } else if (snapshot.connectionState ==
                    ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return const SizedBox.shrink();
              }),
            ),
            // ListView.builder(
            //   shrinkWrap: true,
            //   itemCount: 10,
            //   itemBuilder: (context, index) {
            //     return Padding(
            //       padding: const EdgeInsets.only(
            //           left: 20.0, right: 20.0, bottom: 20),
            //       child: GestureDetector(
            //         onTap: () {
            //           context.push(
            //               "${RoutePaths.authWrapper}/${RoutePaths.vaucherInfo}");
            //         },
            //         child: const VaucherListItemWidget(
            //           title: '25% off on breakfast items',
            //           vaucher: 'Bab Ali restaurant',
            //           image: "assets/images/food.png",
            //           price: '190 EGP',
            //           favouriteButtonVisibile: true,
            //         ),
            //       ),
            //     );
            //   },
            // )
          ],
        ),
      ),
    );
  }
}

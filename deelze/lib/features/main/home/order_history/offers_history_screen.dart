import 'package:deelze/features/main/home/order_history/widgets/offer_history_widget.dart';
import 'package:deelze/features/main/home/widgets/greating_section.dart';
import 'package:flutter/material.dart';

class OffersHistoryScreen extends StatefulWidget {
  const OffersHistoryScreen({super.key});

  @override
  State<OffersHistoryScreen> createState() => _OffersHistoryScreenState();
}

class _OffersHistoryScreenState extends State<OffersHistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(239, 239, 239, 100),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const GreatingSection(
              image: "assets/images/logo.png",
              isOfferingHistory: true,
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                const SizedBox(width: 20),
                Expanded(
                  child: SearchAnchor(
                    isFullScreen: false,
                    builder:
                        (BuildContext context, SearchController controller) {
                      return SearchBar(
                        backgroundColor: MaterialStateProperty.all(
                          const Color.fromRGBO(239, 239, 239, 100),
                        ),
                        overlayColor: MaterialStateProperty.all(
                          const Color.fromARGB(255, 239, 239, 239),
                        ),
                        shadowColor:
                            MaterialStateProperty.all(Colors.transparent),
                        controller: controller,
                        padding: const MaterialStatePropertyAll<EdgeInsets>(
                          EdgeInsets.symmetric(horizontal: 16.0),
                        ),
                        onTap: () {
                          controller.openView();
                        },
                        onChanged: (_) {
                          controller.openView();
                        },
                        onSubmitted: (value) {},
                        trailing: const [
                          Icon(Icons.search),
                        ],
                        hintText: 'Search',
                        textStyle: MaterialStateProperty.all(
                          const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        hintStyle: MaterialStateProperty.all(
                          const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      );
                    },
                    suggestionsBuilder:
                        (BuildContext context, SearchController controller) {
                      return List<ListTile>.generate(
                        5,
                        (int index) {
                          const String item = '25% off on breakfast items';
                          return ListTile(
                            title: const Text(
                              item,
                              style: TextStyle(fontSize: 16),
                            ),
                            onTap: () {
                              setState(() {
                                controller.closeView(item);
                              });
                            },
                          );
                        },
                      );
                    },
                  ),
                ),
                const SizedBox(width: 16),
                FittedBox(
                  child: GestureDetector(
                    onTap: () {},
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(239, 239, 239, 100),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child:
                            Image.asset('assets/images/sort_arrows_icon.png'),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 20),
              ],
            ),
            const SizedBox(height: 20),
            ListView.builder(
              shrinkWrap: true,
              itemCount: 5,
              itemBuilder: (context, index) {
                return const Padding(
                  padding: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20),
                  child: OfferHistoryWidget(
                    title: '25% off on breakfast items',
                    vaucher: 'Bab Ali restaurant',
                    price: '13GP',
                    image: "assets/images/food.png",
                    date: '21/11/23',
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}

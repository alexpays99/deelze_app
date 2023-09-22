import 'package:deelze/core/presentation/widgets/vaucher_list_item_widget.dart';
import 'package:deelze/features/main/home/widgets/greating_section.dart';
import 'package:flutter/material.dart';

class DeelzeScreen extends StatefulWidget {
  const DeelzeScreen({super.key});

  @override
  State<DeelzeScreen> createState() => _DeelzeScreenState();
}

class _DeelzeScreenState extends State<DeelzeScreen> {
  bool _increaseQrCode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        alignment: Alignment.center,
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                const GreatingSection(
                  image: "assets/images/logo.png",
                ),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(
                          left: 20.0, right: 20.0, bottom: 20),
                      child: VaucherListItemWidget(
                        title: '25% off on breakfast items',
                        vaucher: 'Bab Ali restaurant',
                        image: "assets/images/qr_code.png",
                        price: '190 EGP',
                        favouriteButtonVisibile: false,
                        hasQrCode: true,
                        onTap: () {
                          setState(() {
                            print('_increaseQrCode');
                            _increaseQrCode = !_increaseQrCode;
                          });
                          // Expanded(
                          // child: ClipRRect(
                          //   borderRadius: BorderRadius.circular(24),
                          //   child: Image.asset(
                          //     "assets/images/qr_code.png",
                          //   ),
                          // ),
                          // );
                        },
                      ),
                    );
                  },
                )
              ],
            ),
          ),
          if (_increaseQrCode)
            Positioned.fill(
              child: DecoratedBox(
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width / 4,
                    vertical: MediaQuery.of(context).size.height / 4,
                  ),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        height: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24),
                          border: Border.all(
                            color: const Color.fromRGBO(7, 106, 127, 1),
                            width: 2.0,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(24),
                            child: Image.asset(
                              "assets/images/qr_code.png",
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
                      _increaseQrCode
                          ? Positioned(
                              top: 50,
                              right: 0,
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _increaseQrCode = !_increaseQrCode;
                                  });
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: const Color.fromRGBO(7, 106, 127, 1),
                                  ),
                                  child: const Icon(
                                    Icons.close,
                                    color: Color.fromARGB(255, 243, 149, 8),
                                    size: 35,
                                  ),
                                ),
                              ),
                            )
                          : const SizedBox.shrink(),
                    ],
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

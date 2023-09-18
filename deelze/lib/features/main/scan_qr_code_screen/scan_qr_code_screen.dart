import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ScanQrCodeScreen extends StatelessWidget {
  const ScanQrCodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(7, 106, 127, 1),
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Positioned(
            bottom: 0,
            child: Container(
              alignment: Alignment.topCenter,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 1.5,
              decoration: const BoxDecoration(
                color: Color.fromRGBO(239, 239, 239, 1),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(32),
                  topRight: Radius.circular(32),
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    GestureDetector(
                      onTap: () {
                        context.pop();
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 28.0),
                        child: Image.asset('assets/images/arrow_back.png'),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Scan me',
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(
                                fontSize: 23,
                                fontWeight: FontWeight.w800,
                                color: const Color.fromRGBO(131, 131, 131, 1),
                              ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 36),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: (MediaQuery.of(context).size.height / 1.5) - 60,
            child: GestureDetector(
              onTap: () {
                print('Edit avatar');
                //
              },
              child: Image.asset('assets/images/scan_icon.png'),
            ),
          ),
        ],
      ),
    );
  }
}

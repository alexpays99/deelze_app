import 'package:deelze/navigation/router_paths.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class PaymentDetailsScreen extends StatelessWidget {
  const PaymentDetailsScreen({super.key});

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
                          'Payment details',
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(
                                fontSize: 18,
                                fontWeight: FontWeight.w800,
                                color: const Color.fromRGBO(131, 131, 131, 1),
                              ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '350 EGP',
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(
                                fontSize: 23,
                                fontWeight: FontWeight.w800,
                                color: const Color.fromARGB(255, 243, 149, 8),
                              ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 36),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 28.0),
                      child: Container(
                        alignment: Alignment.topCenter,
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(21),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: GestureDetector(
                            onTap: () {
                              context.push(
                                  "${RoutePaths.authWrapper}/${RoutePaths.orderHistory}");
                            },
                            child: const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 28.0),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        "Date",
                                        style: TextStyle(
                                          fontFamily: 'Nutrio',
                                          color:
                                              Color.fromRGBO(131, 131, 131, 1),
                                          fontWeight: FontWeight.w500,
                                          fontSize: 18,
                                        ),
                                      ),
                                      Spacer(),
                                      Text(
                                        "21 Dec 2022",
                                        style: TextStyle(
                                          fontFamily: 'Nutrio',
                                          color:
                                              Color.fromRGBO(131, 131, 131, 1),
                                          fontWeight: FontWeight.w500,
                                          fontSize: 18,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 20),
                                  Row(
                                    children: [
                                      Text(
                                        "Details",
                                        style: TextStyle(
                                          fontFamily: 'Nutrio',
                                          color:
                                              Color.fromRGBO(131, 131, 131, 1),
                                          fontWeight: FontWeight.w500,
                                          fontSize: 18,
                                        ),
                                      ),
                                      Spacer(),
                                      Text(
                                        "Ali baba restaurant",
                                        style: TextStyle(
                                          fontFamily: 'Nutrio',
                                          color:
                                              Color.fromRGBO(131, 131, 131, 1),
                                          fontWeight: FontWeight.w500,
                                          fontSize: 18,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 20),
                                  Row(
                                    children: [
                                      Text(
                                        "Reference",
                                        style: TextStyle(
                                          fontFamily: 'Nutrio',
                                          color:
                                              Color.fromRGBO(131, 131, 131, 1),
                                          fontWeight: FontWeight.w500,
                                          fontSize: 18,
                                        ),
                                      ),
                                      Spacer(),
                                      Text(
                                        "25656335",
                                        style: TextStyle(
                                          fontFamily: 'Nutrio',
                                          color:
                                              Color.fromRGBO(131, 131, 131, 1),
                                          fontWeight: FontWeight.w500,
                                          fontSize: 18,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 20),
                                  Row(
                                    children: [
                                      Text(
                                        "Payment method",
                                        style: TextStyle(
                                          fontFamily: 'Nutrio',
                                          color:
                                              Color.fromRGBO(131, 131, 131, 1),
                                          fontWeight: FontWeight.w500,
                                          fontSize: 18,
                                        ),
                                      ),
                                      Spacer(),
                                      Text(
                                        "cash",
                                        style: TextStyle(
                                          fontFamily: 'Nutrio',
                                          color:
                                              Color.fromRGBO(131, 131, 131, 1),
                                          fontWeight: FontWeight.w500,
                                          fontSize: 18,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 20),
                                  Text(
                                      '-----------------------------------------'),
                                  SizedBox(height: 20),
                                  Row(
                                    children: [
                                      Text(
                                        "Total payment",
                                        style: TextStyle(
                                          fontFamily: 'Nutrio',
                                          color:
                                              Color.fromRGBO(131, 131, 131, 1),
                                          fontWeight: FontWeight.w500,
                                          fontSize: 18,
                                        ),
                                      ),
                                      Spacer(),
                                      Text(
                                        "350 Egp",
                                        style: TextStyle(
                                          fontFamily: 'Nutrio',
                                          color:
                                              Color.fromRGBO(131, 131, 131, 1),
                                          fontWeight: FontWeight.w500,
                                          fontSize: 18,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 20),
                                  Row(
                                    children: [
                                      Text(
                                        "Fees",
                                        style: TextStyle(
                                          fontFamily: 'Nutrio',
                                          color:
                                              Color.fromRGBO(131, 131, 131, 1),
                                          fontWeight: FontWeight.w500,
                                          fontSize: 18,
                                        ),
                                      ),
                                      Spacer(),
                                      Text(
                                        "15 Egp",
                                        style: TextStyle(
                                          fontFamily: 'Nutrio',
                                          color:
                                              Color.fromRGBO(131, 131, 131, 1),
                                          fontWeight: FontWeight.w500,
                                          fontSize: 18,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 20),
                                  Row(
                                    children: [
                                      Text(
                                        "Taxed",
                                        style: TextStyle(
                                          fontFamily: 'Nutrio',
                                          color:
                                              Color.fromRGBO(131, 131, 131, 1),
                                          fontWeight: FontWeight.w500,
                                          fontSize: 18,
                                        ),
                                      ),
                                      Spacer(),
                                      Text(
                                        "25 Egp",
                                        style: TextStyle(
                                          fontFamily: 'Nutrio',
                                          color:
                                              Color.fromRGBO(131, 131, 131, 1),
                                          fontWeight: FontWeight.w500,
                                          fontSize: 18,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 80),
                                  Row(
                                    children: [
                                      Text(
                                        "Total",
                                        style: TextStyle(
                                          fontFamily: 'Nutrio',
                                          color:
                                              Color.fromRGBO(131, 131, 131, 1),
                                          fontWeight: FontWeight.w500,
                                          fontSize: 18,
                                        ),
                                      ),
                                      Spacer(),
                                      Text(
                                        "390 Egp",
                                        style: TextStyle(
                                          fontFamily: 'Nutrio',
                                          color:
                                              Color.fromRGBO(131, 131, 131, 1),
                                          fontWeight: FontWeight.w500,
                                          fontSize: 18,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
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
              },
              // child: SvgPicture.asset('assets/images/payment_details_icon.svg',
              //     semanticsLabel: 'Acme Logo'),
              child: const CircleAvatar(
                radius: 60,
                backgroundImage:
                    AssetImage('assets/images/payment_details_icon.png'),
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.05,
            left: MediaQuery.of(context).size.width * 0.05,
            child: Text(
              'Payment Details',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontFamily: 'Nunito',
                    color: Colors.white,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:deelze/features/main/data/order_model/order_model.dart';
import 'package:deelze/navigation/router_paths.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class PaymentDetailsScreen extends StatelessWidget {
  const PaymentDetailsScreen({
    super.key,
    required this.orderModel,
  });
  final OrderModel orderModel;

  @override
  Widget build(BuildContext context) {
    final orderPrice = orderModel.items
        ?.map((e) => e.price)
        .toList()
        .reduce((value, element) => value! + element!);
    String inputDateString = orderModel.orderTime ?? '';
    DateTime inputDate = DateTime.parse(inputDateString);
    String date = DateFormat('yyyy/MM/dd').format(inputDate);
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
                          orderPrice.toString(),
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
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 28.0),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      const Text(
                                        "Date",
                                        style: TextStyle(
                                          fontFamily: 'Nutrio',
                                          color:
                                              Color.fromRGBO(131, 131, 131, 1),
                                          fontWeight: FontWeight.w500,
                                          fontSize: 18,
                                        ),
                                      ),
                                      const Spacer(),
                                      Text(
                                        date,
                                        style: const TextStyle(
                                          fontFamily: 'Nutrio',
                                          color:
                                              Color.fromRGBO(131, 131, 131, 1),
                                          fontWeight: FontWeight.w500,
                                          fontSize: 18,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 20),
                                  const Row(
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
                                        // "Ali baba restaurant",
                                        '',
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
                                  const SizedBox(height: 20),
                                  Row(
                                    children: [
                                      const Text(
                                        "Reference",
                                        style: TextStyle(
                                          fontFamily: 'Nutrio',
                                          color:
                                              Color.fromRGBO(131, 131, 131, 1),
                                          fontWeight: FontWeight.w500,
                                          fontSize: 18,
                                        ),
                                      ),
                                      const Spacer(),
                                      Text(
                                        orderModel.orderNumber.toString(),
                                        style: const TextStyle(
                                          fontFamily: 'Nutrio',
                                          color:
                                              Color.fromRGBO(131, 131, 131, 1),
                                          fontWeight: FontWeight.w500,
                                          fontSize: 18,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 20),
                                  Row(
                                    children: [
                                      const Text(
                                        "Payment method",
                                        style: TextStyle(
                                          fontFamily: 'Nutrio',
                                          color:
                                              Color.fromRGBO(131, 131, 131, 1),
                                          fontWeight: FontWeight.w500,
                                          fontSize: 18,
                                        ),
                                      ),
                                      const Spacer(),
                                      Text(
                                        // "cash",
                                        orderModel.paymentMethod ?? '',
                                        style: const TextStyle(
                                          fontFamily: 'Nutrio',
                                          color:
                                              Color.fromRGBO(131, 131, 131, 1),
                                          fontWeight: FontWeight.w500,
                                          fontSize: 18,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 20),
                                  const Text(
                                      '-----------------------------------------'),
                                  const SizedBox(height: 20),
                                  Row(
                                    children: [
                                      const Text(
                                        "Total payment",
                                        style: TextStyle(
                                          fontFamily: 'Nutrio',
                                          color:
                                              Color.fromRGBO(131, 131, 131, 1),
                                          fontWeight: FontWeight.w500,
                                          fontSize: 18,
                                        ),
                                      ),
                                      const Spacer(),
                                      Text(
                                        orderPrice.toString(),
                                        style: const TextStyle(
                                          fontFamily: 'Nutrio',
                                          color:
                                              Color.fromRGBO(131, 131, 131, 1),
                                          fontWeight: FontWeight.w500,
                                          fontSize: 18,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 20),
                                  const Row(
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
                                  const SizedBox(height: 20),
                                  const Row(
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
                                  const SizedBox(height: 80),
                                  Row(
                                    children: [
                                      const Text(
                                        "Total",
                                        style: TextStyle(
                                          fontFamily: 'Nutrio',
                                          color:
                                              Color.fromRGBO(131, 131, 131, 1),
                                          fontWeight: FontWeight.w500,
                                          fontSize: 18,
                                        ),
                                      ),
                                      const Spacer(),
                                      Text(
                                        // "390 Egp",
                                        orderPrice.toString(),
                                        style: const TextStyle(
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

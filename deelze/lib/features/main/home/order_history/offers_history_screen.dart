import 'package:deelze/features/main/home/order_history/cubit/order_history_cubit.dart';
import 'package:deelze/features/main/home/order_history/widgets/offer_history_widget.dart';
import 'package:deelze/features/main/home/widgets/greating_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class OffersHistoryScreen extends StatefulWidget {
  const OffersHistoryScreen({super.key});

  @override
  State<OffersHistoryScreen> createState() => _OffersHistoryScreenState();
}

//
class _OffersHistoryScreenState extends State<OffersHistoryScreen> {
  bool _isSelected = false;
  @override
  Widget build(BuildContext context) {
    context.read<OrderHistoryCubit>().fetchUserOrderHistory();
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
                  child: BlocBuilder<OrderHistoryCubit, OrderHistoryState>(
                    builder: (context, state) {
                      return SearchAnchor(
                        isFullScreen: false,
                        builder: (BuildContext context,
                            SearchController controller) {
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
                              // controller.openView();
                            },
                            onChanged: (_) {
                              controller.openView();
                              // Future.delayed(const Duration(seconds: 1), () {
                              //   state.when(
                              //     initial: () => null,
                              //     loading: () => null,
                              //     loaded: (data) => data.where((order) => order.items![0]),
                              //     error: () => 'Error',
                              //   );
                              // });
                            },
                            onSubmitted: (value) {
                              controller.openView();
                              // context.read<MainService>().;
                            },
                            trailing: const [
                              Icon(Icons.search),
                            ],
                            hintText: 'Search',
                            textStyle: MaterialStateProperty.all(
                              const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w300,
                                color: Colors.black,
                              ),
                            ),
                            hintStyle: MaterialStateProperty.all(
                              const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w300,
                                color: Colors.black,
                              ),
                            ),
                          );
                        },
                        suggestionsBuilder: (BuildContext context,
                            SearchController controller) {
                          return List<ListTile>.generate(
                            state.maybeWhen(
                              loading: () => 0,
                              loaded: (orders) => orders.length,
                              orElse: () => 0,
                            ),
                            (int index) {
                              String item = state.maybeWhen(
                                loading: () => '',
                                loaded: (orders) =>
                                    orders
                                        .map((e) => e.items?.map((e) => e.name))
                                        .toList()
                                        .first
                                        ?.toList()
                                        .first ??
                                    '',
                                orElse: () => '',
                              );
                              return ListTile(
                                title: Text(
                                  item,
                                  style: const TextStyle(fontSize: 16),
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
                      );
                    },
                  ),
                ),
                const SizedBox(width: 16),
                FittedBox(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _isSelected = !_isSelected;
                      });
                      _isSelected
                          ? context
                              .read<OrderHistoryCubit>()
                              .reverseOrderHistoryList()
                          : context
                              .read<OrderHistoryCubit>()
                              .fetchUserOrderHistory();
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(239, 239, 239, 100),
                        borderRadius: BorderRadius.circular(12),
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
            BlocBuilder<OrderHistoryCubit, OrderHistoryState>(
              builder: (context, state) {
                return state.when(
                  reversedList: (orders) => ListView.builder(
                    shrinkWrap: true,
                    itemCount: orders.length,
                    itemBuilder: (context, index) {
                      String inputDateString = orders[index].orderTime ?? '';
                      DateTime inputDate = DateTime.parse(inputDateString);
                      String formattedDate =
                          DateFormat('yyyy/MM/dd').format(inputDate);

                      return Padding(
                        padding: const EdgeInsets.only(
                            left: 20.0, right: 20.0, bottom: 20),
                        child: OfferHistoryWidget(
                          title: orders[index].items?[0].name ?? '',
                          vaucher: '',
                          price:
                              '${orders[index].items?[0].price.toString()}GP',
                          image: orders[index].items?[0].logo ?? '',
                          date: formattedDate,
                          orerModel: orders[index],
                        ),
                      );
                    },
                  ),
                  initial: () => const SizedBox.shrink(),
                  loading: () => const Center(
                    child: CircularProgressIndicator(),
                  ),
                  loaded: (orders) => ListView.builder(
                    shrinkWrap: true,
                    itemCount: orders.length,
                    itemBuilder: (context, index) {
                      String inputDateString = orders[index].orderTime ?? '';
                      DateTime inputDate = DateTime.parse(inputDateString);
                      String formattedDate =
                          DateFormat('yyyy/MM/dd').format(inputDate);

                      return Padding(
                        padding: const EdgeInsets.only(
                            left: 20.0, right: 20.0, bottom: 20),
                        child: OfferHistoryWidget(
                          title: orders[index].items?[0].name ?? '',
                          vaucher: '',
                          price:
                              '${orders[index].items?[0].price.toString()}GP',
                          image: orders[index].items?[0].logo ?? '',
                          date: formattedDate,
                          orerModel: orders[index],
                        ),
                      );
                    },
                  ),
                  error: () => Center(
                    child: Column(
                      children: [
                        const Text('Something went wrong! Please try again!'),
                        GestureDetector(
                          onTap: () => context
                              .read<OrderHistoryCubit>()
                              .fetchUserOrderHistory(),
                          child: const Icon(Icons.refresh),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

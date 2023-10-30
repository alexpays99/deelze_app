import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:deelze/dependencies.dart';
import 'package:deelze/features/main/data/order_model/order_model.dart';
import 'package:deelze/features/main/data/servicers/main_service.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_history_state.dart';
part 'order_history_cubit.freezed.dart';

class OrderHistoryCubit extends Cubit<OrderHistoryState> {
  OrderHistoryCubit() : super(const OrderHistoryState.initial());

  final mainService = getIt.get<MainService>();
  List<OrderModel> orders = [];

  Future<void> fetchUserOrderHistory() async {
    try {
      emit(const OrderHistoryState.loading());
      final responce = await mainService.fetchUserOrderHistory();
      orders = List.from(responce);
      emit(OrderHistoryState.loaded(responce));
    } catch (e) {
      emit(const OrderHistoryState.error());
      log('ORDER_HISTORY_ERROR: $e');
    }
  }

  Future<void> reverseOrderHistoryList() async {
    try {
      emit(const OrderHistoryState.loading());
      final responce = await mainService.fetchUserOrderHistory();
      orders = List.from(responce);
      emit(OrderHistoryState.reversedList(responce.reversed.toList()));
    } catch (e) {
      emit(const OrderHistoryState.error());
      log('ORDER_HISTORY_ERROR: $e');
    }
  }
}

part of 'order_history_cubit.dart';

@freezed
class OrderHistoryState with _$OrderHistoryState {
  const factory OrderHistoryState.initial() = _Initial;
  const factory OrderHistoryState.loading() = _Loading;
  const factory OrderHistoryState.loaded(List<OrderModel> orders) = _Loaded;
  const factory OrderHistoryState.error() = _Error;
}

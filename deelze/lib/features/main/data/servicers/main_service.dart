import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deelze/features/main/data/order_model/order_model.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MainService {
  MainService(Dio dio);

  final dio = Dio();
  final CollectionReference personsCollection =
      FirebaseFirestore.instance.collection('persons');

  Future<List<OrderModel>> fetchUserOrderHistory() async {
    try {
      final userToken = await FirebaseAuth.instance.currentUser
          ?.getIdTokenResult()
          .then((value) => value.token);
      final headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $userToken'
      };
      final response = await dio.get(
        "https://posmission-dev.ey.r.appspot.com/restaurant-orders/consumer/receipt?limit=10&offset=0",
        options: Options(headers: headers),
      );
      if (response.statusCode == 200) {
        final orders = (response.data as List<dynamic>)
            .map((e) => OrderModel.fromJson(e))
            .toList();
        log('ORDER_HISTORY: $orders END');
        return orders;
      }
      return [];
    } catch (e) {
      log('ORDER_HISTORY_ERROR: $e');
      return [];
    }
  }

  Future<void> addToFavourite() async {
    try {} catch (e) {
      log('ADD_TO_FAVOURITE_EXCEPTION: $e');
    }
  }
}

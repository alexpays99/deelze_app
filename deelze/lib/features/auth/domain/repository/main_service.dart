import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deelze/features/auth/data/models/restaurant.dart';

class MainService {
  final CollectionReference personsCollection =
      FirebaseFirestore.instance.collection('persons');

  getLastWeekRestaurants() {
    final CollectionReference personsCollection =
        FirebaseFirestore.instance.collection('Restaurant')
        .withConverter<Restaurant>(
      fromFirestore: (snapshots, _) => Restaurant.fromJson(snapshots.data()!),
      toFirestore: (movie, _) => movie.toJson(),
    );
  }
}

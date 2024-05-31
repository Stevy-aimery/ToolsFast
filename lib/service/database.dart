import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethods {
  Future<Stream<QuerySnapshot>> getFoodCart(String userId) async {
    return FirebaseFirestore.instance
        .collection("users")
        .doc(userId)
        .collection("cart")
        .snapshots();
  }

  Future<void> UpdateUserwallet(String userId, String newAmount) async {
    return FirebaseFirestore.instance
        .collection("users")
        .doc(userId)
        .update({"wallet": newAmount});
  }
}

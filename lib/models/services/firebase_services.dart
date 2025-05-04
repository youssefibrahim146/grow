
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../constants/strings.dart';
import '../user_model.dart';

class FirebaseServices {
  static final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  /// To add new user to users collection.
  static Future<dynamic> uploadUser(UserModel user) async {
    try {
      await _firestore.collection(AppStrings.usersCollection).doc(user.email).set(user.asMap());
      return user;
    } catch (error) {
      return error.toString();
    }
  }

  /// To fetch the current user date.
  static Future<dynamic> fetchCurrentUser() async {
    User? currentUser = _firebaseAuth.currentUser;
    if (currentUser != null) {
      try {
        DocumentSnapshot userDoc = await _firestore.collection(AppStrings.usersCollection).doc(currentUser.email).get();
        if (userDoc.exists) {
          UserModel user = UserModel.asModel(userDoc.data() as Map<String, dynamic>);
          return user;
        } else {
          return AppStrings.unknownErrorToast;
        }
      } catch (error) {
        return error.toString();
      }
    }
  }
}

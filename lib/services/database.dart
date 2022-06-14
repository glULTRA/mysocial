import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mysocial/models/mega.dart';
import 'package:mysocial/models/user.dart';

class DatabaseService {
  final String? uid;
  CollectionReference megaCollection =
      FirebaseFirestore.instance.collection("mega-users");

  DatabaseService({this.uid});

  // Update Mega's information.
  Future updateUserData(String? fullname, String? username) async {
    return await megaCollection.doc(uid).set(
      {
        'username': username,
        'fullname': fullname,
      },
    );
  }

  List<Mega> _megaUserFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs
        .map(
          (doc) => Mega(
            username: doc.get('username'),
            fullname: doc.get('fullname'),
          ),
        )
        .toList();
  }

  Stream<List<Mega>> get mega {
    return megaCollection.snapshots().map(_megaUserFromSnapshot);
  }

  Mega _userDataFromSnapShot(DocumentSnapshot snapshot) {
    return Mega(
      username: snapshot.get('username'),
      fullname: snapshot.get('fullname'),
    );
  }

  Stream<Mega> get getUser {
    return megaCollection.doc(uid).snapshots().map(_userDataFromSnapShot);
  }
}

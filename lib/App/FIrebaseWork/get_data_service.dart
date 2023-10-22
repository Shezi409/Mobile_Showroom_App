import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

mixin GetDataService {
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore db = FirebaseFirestore.instance;
  getColleciton() async {
    QuerySnapshot<Map<String, dynamic>> querySnapshot = await db
        .collection("users")
        .where("age", isGreaterThan: 20)
        .where("age", isLessThan: 22)
        .where("num", isEqualTo: 22)
        .get();

    print(querySnapshot);
    print(querySnapshot.docs);
    for (QueryDocumentSnapshot documentSnapshot in querySnapshot.docs) {
      print("documentSnapshot");
      print(documentSnapshot.id);
      print(documentSnapshot.data());
    }
  }

  getSingleDocumentData() async {
    DocumentSnapshot<Map<String, dynamic>> querySnapshot =
        await db.collection("users").doc("MMyxw6tG2JbFB5sNOdlc28QKGAD3").get();
    print(querySnapshot);
    print(querySnapshot.id);

    print(querySnapshot.data());
    print(querySnapshot.get("email"));
    print(querySnapshot.get("profilepic"));
    QuerySnapshot<Map<String, dynamic>> snapshot = await db
        .collection("users")
        .doc("MMyxw6tG2JbFB5sNOdlc28QKGAD3")
        .collection("chat")
        .get();
    print(snapshot);
    print(snapshot.docs);
  }

  onConnectRealtime() async {
    db.collection("users").snapshots().listen((event) {
      print("event");

      for (DocumentChange doc in event.docChanges) {
        print("DocumentChange");
        print(doc.doc);
        print(doc.newIndex);
        print(doc.oldIndex);
        print(doc.type);
      }
    });
  }

  deleteDoc() {
    db.collection("users").doc("MMyxw6tG2JbFB5sNOdlc28QKGAD3").set({
      "isDeleted": true,
    }, SetOptions(merge: true));
    // db.collection("users").doc("XFy5gsjj93XhKhO7AmMr").delete();
  }
}

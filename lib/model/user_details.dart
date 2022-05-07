import 'package:cloud_firestore/cloud_firestore.dart';

class UserDetails {
  final String uid;
  final String email;
  final String fullName;
  final String phone;
  final String gender;
  final String college;
  final String city;
  final String state;
  final String? refferalCode;
  final String evgId;
  final String? photoUrl;

  const UserDetails({
    required this.uid,
    required this.email,
    required this.fullName,
    required this.phone,
    required this.gender,
    required this.college,
    required this.city,
    required this.state,
    this.refferalCode,
    required this.evgId,
    this.photoUrl,
  });

  Map<String, dynamic> toJson() => {
        "uid": uid,
        "email": email,
        "fullName": fullName,
        "phone": phone,
        "gender": gender,
        "college": college,
        "city": city,
        "state": state,
        "refferalCode": refferalCode,
        "evgId": evgId,
        "photoUrl": photoUrl,
      };

  static UserDetails fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return UserDetails(
      uid: snapshot["uid"],
      email: snapshot["email"],
      fullName: snapshot["fullName"],
      phone: snapshot["phone"],
      gender: snapshot["gender"],
      college: snapshot["college"],
      city: snapshot["city"],
      state: snapshot["state"],
      evgId: snapshot["evgId"],
      photoUrl: snapshot["photoUrl"],
    );
  }
}

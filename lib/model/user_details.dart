class UserDetails {
  final String uid;
  final String fullName;
  final String phone;
  final String gender;
  final String college;
  final String city;
  final String? refferalCode;
  final String evgId;
  final String? photoUrl;

  const UserDetails({
    required this.uid,
    required this.fullName,
    required this.phone,
    required this.gender,
    required this.college,
    required this.city,
    this.refferalCode,
    required this.evgId,
    this.photoUrl,
  });

  Map<String, dynamic> toJson() => {
        "uid": uid,
        "fullName": fullName,
        "phone": phone,
        "gender": gender,
        "college": college,
        "city": city,
        "refferalCode": refferalCode,
        "evgId": evgId,
        "photoUrl": photoUrl,
      };
}

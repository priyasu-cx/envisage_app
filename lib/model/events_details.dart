import 'package:cloud_firestore/cloud_firestore.dart';

class EventDetails {
  final String name;
  final String about;
  final String date;
  final String location;
  final String lead;
  final String leadContact;
  final int price;
  final bool isTeamEvent;
  final int? maxTeamSize;

  const EventDetails({
    required this.name,
    required this.about,
    required this.date,
    required this.location,
    required this.lead,
    required this.leadContact,
    required this.price,
    required this.isTeamEvent,
    this.maxTeamSize,
  });

  Map<String, dynamic> toJson() => {
        "name": name,
        "about": about,
        "date": date,
        "location": location,
        "lead": lead,
        "leadContact": leadContact,
        "price": price,
        "isTeamEvent": isTeamEvent,
        "maxTeamSize": maxTeamSize,
      };

  static EventDetails fromJson(QueryDocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return EventDetails(
      name: snapshot["name"],
      about: snapshot["about"],
      date: snapshot["date"],
      location: snapshot["location"],
      lead: snapshot["lead"],
      leadContact: snapshot["leadContact"],
      price: snapshot["price"],
      isTeamEvent: snapshot["isTeamEvent"],
      maxTeamSize: snapshot["maxTeamSize"],
    );
  }
}

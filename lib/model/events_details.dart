import 'package:cloud_firestore/cloud_firestore.dart';

class EventDetails {
  final String? id;
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
    this.id,
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
        "id": id!,
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

  static EventDetails toObject(Map<String, dynamic> json) => EventDetails(
        id: json["id"],
        name: json["name"],
        about: json["about"],
        date: json["date"],
        location: json["location"],
        lead: json["lead"],
        leadContact: json["leadContact"],
        price: json["price"],
        isTeamEvent: json["isTeamEvent"],
      );

  static EventDetails fromJson(QueryDocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return EventDetails(
      id: snapshot["id"],
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

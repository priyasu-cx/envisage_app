import 'package:cloud_firestore/cloud_firestore.dart';

class TeamDetails {
  final String teamId;
  final String teamName;
  final String teamLead;
  final String? teamMember1;
  final String? teamMember2;
  final String? teamMember3;
  final String eventId;

  TeamDetails({
    required this.teamId,
    required this.teamName,
    required this.teamLead,
    this.teamMember1,
    this.teamMember2,
    this.teamMember3,
    required this.eventId,
  });

  Map<String, dynamic> toJson() => {
        "teamId": teamId,
        "teamName": teamName,
        "teamLead": teamLead,
        "teamMember1": teamMember1,
        "teamMember2": teamMember2,
        "teamMember3": teamMember3,
        "eventId": eventId,
      };

  static TeamDetails fromJson(Map<String, dynamic> json) => TeamDetails(
        teamId: json["teamId"],
        teamName: json["teamName"],
        teamLead: json["teamLead"],
        teamMember1: json["teamMember1"],
        teamMember2: json["teamMember2"],
        teamMember3: json["teamMember3"],
        eventId: json["eventId"],
      );

  static TeamDetails fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return TeamDetails(
      teamId: snapshot["teamId"],
      teamName: snapshot["teamName"],
      teamLead: snapshot["teamLead"],
      teamMember1: snapshot["teamMember1"],
      teamMember2: snapshot["teamMember2"],
      teamMember3: snapshot["teamMember3"],
      eventId: snapshot["eventId"],
    );
  }
}

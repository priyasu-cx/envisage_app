import 'package:envisage_app/controller/authentication/authentication_service.dart';
import 'package:envisage_app/model/events_details.dart';
import 'package:envisage_app/model/team_details.dart';
import 'package:envisage_app/utils/helper.dart';
import 'package:envisage_app/view/screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

void CreateTeam(String user, EventDetails _event)async {
  String teamID = getId();
  TeamDetails teamData = TeamDetails(
    teamId: teamID,
    teamName: "",
    teamLead: user,
    teamMember1: null,
    teamMember2: null,
    teamMember3: null,
    eventId: _event.id!,
  );
  print(_event.id);
    String status =
        await AuthenticationService().registerTeamEvent(_event, teamData);
    if (status == "success") {
      Fluttertoast.showToast(msg: "Successfully registered for event");
      Get.to(()=>style());
      // Navigator.of(context).pushReplacement(
      //     MaterialPageRoute(builder: (context) => style()));
    } else {
      Fluttertoast.showToast(msg: status);
    }
}
import 'package:envisage_app/controller/authentication/authentication_service.dart';
import 'package:envisage_app/model/events_details.dart';
import 'package:envisage_app/model/team_details.dart';
import 'package:envisage_app/utils/helper.dart';
import 'package:envisage_app/view/menu_pages/registered_events.dart';
import 'package:envisage_app/view/screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

void CreateTeam(String user, EventDetails _event, TeamDetails team)async {
  //String teamID = getId();
  TeamDetails teamData = TeamDetails(
    teamId: team.teamId,
    teamName: team.teamName,
    teamLead: team.teamLead,
    teamMember1: team.teamMember1,
    teamMember2: team.teamMember2,
    teamMember3: team.teamMember3,
    eventId: _event.id!,
  );
  print(_event.id);
    String status =
        await AuthenticationService().registerTeamEvent(_event, teamData);
    if (status == "success") {
      Fluttertoast.showToast(msg: "Successfully registered for event");
      Get.to(()=>reg_events());
      // Navigator.of(context).pushReplacement(
      //     MaterialPageRoute(builder: (context) => style()));
    } else {
      Fluttertoast.showToast(msg: status);
    }
}
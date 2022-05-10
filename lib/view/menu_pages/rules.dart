import 'package:envisage_app/view/notification.dart';
import 'package:flutter/material.dart';
import 'package:envisage_app/utils/colors.dart';
import 'package:iconly/iconly.dart';
import 'package:get/get.dart';
import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';


class Rules extends StatefulWidget {
  const Rules({Key? key}) : super(key: key);

  @override
  State<Rules> createState() => _RulesState();
}

class _RulesState extends State<Rules> {
  bool _isLoading = true;
  late PDFDocument _pdf;

  void _loadFile() async {
    // Load the pdf file from the internet
    //_pdf = await PDFDocument.fromURL(
    //    "https://firebasestorage.googleapis.com/v0/b/envisage-22.appspot.com/o/Rulebook%2Frulebook.pdf?alt=media&token=94fafe84-982e-4dbf-b98d-d02b7c533ab1");
    _pdf = await PDFDocument.fromAsset('assets/rulebook.pdf');

    setState(() {
      _isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _loadFile();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryBackgroundColor,
      appBar: PreferredSize(
        child: SafeArea(
            child: Container(
              // child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: Get.width * 0.03,vertical: Get.height*0.01,),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      IconButton(
                        icon: Icon(IconlyLight.arrow_left,
                            color: Colors.white),
                        onPressed: () {
                          Get.back();
                        },
                      ),
                      Text(
                        "Rules",
                        style: TextStyle(
                          color: Colors.white,
                          letterSpacing: 3,
                          fontSize: 24,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      IconButton(
                        onPressed: () {Get.to(() => NotificationPage());},
                        icon: Icon(
                          IconlyLight.notification,
                          color: Colors.white,
                        ),
                      ),
                    ]))),
        preferredSize: Size.fromHeight(Get.height * 0.1),
      ),
      body: Container(
          child: _isLoading
              ? Center(child: CircularProgressIndicator())
              : PDFViewer(document: _pdf)),

    );
  }
}


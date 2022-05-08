import 'package:envisage_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class EventDetailsPage extends StatefulWidget {
  const EventDetailsPage({Key? key}) : super(key: key);

  @override
  State<EventDetailsPage> createState() => _EventDetailsPageState();
}

class _EventDetailsPageState extends State<EventDetailsPage> {
  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: primaryBackgroundColor,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(
            IconlyLight.arrow_left,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          "Event Details",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w300,
          ),
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset("assets/Events/event_details_page.png"),
                Padding(
                  padding: EdgeInsets.only(
                    top: _height * 0.0246,
                    left: _width * 0.077,
                    bottom: _height * 0.05,
                  ),
                  child: Text(
                    "Hackathon",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 30,
                      color: Colors.white,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    bottom: _height * 0.03,
                  ),
                  child: EventDetailsWidget(
                    _width,
                    IconlyBold.calendar,
                    "14 December, 2022",
                    "Tuesday, 4:00PM - 9:00PM",
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    bottom: _height * 0.03,
                  ),
                  child: EventDetailsWidget(
                    _width,
                    IconlyBold.location,
                    "Gala Convention Center",
                    "36 Guild Street London, UK ",
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    bottom: _height * 0.08,
                  ),
                  child: OrganizerDetailWidget(
                    _width,
                    "assets/Events/organizer.png",
                    "Shubhayu Majumdar",
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: _width * 0.077,
                    bottom: _height * 0.03,
                  ),
                  child: Text(
                    "About Event",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: _width * 0.077,
                    right: _width * 0.077,
                    bottom: _height * 0.1,
                  ),
                  child: Text(
                    "Enjoy your favorite dishes and a lovely your friends and family and have a great time. Food from local food trucks will be available for purchase.",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Container(),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: _width,
              height: _height * 0.3,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.white, Colors.transparent],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: 15,
                horizontal: _width * 0.077,
              ),
              child: ATCButton(
                _height,
                100,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Material ATCButton(double _height, int _price) {
    return Material(
      color: primaryHighlightColor,
      borderRadius: BorderRadius.all(Radius.circular(8)),
      child: InkWell(
        splashColor: primaryHighlightColor,
        onTap: () {
          print("Added to Cart");
        },
        child: Container(
          height: _height * 0.0738,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "ADD TO CART - ₹$_price",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Image.asset(
                  "assets/icons/forward_arrow_circle.png",
                  height: 30,
                  width: 30,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container OrganizerDetailWidget(double _width, String _image, String _name) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: _width * 0.077,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            children: [
              Image.asset(
                _image,
                height: 48,
                width: 48,
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: _width * 0.05,
                  right: _width * 0.06,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(4),
                      child: Text(
                        _name,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                        ),
                      ),
                    ),
                    const Text(
                      "Organizer",
                      style: TextStyle(
                        fontSize: 12,
                        color: Color(0xff747688),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Container EventDetailsWidget(
      double _width, IconData _iconData, String _body, String _footer) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: _width * 0.077,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: Color(0xff5669FF).withAlpha(50),
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
                child: Icon(
                  _iconData,
                  color: Color(0xff5669FF),
                  size: 30,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: _width * 0.05,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(4),
                      child: Text(
                        _body,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    Text(
                      _footer,
                      style: TextStyle(
                        fontSize: 12,
                        color: Color(0xff747688),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

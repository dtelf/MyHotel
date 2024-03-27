import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:myhotel/utils/Globals.dart';
import 'package:myhotel/utils/http/HttpAPI.dart';
import 'package:myhotel/views/RoomView.dart';

import '../models/GetHotelRoomsResp.dart';

class RoomsView extends StatefulWidget {
  const RoomsView({super.key});

  @override
  State<RoomsView> createState() => _RoomsViewState();
}

class _RoomsViewState extends State<RoomsView> {
  List<Rooms> rooms = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getRooms();
  }

  getRooms() async {
    var request = await HttpAPI().postNOAUTH("{}", "GetHotelRooms");
    var response = GetHotelRoomsResp.fromJson(request?.body);
    if (response.success == 1) {
      Globals.rooms = response.rooms ?? [];
      setState(() {
        log("success");
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(70.0),
          child: Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Colors.blue[800]!, width: 2),
              ),
            ),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(top: 10, left: 1, bottom: 1),
                child: Image.asset(
                  "assets/Title.png",
                  height: 80,
                ),
              ),
            ),
          )
          // backgroundColor: Colors.green[400],

          ),
      body: Container(
        padding: EdgeInsets.all(5),
        color: Color.fromARGB(255, 95, 157, 207),
        height: size.height,
        width: size.width,
        child: ListView.builder(
          itemCount: Globals.rooms.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(top: 5.0),
              child: GestureDetector(
                onTap: () => Globals.showPage(RoomView(
                  roomIndex: index,
                )),
                child: Container(
                  height: 75,
                  width: size.width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: Colors.blue[800]!, // Color of the outline
                      width: 1, // Width of the outline
                    ),
                    borderRadius: BorderRadius.circular(5), // Optional: if you want rounded corners
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(14.0),
                          child: Text(
                            "Room ${Globals.rooms[index].roomNumber}",
                            style: TextStyle(fontSize: 25),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 5, right: 5), // Adjust the padding as needed
                        child: Container(
                          width: 15, // Adjust the width of the status bar as needed
                          height: 65, // Optional: if you want the status bar shorter than the item
                          decoration: BoxDecoration(
                            color: Globals.rooms[index].roomStatus == 0 ? Colors.red : Colors.green,
                            borderRadius: BorderRadius.circular(5), // Optional: if you want rounded corners for the status bar
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:loginpage/mainapp/screen/ticket_view.dart';

import '../utils/app_info_list.dart';

class UpcomingFlights extends StatefulWidget {
  const UpcomingFlights({Key? key}) : super(key: key);

  @override
  State<UpcomingFlights> createState() => _UpcomingFlightsState();
}

class _UpcomingFlightsState extends State<UpcomingFlights> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: EdgeInsets.only(left: 33.0), // adjust the value as per your preference
          child: Text(
            'Upcoming Flights',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24.0,
            ),
          ),
        ),

          backgroundColor: Color(0xFF526799),
        leading: IconButton(
          onPressed: ()=>Get.back(),
          icon: Icon(Icons.arrow_back_ios),
        ),
      ),
      backgroundColor: Color(0xFFcbe6f6),
      body: Container(
        margin: const EdgeInsets.only(left: 20,top: 20,right: 10),
        child: Column(
          children: [
            Expanded(child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              padding: const EdgeInsets.only(left: 20),
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                child: Column(

                    children:ticketList.map((s) => Container(
                      margin: EdgeInsets.only(bottom: 20),
                      child: TicketView(ticket: s),
                    ),).toList(),


                ),
              ),
            ),)
          ],
        ),
      ),
    );
  }
}

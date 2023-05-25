import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:loginpage/mainapp/screen/hotels.dart';
import 'package:loginpage/mainapp/screen/upcoming_flights_screen.dart';
import '../utils/app_layout.dart';
import '../utils/app_styles.dart';
import '../widgets/double_text_widget.dart';
import '../widgets/icon_text_widget.dart';
import '../widgets/ticket_tabs.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = AppLayout.getSize(context);
    return  Scaffold(
      backgroundColor: Styles.bgColor,
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: AppLayout.getWidht(20),vertical: AppLayout.getHeight(20)),
        children: [
          Gap(AppLayout.getHeight(40)),
          Text("What are\nyou looking for?",
            style: Styles.headLineStyle.copyWith(fontSize: AppLayout.getWidht(35) ),
          ),
          Gap(AppLayout.getHeight(20)),
          const AppTicketTabs(firstTab: "Airline Tickets",secondTab: "Hotels",),
          Gap(AppLayout.getHeight(25)),
          const AppIconText(icon:Icons.flight_takeoff_rounded,text:"Departure"),
          Gap(AppLayout.getHeight(20)),
          const AppIconText(icon:Icons.flight_land_rounded,text:"Arrival"),
          Gap(AppLayout.getHeight(15)),
          InkWell(
            onTap: () {
              Get.to(UpcomingFlights());
            },
            child: Material(
              elevation: 4,
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(AppLayout.getWidht(10)),
              child: Container(
                padding: EdgeInsets.symmetric(
                  vertical: AppLayout.getWidht(18),
                  horizontal: AppLayout.getWidht(15),
                ),
                decoration: BoxDecoration(
                  color: Color(0xD91130CE),
                  borderRadius: BorderRadius.circular(AppLayout.getWidht(10)),
                ),
                child: Center(
                  child: Text(
                    "Find tickets",
                    style: Styles.textStyle.copyWith(color: Colors.white),
                  ),
                ),
              ),
            ),
          ),

          Gap(AppLayout.getHeight(40)),
          AppDoubleTextWidget(bigText: "Upcoming Flights", smallText: "View all",dir: UpcomingFlights(),),
          Gap(AppLayout.getHeight(15)),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: AppLayout.getHeight(400),
                width: size.width*0.42,
                padding: EdgeInsets.symmetric(horizontal: AppLayout.getHeight(15), vertical: AppLayout.getWidht(15)),
                decoration: BoxDecoration(
                  color: Color(0xFF93C572),
                  borderRadius: BorderRadius.circular(AppLayout.getHeight(12))
                ),

                child: Column(
                  children: [
                    Container(
                      height: AppLayout.getHeight(190),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(AppLayout.getHeight(20)),
                        boxShadow: [BoxShadow(
                          color: Colors.grey.shade200,
                        )],
                        image: const DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(
                            "assets/images/sit.jpg"
                          )
                        )
                      ),
                    ),
                    Gap(AppLayout.getHeight(15)),
                    Text("20% discount on the early booking of this flight, Don't miss out this chance !!",
                    style: Styles.headLineStyle2,
                    )
                  ],
                ),
              ),
              Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        width: size.width*0.44,
                        height: AppLayout.getHeight(174),
                        decoration: BoxDecoration(
                            color: const Color(0xFF3ABBBB),
                            borderRadius: BorderRadius.circular(AppLayout.getHeight(18))
                        ),
                        padding: EdgeInsets.symmetric(vertical: AppLayout.getHeight(15),horizontal: AppLayout.getHeight(15)) ,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Discount\nfor survey", style: Styles.headLineStyle2.copyWith(fontWeight: FontWeight.bold,color: Colors.white),),
                            Gap(AppLayout.getHeight(10)),
                            Text("Take the survey about our services and get discount", style: Styles.headLineStyle2.copyWith(fontWeight: FontWeight.w500,color: Colors.white,fontSize: 18),),
                          ],
                        ),
                      ),
                      Positioned(
                          right:  -45,
                          top: -40,
                          child: Container(
                        padding: EdgeInsets.all(AppLayout.getHeight(30)),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(width: 18,color: Color(0xFF189999)),
                          color: Colors.transparent,

                        ),
                      )

                      )
                    ],
                  ),
                  Gap(AppLayout.getHeight(15)),

                  Container(
                    width: size.width*0.44,
                    height: AppLayout.getHeight(210),
                    padding: EdgeInsets.symmetric(
                      vertical: AppLayout.getHeight(15),
                      horizontal: AppLayout.getHeight(15)
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(AppLayout.getHeight(18)),
                      color: const Color(0xFF009E60),

                    ),
                    child: Column(
                      children: [
                        Text("Support Passionately",style: Styles.headLineStyle2.copyWith(color: Colors.white,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
                        Gap(AppLayout.getHeight(15)),
                        RichText(text: const TextSpan(
                          children: [
                            TextSpan(
                              text: '🏀',
                              style: TextStyle(fontSize: 30)
                            ),
                            TextSpan(
                                text: '⚽️',
                                style: TextStyle(fontSize: 50)
                            ),
                            TextSpan(
                                text: '🥎',
                                style: TextStyle(fontSize: 30)
                            ),
                          ]
                        ))

                      ],
                    ),
                  )
                ],
              )
            ],
          )



        ],
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:barcode_widget/barcode_widget.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:loginpage/mainapp/screen/home_screen.dart';
import 'package:loginpage/mainapp/screen/ticket_view.dart';
import '../utils/app_info_list.dart';
import '../utils/app_layout.dart';
import '../utils/app_styles.dart';
import '../widgets/column_layout.dart';
import '../widgets/layout_builder_widget.dart';
import '../widgets/ticket_tabs.dart';

class TicketScreen extends StatelessWidget {

  const TicketScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = AppLayout.getSize(context);
    return Scaffold(
      backgroundColor: Styles.bgColor,
      body: Stack(
        children:[
          ListView(
          padding: EdgeInsets.symmetric(horizontal: AppLayout.getHeight(20),vertical: AppLayout.getHeight(20)),
          children: [
            Gap(AppLayout.getHeight(40)),
            Row(
              children: [
                Text("Tickets",
                  style: Styles.headLineStyle,
                ),
                 Container(
                   margin: EdgeInsets.only(left: 212),
                   child: IconButton(
                    onPressed: ()=>Get.to(()=>HomeScreen()), icon: Icon(Icons.home_outlined,color: Colors.black,size: 30,),
                ),
                 ),
              ],
            ),

            Gap(AppLayout.getHeight(20)),
            const AppTicketTabs(firstTab: "Upcoming",secondTab: "Previous",),
            Gap(AppLayout.getHeight(20)),
            Container(
              padding: EdgeInsets.only(left: AppLayout.getHeight(15)),
              child: TicketView(ticket: ticketList[2],isColor: true,),
            ),
            const SizedBox(height: 1),
            Container(
              padding: EdgeInsets.symmetric(horizontal:15,vertical: 20 ),
              margin: EdgeInsets.symmetric(horizontal:15 ),

              color: Colors.white,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [

                      AppColumnLayout(alignment: CrossAxisAlignment.start,firstText:'Flutter DB' ,secondText:"Passenger" ,isColor: true,),
                      AppColumnLayout(alignment: CrossAxisAlignment.end,firstText:'5221 364578' ,secondText:"Passport" ,isColor: true,)

                    ],
                  ),
                  Gap(AppLayout.getHeight(20)),
                  const AppLayoutBuilder(sections: 15,isColor: false,width: 5,),
                  Gap(AppLayout.getHeight(20)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [

                      AppColumnLayout(alignment: CrossAxisAlignment.start,firstText:'12254 458459654' ,secondText:"Number of E-ticket" ,isColor: true,),
                      AppColumnLayout(alignment: CrossAxisAlignment.end,firstText:'B2DFT789' ,secondText:"Booking code" ,isColor: true,)

                    ],
                  ),
                  Gap(AppLayout.getHeight(20)),
                  const AppLayoutBuilder(sections: 15,isColor: false,width: 5,),
                  Gap(AppLayout.getHeight(20)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Row(
                            children: [
                              Image.asset("assets/images/visa.png",scale: 11,),
                              Text(" *** 2457 ",style: Styles.headLineStyle3,)
                            ],
                          ),
                          Gap(5),
                          Text("Payment method", style: Styles.headLineStyle4,)
                        ],
                      ),
                      const AppColumnLayout(alignment: CrossAxisAlignment.end,firstText:'\$245.99' ,secondText:"Price" ,isColor: true,),


                    ],
                  ),
                  const SizedBox(height: 1,),

                ],
              ),
            ),
            /* bar code*/
            const SizedBox(height: 1,),
            Container(
              decoration:  BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(AppLayout.getHeight(21)),
                  bottomLeft: Radius.circular(AppLayout.getHeight(21))
                )
              ),
              margin: EdgeInsets.only(left: AppLayout.getHeight(15),right: AppLayout.getHeight(15)),
              padding: EdgeInsets.only(top: AppLayout.getHeight(20),bottom: AppLayout.getHeight(20)),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: AppLayout.getHeight(15)),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(AppLayout.getHeight(15)),
                  child: BarcodeWidget(
                    barcode: Barcode.code128(),
                    data: 'https://github.com/martinovovo',
                    drawText: false,
                    color: Styles.textColor,
                    width: double.infinity,
                    height: 70,
                  ),
                ),
              ),
            ),
            Gap(AppLayout.getHeight(20)),

            Container(
              padding: EdgeInsets.only(left: AppLayout.getHeight(15)),
              child: TicketView(ticket: ticketList[0],),
            ),
          ],
        ),
          Positioned(
            left: 21,
            top: 295,
            child: Container(
              padding: EdgeInsets.all(3),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Styles.textColor,width: 2)
              ),
              child: CircleAvatar(
                maxRadius: 4,
                backgroundColor: Styles.textColor,
              ),
            ),
          ),
          Positioned(
            right: 21,
            top: 295,
            child: Container(
              padding: EdgeInsets.all(3),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Styles.textColor,width: 2)
              ),
              child: CircleAvatar(
                maxRadius: 4,
                backgroundColor: Styles.textColor,
              ),
            ),
          ),
      ]),
    );
  }
}

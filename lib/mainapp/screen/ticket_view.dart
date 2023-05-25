import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:loginpage/mainapp/screen/ticket_screen.dart';
import '../utils/app_layout.dart';
import '../utils/app_styles.dart';
import '../widgets/column_layout.dart';
import '../widgets/layout_builder_widget.dart';
import '../widgets/thick_container.dart';

class TicketView extends StatelessWidget {
  final Map<String, dynamic> ticket;
  final bool? isColor;
   TicketView({Key? key, required this.ticket,this.isColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = AppLayout.getSize(context);
    return SizedBox(
      width: size.width*0.85,
      height: AppLayout.getHeight(165),
      child: InkWell(
        onTap:() async{
          Get.to(TicketScreen());
          },
        child: Container(
          margin:  EdgeInsets.only(right: AppLayout.getHeight(16)),
          child: Column(
            children: [
              /*showing the blue part of the card/ticket*/
              Container(
                decoration:  BoxDecoration(
                  color:  isColor==null? Color(0xFF526799):Colors.white,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(AppLayout.getHeight(21)),topRight:Radius.circular(AppLayout.getHeight(21)) )
                ),
                padding: const EdgeInsets.all(16),

                child: Column(

                  children: [
                    Row(
                      children: [
                        Text(ticket['from']['code'],style: isColor==null? Styles.headLineStyle3.copyWith(color: Colors.white):Styles.headLineStyle3),
                        Expanded(child: Container()),
                        ThickContainer(isColor:true),
                        Expanded(child: Stack(
                          children: [
                          SizedBox(
                            height: AppLayout.getHeight(24),
                            child:  AppLayoutBuilder(sections: 6,)
                          ),
                            Center(child: Transform.rotate(angle: 1.5,child: Icon(Icons.local_airport_rounded,color:isColor==null? Colors.white:Color(0xFF8ACCF7)),)),


                          ]
                        )),
                        ThickContainer(isColor:true),
                        Expanded(child: Container()),
                        Text(ticket['to']['code'],style: isColor==null? Styles.headLineStyle3.copyWith(color: Colors.white):Styles.headLineStyle3,)
                      ],
                    ),
                    const Gap(1),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: AppLayout.getWidht(100),
                          child: Text(ticket['from']['name'],style: isColor==null? Styles.headLineStyle4.copyWith(color: Colors.white):Styles.headLineStyle4,),
                        ),
                        Text(ticket['flying_time'],style:isColor==null? Styles.headLineStyle4.copyWith(color: Colors.white):Styles.headLineStyle4,),
                        SizedBox(
                          width: AppLayout.getWidht(100),
                          child: Text(ticket['to']['name'],textAlign: TextAlign.end,style:isColor==null? Styles.headLineStyle4.copyWith(color: Colors.white):Styles.headLineStyle4,),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              /*showing the red part of the card/ticket*/
              Container(
                color:isColor==null? Styles.orangeColor:Colors.white,//const Color(0xFFF37B67),
                child: Row(
                  children:  [
                     SizedBox(
                      height: AppLayout.getHeight(20),
                      width: AppLayout.getWidht(10),
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: isColor==null? Colors.grey.shade200 :Colors.white,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(10),
                            bottomRight: Radius.circular(10)
                          )
                        ),
                      ),
                    ),
                    Expanded(child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: LayoutBuilder(
                        builder: (BuildContext context, BoxConstraints constraints){
                         return Flex(
                            direction: Axis.horizontal,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.max,
                            children:List.generate((constraints.constrainWidth()/15).floor(), (index) => SizedBox(
                              width: 5,height: 1,
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                    color:isColor==null?Colors.white:Colors.grey.shade300
                                ),
                              ),
                            )),
                          );
                        },
                      ),
                    )),
                     SizedBox(
                      height: 20,
                      width: 10,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                            color: isColor==null? Colors.grey.shade200 :Colors.white,
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(10),
                                bottomLeft: Radius.circular(10)
                            )
                        ),
                      ),
                    )
                  ],
                ),
              ),
              /*bottom part of the orange card/ticket*/
              Container(
                decoration:  BoxDecoration(
                    color:isColor==null? Styles.orangeColor:Colors.white,
                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(isColor==null?21:0),bottomRight:Radius.circular(isColor==null?21:0) )
                ),
                padding: const EdgeInsets.only(left: 16,top: 10,right: 16,bottom: 16 ),
                child: Column(
                  children: [

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppColumnLayout(alignment: CrossAxisAlignment.start, firstText: ticket['date'], secondText: "Date",isColor: isColor,),
                        AppColumnLayout(alignment: CrossAxisAlignment.center, firstText: ticket['departure_time'], secondText: "Departure time",isColor: isColor,),
                        AppColumnLayout(alignment: CrossAxisAlignment.end, firstText: ticket['number'].toString(), secondText: "NUMBER",isColor: isColor,),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

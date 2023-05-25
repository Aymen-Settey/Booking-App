import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/app_layout.dart';

class AppTicketTabs extends StatefulWidget {
  final String firstTab;
  final String secondTab;
  const AppTicketTabs({Key? key, required this.firstTab, required this.secondTab})
      : super(key: key);

  @override
  _AppTicketTabsState createState() => _AppTicketTabsState();
}

class _AppTicketTabsState extends State<AppTicketTabs> {
  bool _isFirstTabSelected = true;

  @override
  Widget build(BuildContext context) {
    final size = AppLayout.getSize(context);
    return Container(
      padding: const EdgeInsets.all(3.5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppLayout.getHeight(50)),
        color: const Color(0xFFF4F6FD),
      ),
      child: Stack(
        children: [
          // The sliding indicator
          Positioned(
            left: _isFirstTabSelected ? 0 : size.width * 0.44,
            bottom: 0,
            child: Container(
              height: 4,
              width: size.width * 0.44,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppLayout.getHeight(50)),
                color: Colors.greenAccent,
              ),
            ),
          ),

          // The tabs
          Row(
            children: [
              // Airline tickets tab
              GestureDetector(
                onTap: () {
                  setState(() {
                    _isFirstTabSelected = true;
                  });
                },
                child: Container(
                  width: size.width * 0.44,
                  padding: EdgeInsets.symmetric(vertical: AppLayout.getHeight(7)),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.horizontal(
                      left: Radius.circular(AppLayout.getHeight(50)),
                    ),
                    color: _isFirstTabSelected ? Colors.white : Colors.transparent,
                  ),
                  child: Center(
                    child: Text(widget.firstTab),
                  ),
                ),
              ),

              // Hotels tickets tab
              GestureDetector(
                onTap: () {
                  setState(() {
                    _isFirstTabSelected = false;
                  });
                },
                child: Container(
                  width: size.width * 0.44,
                  padding: EdgeInsets.symmetric(vertical: AppLayout.getHeight(7)),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.horizontal(
                      right: Radius.circular(AppLayout.getHeight(50)),
                    ),
                    color: !_isFirstTabSelected ? Colors.white : Colors.transparent,
                  ),
                  child: Center(
                    child: Text(widget.secondTab),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

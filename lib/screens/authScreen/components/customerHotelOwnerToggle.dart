import 'package:flutter/material.dart';
import 'package:gebeta_food_delivery/utils/colors.dart';

class CustomerHotelOwnerToggle extends StatefulWidget {
   final isCustomer;
  final isHotelOwner;
 
  const CustomerHotelOwnerToggle({Key? key, this.isCustomer, this.isHotelOwner}) : super(key: key);

  @override
  State<CustomerHotelOwnerToggle> createState() => _CustomerHotelOwnerToggleState();
}

class _CustomerHotelOwnerToggleState extends State<CustomerHotelOwnerToggle> {
    double xAlign = -1;
  Color userColor = Colors.white;
  Color brokerColor = Colors.black54;
  double width = 260.0;

  onUserTap() {
    widget.isCustomer();
    setState(() {
      xAlign = -1;
      userColor = Colors.white;
      brokerColor = Colors.black54;
    });
  }

  onBrokerTap() {
    widget.isHotelOwner();
    setState(() {
      xAlign = 1;
      brokerColor = Colors.white;
      userColor = Colors.black54;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Center(
child: Container(
        width: width,
        height: 50,
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          boxShadow: [
            BoxShadow(
                color: Colors.black38,
                spreadRadius: 0.5,
                blurRadius: 2,
                offset: Offset(0.0, 2.5))
          ],
          borderRadius: BorderRadius.all(
            Radius.circular(50.0),
          ),
        ),
        child: Stack(
          children: [
            AnimatedAlign(
              alignment: Alignment(xAlign, 0),
              duration: Duration(milliseconds: 300),
              child: Container(
                margin: EdgeInsets.all(2),
                width: width * 0.5,
                height: 50,
                decoration: BoxDecoration(
                  color: AppColors.orange,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black26,
                        spreadRadius: 1.5,
                        blurRadius: 1.5,
                        offset: Offset(0.0, 1.0))
                  ],
                  borderRadius: BorderRadius.all(
                    Radius.circular(50.0),
                  ),
                ),
              ),
            ),
            //
             GestureDetector(
              onTap: onUserTap,
              child: Align(
                alignment: Alignment(-1, 0),
                child: Container(
                  width: width * 0.5,
                  color: Colors.transparent,
                  alignment: Alignment.center,
                  child: Text(
                    'Customer',
                    style: TextStyle(
                        color: userColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                ),
              ),
            ),
            //
            GestureDetector(
              onTap: onUserTap,
              child: Align(
                alignment: Alignment(1, 0),
                child: Container(
                  width: width * 0.5,
                  color: Colors.transparent,
                  alignment: Alignment.center,
                  child: Text(
                    'HotelOwner',
                    style: TextStyle(
                        color: userColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                ),
              ),
            ),
          ],
        ),
      
    ));
  }
}
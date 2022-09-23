import 'package:flutter/material.dart';

class PremiumPlan extends StatefulWidget {
const  PremiumPlan({Key? key}) : super(key: key);

  @override
  State<PremiumPlan> createState() => _PremiumPlanState();
}

class _PremiumPlanState extends State<PremiumPlan> {
  int indexTap = 0;
  int indexTwo = 1;
  bool annual = true;
  bool monthly = false;

  @override
  Widget build(BuildContext context) {
    //
    final box = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              annual = true;
              monthly = false;
            });
          },
          child: Container(
            // color: Colors.white,
            width: box.width / 3,
            height: 150,
            decoration: annual
                ? BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    color: Colors.white,
                    border: Border.all(color:const Color(0xFFF47F6B), width: 4))
                : BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    color: Colors.white,
                  ),

            child: Column(mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Text('Annual',
                      style: TextStyle(
                          fontFamily: 'Nunito',
                          fontSize: 16,
                          fontWeight: FontWeight.w400)),
                  Text('\$79.99',
                      style: TextStyle(
                          fontFamily: 'Nunito',
                          fontSize: 25,
                          fontWeight: FontWeight.w900)),
                  Text('per year',
                      style: TextStyle(
                          fontFamily: 'Nunito',
                          fontSize: 12,
                          fontWeight: FontWeight.w400))
                ]),
          ),
        ),
        GestureDetector(
          onTap: () {
           setState(() {
              monthly = true;
              annual = false;
           });
          },
          child: Container(
            width: box.width / 3,
            height: 150,
            decoration: monthly
                ? BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    color: Colors.white,
                    border: Border.all(color: const Color(0xFFF47F6B), width: 4))
                : BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    color: Colors.white,
                  ),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children:const [
            Text('Monthly',
                  style: TextStyle(
                      fontFamily: 'Nunito',
                      fontSize: 16,
                      fontWeight: FontWeight.w400)),
              Text('\$7.99',
                  style: TextStyle(
                      fontFamily: 'Nunito',
                      fontSize: 25,
                      fontWeight: FontWeight.w900)),
              Text('per year',
                  style: TextStyle(
                      fontFamily: 'Nunito',
                      fontSize: 12,
                      fontWeight: FontWeight.w400))
            ]),
          ),
        ),
      ],
    );
  }
}

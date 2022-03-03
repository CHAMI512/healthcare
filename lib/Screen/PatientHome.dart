import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:health_care/Screen/Consultant.dart';
import 'package:health_care/Screen/Diagnosis.dart';
import 'package:health_care/Screen/Emergency.dart';
import 'package:health_care/Screen/History.dart';
class PatientDashboard extends StatefulWidget {
  @override
  _PatientDashboardState createState() => _PatientDashboardState();
}

class _PatientDashboardState extends State<PatientDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white38.withOpacity(0.9),
      appBar: AppBar(
title: Text("Home"),
        backgroundColor: Colors.brown,
        centerTitle: true,
      ),
      body: SafeArea(child: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Diagnosis()));
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white,

                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      children: [
                        Icon(Icons.add,color: Colors.brown,
                        size: 45,),
                        SizedBox(width: 40,),
                        Text("Diagnosis",style: TextStyle(
                          color: Colors.brown,
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                        ),),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>History()));
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white,

                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      children: [
                        Icon(Icons.calendar_today,color: Colors.brown,
                          size: 35,),
                        SizedBox(width: 40,),
                        Text("History",style: TextStyle(
                          color: Colors.brown,
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                        ),),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder:(context)=>Consultant()));
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white,

                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      children: [
                        Icon(Icons.person,color: Colors.brown,
                          size: 45,),
                        SizedBox(width: 40,),
                        Text("Consultant",style: TextStyle(
                          color: Colors.brown,
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                        ),),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder:(context)=>Emergency()));

                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white,

                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      children: [
                        Icon(Icons.warning,color: Colors.brown,
                          size: 45,),
                        SizedBox(width: 40,),
                        Text("Emergency",style: TextStyle(
                          color: Colors.brown,
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                        ),),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}

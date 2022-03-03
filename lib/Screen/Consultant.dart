import 'package:flutter/material.dart';
class Consultant extends StatefulWidget {
  const Consultant({Key key}) : super(key: key);

  @override
  _ConsultantState createState() => _ConsultantState();
}

class _ConsultantState extends State<Consultant> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal:18.0,vertical: 20),
              child: Text("TOP DOCTORS",style: TextStyle(
                 color: Colors.white,
                fontSize: 22,
              ),),
            ),

            Expanded(
              child: Container(
               decoration: BoxDecoration(
                 color: Colors.white,
                 borderRadius: BorderRadius.only(topLeft: Radius.circular(33)),
               ),
                child: Column(
                  children: [
                    SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                           decoration: BoxDecoration(
                             color: Colors.brown,
                             borderRadius: BorderRadius.all(Radius.circular(12)),

                           ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("Dentist",style: TextStyle(
 fontWeight: FontWeight.bold ,
 fontSize: 18,
                                color: Colors.white,
                              ),),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.brown,
                              borderRadius: BorderRadius.all(Radius.circular(12)),

                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("Specialist",style: TextStyle(
                                fontWeight: FontWeight.bold ,
                                fontSize: 18,
                                color: Colors.white,
                              ),),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.brown,
                              borderRadius: BorderRadius.all(Radius.circular(12)),

                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("Surgical",style: TextStyle(
                                fontWeight: FontWeight.bold ,
                                fontSize: 18,
                                color: Colors.white,
                              ),),
                            ),
                          ),
                        ),
                      ],
                    ),

                    Expanded(
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: 6,
                        itemBuilder: (BuildContext context,int index ){
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 1),
                            child: Container(

                              decoration: BoxDecoration(
                                border: Border.all(color:Colors.grey[200]),

                              ),
                              child:  Container(
                                margin: EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
                                padding: EdgeInsets.all(5.0),

                                child: Row(
                                  children: <Widget>[
                                    Card(
                                      clipBehavior: Clip.antiAlias,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(40),
                                      ),
                                      child: Ink.image(
                                        fit: BoxFit.cover,
                                        width: 170.0,
                                        height: 220,
                                        image: NetworkImage("https://thumbs.dreamstime.com/b/smiling-female-doctor-holding-medical-records-lab-coat-her-office-clipboard-looking-camera-56673035.jpg"),


                                      ),
                                    ),
                                    SizedBox(width: 5.0),
                                    Container(
                                      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            ""+"10am - 3pm",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,

                                            ),
                                          ),
                                          SizedBox(height: 6,),

                                          Text(" Dentist ",  style: TextStyle(
                                            fontWeight: FontWeight.bold,

                                          ),
                                          ),
                                          SizedBox(height: 6,),

                                          Text("Dr Chaman",  style: TextStyle(

                                            fontWeight: FontWeight.bold,
                                          ),
                                          ),
                                          SizedBox(height: 6,),
                                           SizedBox(height: 6,),

                                        ],
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

                  ],
                ),
              ),
            )



          ],
        ),
      ),
    );
  }
}

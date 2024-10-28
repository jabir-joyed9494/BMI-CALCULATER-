import 'package:flutter/material.dart';

class HomeActivity extends StatefulWidget {
  const HomeActivity({super.key});

  @override
  State<HomeActivity> createState() => HomepageActivity();
}

class HomepageActivity extends State<HomeActivity> {
  var wtcontroller = TextEditingController(); //initailization a value
  var ftcontroller = TextEditingController(); //initailization a value
  var incontroller = TextEditingController(); //initailization a value
  var result="";
  var col1 = Colors.indigo.shade200; //to initilize a color for repeating use
  var col2=Colors.indigo.shade200,col3=Colors.indigo.shade200,col4=Colors.indigo.shade200,col5=Colors.indigo.shade200,col6=Colors.indigo.shade200;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView( //to make this body scrollable
          scrollDirection: Axis.vertical,
          // Enables horizontal scrolling
         child: Column(
           children: [
              Row(
               children: [
                 buildBox(),
               ],
             ),
             const SizedBox(height: 12,),
             const Text(
                 "BMI",
               style: TextStyle(
                 fontSize: 50,
                 fontStyle: FontStyle.italic,
                 fontWeight: FontWeight.bold,
                 color: Colors.brown
               ),
             ),

            Padding(
             padding:  const EdgeInsets.fromLTRB(50, 0, 50, 0),
             child: TextField(
               controller: wtcontroller,//to input by user
              textAlign: TextAlign.center,
               decoration: const InputDecoration(
                 border:OutlineInputBorder(
                   borderRadius: BorderRadius.all(Radius.circular(10))
                 ),
                 labelText: 'Enter Your Weight (in kg)',
              icon: Icon(Icons.line_weight)
               ),
               keyboardType: TextInputType.number,
             ),
           ),
             Padding(
               padding: const EdgeInsets.fromLTRB(50, 10, 50, 0),
               child: TextField(
                 controller: ftcontroller,//to input by user
                 textAlign: TextAlign.center,
                 decoration: const InputDecoration(
                   border: OutlineInputBorder(
                     borderRadius: BorderRadius.all(Radius.circular(10))
                   ),
                   labelText: 'Enter your Height (in Feet)',
                   icon: Icon(Icons.height)
                 ),
                 keyboardType: TextInputType.number,
               ),
             ),
             Padding(
               padding: const EdgeInsets.fromLTRB(50, 10, 50, 0),
               child: TextField(
                 controller: incontroller,//to input by user
                 textAlign: TextAlign.center,
                 decoration: const InputDecoration(
                     border: OutlineInputBorder(
                         borderRadius: BorderRadius.all(Radius.circular(10))
                     ),
                     labelText: 'Enter your Height (in Inch)',
                     icon: Icon(Icons.height)
                 ),
                 keyboardType: TextInputType.number,
               ),
             ),
             const SizedBox(height: 20,),
             ElevatedButton(onPressed:(){
                var wt=wtcontroller.text.toString();  //using variables like wtcontroller.text.toString() to retrieve text from TextEditingController
                var ft=ftcontroller.text.toString();
                var inch=incontroller.text.toString();

                if(wt!="" && ft!="" && inch!="")
                  {
                     var iWt=int.parse(wt);
                     var iFt=int.parse(ft);
                     var iInch=int.parse(inch);
                     var tInch=(iFt*12) + iInch;
                     var tCm= tInch*2.54;
                     var tM=tCm/100;
                     var ans=iWt/(tM*tM);
                     var msg="";
                     col1=Colors.indigo.shade200;col2=Colors.indigo.shade200;col3=Colors.indigo.shade200;
                     col4=Colors.indigo.shade200;col5=Colors.indigo.shade200;col6=Colors.indigo.shade200;
                     if(ans>=40)
                       {
                           msg="You are Morbidly Obses";
                           col6=const Color(0xFFD50000);//col6 repersent box 6
                       }
                     else if(ans>=35 && ans<=39.9)
                     {
                       msg="You are Severely Obses";
                       col5=Colors.red.shade500;//col6 repersent box 5
                     }
                     else if(ans>=30 && ans<=34.9)
                     {
                       msg="You are Moderately Obses";
                       col4=Colors.red.shade300;//col6 repersent box 4
                     }
                     else if(ans>=25 && ans<=29.9)
                     {
                       msg="You are OverWeight";
                       col3=Colors.orange;//col6 repersent box 3
                     }
                     else if(ans>=18.5 && ans<=24.9)
                     {
                       msg="You are Normal";
                       col2=Colors.green;//col6 repersent box 2
                     }
                     else
                       {
                         msg="You are UnderWeight";
                         col1=const Color(0xFFFFE082);  //col6 repersent box 1
                        };
                     setState(() {
                       result="$msg\nYour BMI is: ${ans.toStringAsFixed(2)} ";
                     });
                  }
                else
                  {
                    setState(() {
                      result = "Please fill all the required blanks!!";
                    });
                  }
             }
             ,child: const Text('Calculation')
             ),
             const SizedBox(height: 11,),
             Text(result,
             style: const TextStyle(fontSize: 19),
             )
           ],
         ),
        ),
      ),
    );
  }

  Row buildBox() {
    return Row(
            children: [
              Column(
                children: [
                  const SizedBox(height: 20), // Gap between AppBar and first container
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Container(
                      height: 130,
                      width: 140,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.red),
                        borderRadius: const BorderRadius.all(Radius.circular(15)),
                        //color: Colors.amberAccent,
                        color: col1,
                      ),
                      child: const Center(
                        child: Text("UnderWeight\nBMI less then 18.4",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                             fontStyle: FontStyle.italic,
                            fontSize: 15,
                            fontWeight: FontWeight.bold
                          )
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 5), // Gap between two containers
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 130,
                      width: 140,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(Radius.circular(15)),
                        border: Border.all(color: Colors.red),
                       // color: Colors.orange,
                        color: col4,
                      ),
                      child: const Center(
                        child: Text("Moderately Obese\nBMI between 30 and 34.9",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontStyle: FontStyle.italic,
                                fontSize: 15,
                                fontWeight: FontWeight.bold
                            )
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Column(
                children: [
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 130,
                      width: 140,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.red),
                        borderRadius: const BorderRadius.all(Radius.circular(15)),
                        //color: Colors.green,
                        color: col2,
                      ),
                      child: const Center(
                        child: Text("Normal\nBMI between 18.5 and 24.9",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontStyle: FontStyle.italic,
                                fontSize: 15,
                                fontWeight: FontWeight.bold
                            )
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 130,
                      width: 140,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(Radius.circular(15)),
                        border: Border.all(color: Colors.red),
                       // color: Colors.redAccent,
                        color: col5,
                      ),
                      child: const Center(
                        child: Text("Severely Obese\nBMI between 35 and 39.9",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontStyle: FontStyle.italic,
                                fontSize: 15,
                                fontWeight: FontWeight.bold
                            )
                        ),
                      ),
                    ),

                  ),
                  
                ],
              ),
              Column(
                children: [
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 130,
                      width: 140,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(Radius.circular(15)),
                        border: Border.all(color: Colors.red),
                        //color: Colors.orange,
                        color: col3,
                      ),
                      child: const Center(
                        child: Text("OverWeight\nBMI between 25 and 29.9",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontStyle: FontStyle.italic,
                                fontSize: 15,
                                fontWeight: FontWeight.bold
                            )
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 130,
                      width: 140,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.red),
                        borderRadius: const BorderRadius.all(Radius.circular(15)),
                        //color: Colors.red,
                        color: col6,
                      ),
                    //  color: bgColor,
                      child: const Center(
                        child: Text("Morbidly Obese\nBMI 40 or over",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontStyle: FontStyle.italic,
                                fontSize: 15,
                                fontWeight: FontWeight.bold
                            )
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          );
  }

  AppBar buildAppBar() {
    return AppBar(
      title: const Center(
        child: Text(
          "BMI CALCULATOR",
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main(){
  runApp(Myapp());
}

class Myapp extends StatefulWidget {
  const Myapp({super.key});

  @override
  State<Myapp> createState() => _MyappState();
}

class _MyappState extends State<Myapp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.pink,
        ),
        textTheme: TextTheme(
          titleLarge: TextStyle(
            color: Colors.black,
            fontSize: 20
          )),
        inputDecorationTheme:
          InputDecorationTheme(
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.blue,
                  width: 2,
                )
            ) ,
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.black,
                  width: 2,
                )
            ) ,
            errorBorder: OutlineInputBorder() ,
          ),
      ),
      debugShowCheckedModeBanner: false,
     home: Scd() ,
    );
  }
}

class Scd extends StatefulWidget {
  const Scd({super.key});

  @override
  State<Scd> createState() => _ScdState();
}

class _ScdState extends State<Scd> {
  final TextEditingController _Fristnumber = TextEditingController();
  final TextEditingController _Secondnumber = TextEditingController();
  double result = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.camera, size: 35,) ,
        centerTitle: true,
        title: Text("Calculator", style:
        GoogleFonts.lato(
         fontSize: 30,
          // fontWeight: FontWeight.bold,
        )),
        actions: [
          IconButton(onPressed: () {} , icon: Icon(Icons.menu,size: 35,))
        ],
      ) ,
      body:
      Padding(padding: EdgeInsetsGeometry.all(15),
      child:
        Container(
        height:double.infinity,
          width: double.infinity,
          // color: Colors.green,
          child:
          Column(
            children: [
              Padding(padding: EdgeInsetsGeometry.all(3),
              child:
                  Column(
                    children: [
                      SizedBox(height: 50,
                      child:
                        Text("Welcome to my Calculator",style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                        ),)
                        ,
                      ),
                      TextField(
                        controller: _Fristnumber,
                        keyboardType: TextInputType.number,
                        decoration:
                        InputDecoration(
                          labelText: "Enter a Number"
                        ),
                      ),
                      SizedBox(height: 20,),
                      TextField(
                        controller: _Secondnumber,
                        keyboardType: TextInputType.number,
                        decoration:
                        InputDecoration(
                          labelText:"Enter Another Number"  ,
                        ),
                      ),
                      SizedBox(height: 20,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ElevatedButton.icon(onPressed: () {
                            add();
                          } ,icon: Icon(Icons.add), label: Text("Add")),
                          SizedBox(width: 20,),
                          ElevatedButton.icon(onPressed: () {
                            minus();
                          } ,icon: Icon(Icons.remove), label: Text("Munus")),
                        ],
                      ),
                      Text("Resilt: ${result}", style: TextStyle(
                        fontSize: 20,
                        color: Colors.red,
                      ),)
                    ],
                  )
              )
            ],
          )
          ,
      ),
      ),

    );
  }

  void add(){
    double num1 = double.tryParse(_Fristnumber.text) ?? 0;
    double num2 = double.tryParse(_Secondnumber.text) ?? 0;
    result = num1 + num2;
    setState(() {});
  }

  void minus(){
    double num1 = double.tryParse(_Fristnumber.text) ?? 0;
    double num2 = double.tryParse(_Secondnumber.text) ?? 0;
    result = num1 - num2;
    setState(() {});
  }


  void dispose(){
    _Fristnumber.dispose();
    _Secondnumber.dispose();
    super.dispose();
  }
}

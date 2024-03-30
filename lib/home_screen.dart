import 'package:codingjunior/questions.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true, appBar: AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: const Text(
          "  Coding Junior",
        textAlign: TextAlign.right,
        style: TextStyle(
          fontSize: 29,
          fontWeight: FontWeight.bold,
          color: Colors.white,

        ),
      ),
    ),
      body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(gradient: LinearGradient(colors: [
            Colors.black45,
            Colors.blue.shade100,
            Colors.purple.shade100,

          ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter
          ),),
          child: SingleChildScrollView(
          child: Padding(
          padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: Column(
        children: <Widget>[
        SizedBox(
        height: 200,
      ),
      Image(
        image: AssetImage(
            "assets/coding_image.jpeg"),
        width: 400,
        height: 300,
      ),
      SizedBox(
        height: 0,
      ),
          ElevatedButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=> Questions()));
          },
              child: Text('   START CODING !   ', style: TextStyle(color: Colors.white),),
            style:
            ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
              shadowColor: Colors.black12,
              elevation: 40
            ),
          )

    ]
    )
      )
    )
      )
    );
  }
}

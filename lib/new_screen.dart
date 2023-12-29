import 'package:flutter/material.dart';


class NewScreen extends StatefulWidget {
  const NewScreen({super.key});

  @override
  State<NewScreen> createState() => _NewScreenState();
}

class _NewScreenState extends State<NewScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,backgroundColor: Colors.white,
          leading: IconButton(
            onPressed: (){
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_outlined,color: Colors.black,),),
        ),


        body: const Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Risks",style: TextStyle(

                fontSize: 20,color: Colors.black,fontWeight: FontWeight.w700
            ),),
            SizedBox(height: 5,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Divider(thickness: 2,height: 2,color: Color(0xff212121),),
            ),
            SizedBox(height: 5,),

            ListTile(
              leading: Icon(Icons.sunny,color: Colors.black,),
              title: Text("This additive is carcinogenic.",style: TextStyle(

                  fontSize: 18,color: Colors.black,fontWeight: FontWeight.w600
              ),),
            ),

            ListTile(
              leading: Icon(Icons.record_voice_over,color: Colors.black,),
              title: Text("This additive is not for \n asthmatics",style: TextStyle(

                  fontSize: 18,color: Colors.black,fontWeight: FontWeight.w600
              ),),
            ),


            ListTile(
              leading: Icon(Icons.face,color: Colors.black,),
              title: Text("This additive is not recommended\nfor babies or young children",style: TextStyle(

                  fontSize: 18,color: Colors.black,fontWeight: FontWeight.w600
              ),),
            ),
            SizedBox(height: 30,),

            Text("Origin",style: TextStyle(

                fontSize: 20,color: Colors.black,fontWeight: FontWeight.w700
            ),),
            SizedBox(height: 5,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Divider(thickness: 2,height: 2,color: Color(0xff212121),),
            ),
            SizedBox(height: 5,),

            ListTile(
              leading: Icon(Icons.energy_savings_leaf,color: Colors.black,),
              title: Text("This additive is suitable for vegans.",style: TextStyle(

                  fontSize: 18,color: Colors.black,fontWeight: FontWeight.w600
              ),),
            ),

            ListTile(
              leading: Icon(Icons.energy_savings_leaf_outlined,color: Colors.black,),
              title: Text("This additive is suitable for\nvegetarians",style: TextStyle(

                  fontSize: 18,color: Colors.black,fontWeight: FontWeight.w600
              ),),
            ),


          ],
        ),
      ),),
    );
  }
}

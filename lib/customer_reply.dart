import 'dart:ui';

import 'package:customer/new_screen.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';

class CustomerReply extends StatefulWidget {
  const CustomerReply({Key? key}) : super(key: key);

  @override
  State<CustomerReply> createState() => _CustomerReplyState();
}

class _CustomerReplyState extends State<CustomerReply> {
  List<List<Map<String, dynamic>>> _dataListsByDate = [
    // Data for the 1st of the month
    [
      {'id': '#335654', 'number': '#33488'},
      {'id': '#335654', 'number': '#33488'},
      {'id': '#335654', 'number': '#33488'},
      {'id': '#335654', 'number': '#33488'},

      // ... add more data items ...
    ],
    // Data for the 2nd of the month
    [
      {'id': '#668899', 'number': '#33385'},
      {'id': '#335789', 'number': '#39088'},

      // ... add more data items ...
    ],
    [
      {'id': '#668899', 'number': '#33385'},
      {'id': '#335789', 'number': '#39088'},

      // ... add more data items ...
    ],
    [
      {'id': '#668899', 'number': '#33385'},
      {'id': '#335789', 'number': '#39088'},
      {'id': '#335789', 'number': '#39088'},
      {'id': '#335789', 'number': '#39088'},
      // ... add more data items ...
    ],
    [
      {'id': '#668899', 'number': '#33385'},

      // ... add more data items ...
    ],
    [
      {'id': '#6699', 'number': '#33385'},
      {'id': '#335789', 'number': '#39088'},
      {'id': '#335789', 'number': '#39088'},
      {'id': '#335789', 'number': '#39088'},
      {'id': '#335789', 'number': '#39088'},

      // ... add more data items ...
    ],
    // ... repeat for other dates ...
  ];

  int selectedIndex = 0;
  DateTime now = DateTime.now();
  late DateTime lastDayOfMonth;

  @override
  void initState() {
    super.initState();
    lastDayOfMonth = DateTime(now.year, now.month + 1, 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        toolbarHeight: 80,
        elevation: 5,
        leading: Icon(Icons.arrow_back_outlined),
        title: const Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "SO",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 10,
          ),

          Center(
            child: Container(
              height: 100,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 10,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: const ClampingScrollPhysics(),
                child: Row(
                  children: List.generate(
                    lastDayOfMonth.day,
                    (index) {
                      final currentDate =
                          lastDayOfMonth.add(Duration(days: index + 1));
                      final dayName = DateFormat('E').format(currentDate);
                      return Padding(
                        padding: EdgeInsets.only(
                            left: index == 0 ? 16.0 : 0.0, right: 16.0),
                        child: GestureDetector(
                          onTap: () => setState(() {
                            selectedIndex = index;
                          }),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 42.0,
                                width: 42.0,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: selectedIndex == index
                                      ? Colors.orange
                                      : Colors.transparent,
                                  borderRadius: BorderRadius.circular(44.0),
                                ),
                                child: Text(
                                  dayName.substring(0, 1),
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    color: selectedIndex == index
                                        ? Colors.white
                                        : Colors.black54,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 8.0),
                              Text(
                                "${index + 1}",
                                style: const TextStyle(
                                  fontSize: 16.0,
                                  color: Colors.black54,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 8.0),
                              Container(
                                height: 2.0,
                                width: 28.0,
                                color: selectedIndex == index
                                    ? Colors.orange
                                    : Colors.transparent,
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),

          Expanded(
            child: Visibility(
              visible: _dataListsByDate[selectedIndex].isNotEmpty,
              replacement: const Center(
                child: Text(
                  "No card appears",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              child: ListView.builder(
                itemCount: _dataListsByDate[selectedIndex].length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 15),
                    child: Card(
                      elevation: 15,
                      child: _buildCardContents(context, index),
                    ),
                  );
                },
              ),
            ),
          ),


          // Here Floating Action Button for adding card
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                const Spacer(),
                Container(
                  height: 65,width: 65,decoration: const BoxDecoration(
                  shape: BoxShape.circle
                ),
                  child: FloatingActionButton(
                    backgroundColor: Colors.red,
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return
                            BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                              child: Dialog(
                                backgroundColor: const Color(0xffFFFFFF),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 10.0,),
                                  child: Container(
                                    width: MediaQuery.sizeOf(context).width*1,
                                    height: MediaQuery.sizeOf(context).height*0.21,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10)
                                    ),
                                    child: const Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        ListTile(
                                          contentPadding: EdgeInsets.symmetric(horizontal: 10),
                                          leading: Icon(Icons.camera_alt_rounded,color: Colors.black,),
                                          title: Text("Camera",style: TextStyle(
                                              fontSize: 18,color: Colors.black,fontWeight: FontWeight.w600
                                          ),),
                                        ),
                                        ListTile(
                                          contentPadding: EdgeInsets.symmetric(horizontal: 10),
                                          leading: Icon(Icons.photo,color: Colors.black,),
                                          title: Text("Gallery",style: TextStyle(

                                              fontSize: 18,color: Colors.black,fontWeight: FontWeight.w600
                                          ),),
                                        ),
                                        ListTile(
                                          contentPadding: EdgeInsets.symmetric(horizontal: 10),
                                          leading: Icon(Icons.text_fields_outlined,color: Colors.black,),
                                          title: Text("Text",style: TextStyle(

                                              fontSize: 18,color: Colors.black,fontWeight: FontWeight.w600
                                          ),),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                        },
                      );
                    },
                    child: const Icon(Icons.add),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20,),




        ],
      ),
    );
  }

  Widget _buildCardContents(BuildContext context, int index) {
    double cardWidth = MediaQuery.of(context).size.width - 20;
    return InkWell(
      onTap: (){
        setState(() {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>const NewScreen()));
        });

      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        height: 120,
        width: cardWidth,
        child: Stack(
          children: [
            Positioned(
            right: 0,
              top: 0,
              child: Container(
                child: const Center(
                  child: Text(
                    'Customer Reply',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                height: 35,
                width: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      offset: const Offset(0, 25),
                      blurRadius: 3,
                      spreadRadius: -10,
                    )
                  ],
                  color: Colors.red,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 14, left: 15),
              child: Text(
                _dataListsByDate[selectedIndex][index]['id'],
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 45, left: 15),
              child: Text(
                _dataListsByDate[selectedIndex][index]['number'],
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
            ),
            Positioned(
              left: 10,
              top: 90,
              child: Image.asset(
                'assets/icon.jpeg',
                height: 25,
              ), // Replace 'assets/image.png' with your image path
            ),
            // child: ImageIcon(
            //   AssetImage('assets/icon.jpeg'), // Replace with your image asset path
            //   size: 20,
            //   color: Colors.red,
            // ),

            Positioned(
              left: 295,
              top: 83,
              child: GestureDetector(
                onTap: () {
                  _showDeleteConfirmation(index);
                },
                child: const Icon(
                  Icons.delete,
                  size: 30,
                  color: Colors.red,
                ),
              ),
            ),



          ],
        ),
      ),
    );
  }

  void _showDeleteConfirmation(int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 50,
          width: 50,
          child:

          AlertDialog(
            title: const Text("Delete Card"),
            content: const Text("Are you sure you want to delete this card?"),
            actions: [
              TextButton(
                onPressed: () {
                  setState(() {
                    _dataListsByDate[selectedIndex].removeAt(index);
                  });
                  _showDeleteToast();
                  Navigator.pop(context);
                },
                child: const Text(
                  "Yes",
                  style: TextStyle(color: Colors.red),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  "No",
                  style: TextStyle(color: Colors.red),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _showDeleteToast() {
    Fluttertoast.showToast(
      msg: "Card deleted",
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.CENTER,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

}

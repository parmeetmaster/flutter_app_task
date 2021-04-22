

import 'package:flutter/material.dart';
import 'package:flutter_app_task/globals/constant_function.dart';
import 'package:flutter_app_task/utils/app_logger.dart';
import 'package:flutter_app_task/widgets/TextInput.dart';
import 'package:flutter_app_task/widgets/drop_down.dart';
import 'package:flutter_app_task/widgets/multiTextInput.dart';

class UploadScreen extends StatefulWidget {
  static const classname="/UploadScreen";
  @override
  _UploadScreenState createState() => _UploadScreenState();
}

class _UploadScreenState extends State<UploadScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 50,),
            Column(
              children: [
                Text("Add Product",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold,
                )),

                SizedBox(height: 20,),
                Row(

                  children: [
                    SizedBox(width: 25,),
                    Text("Category",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold,
                    )),
                    SizedBox(width: 30,),
                    Container(
                        height: 50,
                        child: DropDownWidget(listitems: [
                          'Android',
                          'IOS',
                          'Flutter',
                          'Node',
                          'Java',
                          'Python',
                          'PHP',
                        ],onItemSelected: (item){
                          AppLogger.print(item);

                        },)),
                  ],
                ),
              SizedBox(height: 20,),
                Container(
                  width: getScreenWidth(context),
                  height: 80,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(width: 25,),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 17),
                        child: Text("Name",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold,
                        )),
                      ),
                      SizedBox(width: 60,),
                      Container(
                          constraints: BoxConstraints(minWidth: 100, maxWidth: getScreenWidth(context)*0.6),
                          child: SingleLineTextInput(icon: Icons.person,height: 80,)),
                    ],
                  ),
                ),
                SizedBox(height: 10,),
                Container(
                  width: getScreenWidth(context),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(width: 25,),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 17),
                        child: Text("Description",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold,
                        )),
                      ),
                      SizedBox(width: 10,),
                      Container(
                          constraints: BoxConstraints(minWidth: 100,maxWidth: 250),
                          child: MultiLineTextInput(icon: Icons.person,height: 80,)),
                    ],
                  ),
                ),
              ],
            ),


          ],

        ),
      ),

    );
  }
}

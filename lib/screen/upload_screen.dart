

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_app_task/globals/constant_function.dart';
import 'package:flutter_app_task/globals/constants.dart';
import 'package:flutter_app_task/providers/upload_screen_provider.dart';
import 'package:flutter_app_task/utils/app_logger.dart';
import 'package:flutter_app_task/widgets/TextInput.dart';
import 'package:flutter_app_task/widgets/button.dart';
import 'package:flutter_app_task/widgets/drop_down.dart';
import 'package:flutter_app_task/widgets/image_box.dart';
import 'package:flutter_app_task/widgets/multiTextInput.dart';
import 'package:provider/provider.dart';

class UploadScreen extends StatefulWidget {
  static const classname="/UploadScreen";
  @override
  _UploadScreenState createState() => _UploadScreenState();
}

class _UploadScreenState extends State<UploadScreen> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<UploadScreenProvider>(
        builder: (context, value,child) {
         if(value.currunt_state==appstate.loading_complete)
          return SingleChildScrollView(
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
                            child: DropDownWidget(listitems: value.listItemsForSelection,onItemSelected: (item){
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
                          Expanded(
                            flex: 3,
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 17),
                              child: Text("Name",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold,
                              )),
                            ),
                          ),
                          Expanded(
                            flex: 7,
                            child: Container(
                                child: SingleLineTextInput(icon: Icons.person,height: 80,controller: value.nameController,)),
                          ),
                          SizedBox(width: 25,),


                        ],
                      ),
                    ),
                    Container(
                      width: getScreenWidth(context),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(width: 25,),
                          Expanded(
                            flex: 3,
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 17),
                              child: Text("Description",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold,
                              )),
                            ),
                          ),
                          Expanded(
                            flex: 7,
                            child: Container(
                                child: MultiLineTextInput(icon: Icons.person,height: 80,controller: value.descriptionController,)),
                          ),
                          SizedBox(width: 25,),


                        ],
                      ),
                    ),
                    Container(
                      width: getScreenWidth(context),
                      height: 80,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(width: 25,),
                          Expanded(
                            flex: 3,
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 17),
                              child: Text("Expiry Date",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold,
                              )),
                            ),
                          ),
                          Expanded(
                            flex: 7,
                            child: InkWell(
                              onTap: () async {
                                DateTime date = DateTime.now();
                                FocusScope.of(context).requestFocus(new FocusNode());
                                DateTime picked = await showDatePicker(
                                  context: context,
                                  firstDate: DateTime.now().subtract(Duration(days: 0)),
                                  initialDate: DateTime.now(),
                                  lastDate: DateTime(DateTime.now().year,
                                      DateTime.now().month + 1, 31),
                                );
                                if (picked != null && picked != date) {
                                  // add this line.
                                  value.setDate(picked);
                                }
                              },
                              child: AbsorbPointer(
                                child: Container(
                                    child: SingleLineTextInput(icon: Icons.person,height: 80,controller: value.expiryController,)),
                              ),
                            ),
                          ),
                          SizedBox(width: 25,),


                        ],
                      ),
                    ),
                    Container(
                      width: getScreenWidth(context),
                      height: 80,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(width: 25,),
                          Expanded(
                            flex: 3,
                            child: Text("Select Image",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold,
                            )),
                          ),
                          Expanded(
                            flex: 7,
                            child: RaisedGradientButton(
                                child: Text(
                                  'Add More Images',
                                  style: TextStyle(color: Colors.white),
                                ),
                                gradient: LinearGradient(
                                  colors: <Color>[Colors.lightBlueAccent, Colors.lightBlue],
                                ),
                                onPressed: (){
                                  value.pickImage();
                                }
                            ),
                          ),
                          SizedBox(width: 25,),
                        ],
                      ),
                    ),
                 // ImageBox(file:value.image),
                    Container(width: getScreenWidth(context),
                    child: Container(
                      padding: EdgeInsets.all(10),
                      height: 110,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.blueAccent)
                      ),

                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context,i){
                          return ImageBox(index:i,file:value.images[i],onremove:(index){
                            value.onremove(index);
                          });

                        },
                        itemCount: value.images.length,
                      ),

                    ),
                    )

                  ],
                ),
                RaisedGradientButton(
                    child: Text(
                      'upload data',
                      style: TextStyle(color: Colors.white),
                    ),
                    gradient: LinearGradient(
                      colors: <Color>[Colors.lightBlueAccent, Colors.lightBlue],
                    ),
                    onPressed: (){
                      value.onsubmit();
                    }
                )

              ],

            ),
          );
         else{
           return Container();
         }
        }
      ),

    );
  }



  @override
  void initState() {
    final provider =Provider.of<UploadScreenProvider>(context,listen: false);
    provider.init();
  }
}

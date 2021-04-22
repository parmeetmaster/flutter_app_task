import 'dart:io';

import 'package:flutter/material.dart';

class ImageBox extends StatelessWidget {
  File file;
  int index;
Function(int) onremove;
  ImageBox({this.index,this.file,this.onremove});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      height: 100,
      width: 100,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15.0),
            child: Image.file(  file,fit:BoxFit.fill),
          ),
          Positioned(
            right: 0,
              bottom: 0,
              child: InkWell(
                onTap: (){
                   onremove(index);
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: Container(
                      height: 30,
                     width: 30,
                    color: Colors.red[800],
                   child: Center(child: Icon(Icons.close ,color: Colors.white, )),
          ),
                ),
              )),
        ],
      ),
    );
  }
}

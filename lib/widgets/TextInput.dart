
import 'package:flutter/material.dart';


class SingleLineTextInput extends StatelessWidget {
  String m_hintText;
  String m_helperText;
  String m_labelText;
  TextEditingController controller;
  double height;
  IconData icon;

  SingleLineTextInput(

      {this.height,this.m_hintText="", this.m_helperText="", this.m_labelText="", this.controller,this.icon});
  @override
  Widget build(BuildContext context) {
    return  Container(
      height: height,
      child: new TextField(
        controller: controller,

        keyboardType: TextInputType.multiline,
        decoration: new InputDecoration(
            contentPadding: EdgeInsets.all(20.0),
            border: new OutlineInputBorder(
                borderSide: new BorderSide(color: Colors.teal)),
            hintText: m_hintText,
            helperText: m_helperText,
            labelText: m_labelText,

            prefixText: ' ',
            suffixIcon:InkWell(
              onTap: (){
                controller.text="";
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                    backgroundColor: Colors.grey[200],
                    child: Icon(Icons.clear)),
              ),
            ),
            suffixStyle: const TextStyle(color: Colors.red)),
      ),
    );
  }
}

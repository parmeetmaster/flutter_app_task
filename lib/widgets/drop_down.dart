import 'package:flutter/material.dart';

class DropDownWidget extends StatefulWidget {

  var listitems;
  Function(String) onItemSelected;

  DropDownWidget({this.listitems,this.onItemSelected});
  
  @override
  _DropDownWidgetState createState() => _DropDownWidgetState();
}

class _DropDownWidgetState extends State<DropDownWidget> {
  String _chosenValue;

  @override
  Widget build(BuildContext context) {
    return Container(

      decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey,
          ),
          borderRadius: BorderRadius.circular(
              20) // use instead of BorderRadius.all(Radius.circular(20))
          ),
      padding: const EdgeInsets.all(10.0),
      child: DropdownButton<String>(
        underline: SizedBox(),

        focusColor: Colors.white,
        value: _chosenValue,
        //elevation: 5,
        style: TextStyle(
          color: Colors.black,
        ),
        iconEnabledColor: Colors.black,

        items: widget.listitems.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        hint: Text(
          "Please choose a Category",
          style: TextStyle(
              color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600),
        ),
        onChanged: (String value) {
          setState(() {
            _chosenValue = value;
            widget.onItemSelected(value);
          });
        },
      ),
    );
  }
}

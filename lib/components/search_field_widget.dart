

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_app/constants.dart';

class SearchFieldWidget extends StatelessWidget{
  const SearchFieldWidget({Key? key, required this.padding}) :
  super(key:key);

  final EdgeInsetsGeometry padding;

  @override 
  Widget build(BuildContext context){
    return Padding(
      padding: padding,
      child: Container(
        height:36,
        decoration: BoxDecoration(
          color: Constants.kGreyColor.withOpacity(0.12),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(children: [
          const SizedBox(
            width: 8,
          ),
          SvgPicture.asset(
            Constants.kIconSearch,
          ),
          SizedBox(width: 10,),
        const  Expanded(
            child: TextField(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 12.0),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
                )
              ),
              style: TextStyle(
                color: Color.fromARGB(150, 255, 255, 255),
                fontSize: 17,
                letterSpacing: -0.4,
              ),
            )
            ),
            const SizedBox(width: 8,),
            SvgPicture.asset(Constants.kIconMic),
             const SizedBox(width: 8,),
              
        ],),

      )
    );
  }

}
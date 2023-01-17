import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class generalfont extends StatelessWidget {
  String txt1;
  double size;
  TextOverflow overflow;
  final  Color color;
  
  generalfont({super.key,  this.size= 18, required this.txt1, this.color=Colors.black87,
   this.overflow=TextOverflow.ellipsis});

  @override
  Widget build(BuildContext context) {
    return Text(
      txt1,
     overflow: overflow,
     style: GoogleFonts.raleway(
      color: color,
      fontSize: size,
      fontWeight: FontWeight.w700
     ) ,
    );
  }
}

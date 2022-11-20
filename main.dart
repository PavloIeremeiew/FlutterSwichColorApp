import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatefulWidget{
  const MyApp({Key? key}): super(key: key);
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _r=255,_g=255,_b=255,_lenSwich=0,_fontsSwich=0;
  var _rn=255.toRadixString(16),_gn=255.toRadixString(16),_bn=255.toRadixString(16);
  var _len=["Hey there","Привіт","Ehilà","Сәлем","Γεια σου","ჰეი მანდ"],
      _fonts=["Times New Roman","Arial Black","Blackadder ITC","Comic Sans MS","Bahnschrift SemiBold","Bradley Hand ITC"],
  _rList=[255],_gList=[255],_bList=[255];
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      theme: ThemeData(),
      home: GestureDetector(onTap:swichColor ,
        child: Scaffold(backgroundColor: Color.fromARGB(255, _r, _g, _b),
          appBar: AppBar(backgroundColor: Color.fromARGB(255, 255-_r, 255-_g, 255-_b),
           title:  Text('#$_rn$_gn$_bn''ff',style: TextStyle(
             color: Color.fromARGB(255, _r, _g, _b),
             ),),
             centerTitle: true,actions: [
           IconButton(onPressed: colorBack,
            icon: const Icon(Icons.refresh),
            color: Color.fromARGB(255, _r, _g, _b)),
             const Padding(padding: EdgeInsets.only(left:30))],),
          body:  Center(
           child:Text(_len[_lenSwich],style: TextStyle(
            color: Color.fromARGB(255, 255-_r, 255-_g, 255-_b),
            fontSize:35,
            fontFamily:_fonts[_fontsSwich]
            )
           )
          ),
       ),)
    );
  }
  void swichColor(){
    setState(() {
      _r=Random().nextInt(256);
      _g=Random().nextInt(256);
      _b=Random().nextInt(256);
      _rn=_r.toRadixString(16);
      _gn=_g.toRadixString(16);
      _bn=_b.toRadixString(16);
      _rList.add(_r);
      _gList.add(_g);
      _bList.add(_b);
      textSwich();


    });
  }
  void textSwich(){
    setState(() {

      _lenSwich++;
      if(_lenSwich>=_len.length) _lenSwich=0;
      _fontsSwich++;
      if(_fontsSwich>=_fonts.length) _fontsSwich=0;


    });
  }
  void colorBack(){
    setState(() {
      if(_rList.length>1){
      _rList.removeLast();
      _gList.removeLast();
      _bList.removeLast();
      _r=_rList.last;
      _g=_gList.last;
      _b=_bList.last;
      _rn=_r.toRadixString(16);
      _gn=_g.toRadixString(16);
      _bn=_b.toRadixString(16);
      _lenSwich--;
      if(_lenSwich<0) _lenSwich=_len.length-1;
      _fontsSwich--;
      if(_fontsSwich<0) _fontsSwich=_fonts.length-1;
      }
    });
  }

}


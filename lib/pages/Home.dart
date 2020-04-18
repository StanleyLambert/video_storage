import 'dart:math';

import 'package:flutter/material.dart';

class Home extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {

    return _HomeState();
      }
      
    }
    
 class _HomeState extends State<Home>{

final _minimumPadding = 5.0;

  @override
  Widget build(BuildContext context) {
    
    TextStyle textStyle = Theme.of(context).textTheme.body1;

    return Scaffold(
     // resizeToAvoidBottomPadding: false,
      backgroundColor: Color(0XFF1aa3ff),
      appBar: AppBar(
        title: Text('Cloud Video Storage'),
        ),
      
      body: Container(
        margin: EdgeInsets.all( _minimumPadding * 2),
        child: ListView(
          children: <Widget>[
            
            getImageAsset(),

            Padding(
              padding: EdgeInsets.only(
                        top: _minimumPadding * 5,
                        bottom: _minimumPadding, 
                        left: _minimumPadding * 2,
                        right: _minimumPadding * 2
                       ),
              child: Container(
                width: 80.0,
                height: 40.0,
                child: TextField(            
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      //hoverColor: Colors.green,
                      hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
                      hintText: 'search video name',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0), 
                        ),
                      ),
                    ),
                ),
              
            ),

            Padding(
              padding: EdgeInsets.only(
                          top: _minimumPadding, 
                          bottom: _minimumPadding,
                          left: _minimumPadding * 5,
                          right: _minimumPadding * 5
                        ),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: RaisedButton(
                      
                      child: Text('Search All'),
                      onPressed: () {},
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(15.0),
                        
                      ),
                      color: Color(0XFFe67300),
                      textColor: Colors.white,
                    ), 
                    ),
                    
                    Container(width: _minimumPadding * 2),

                    Expanded(
                    child: RaisedButton(
                      child: Text('Search'),
                      onPressed: () {},
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(15.0),
                        
                      ),
                      color: Colors.green,
                      textColor: Colors.white,
                    ), 
                    ),

                ],
              )
            ),

          Padding(
            padding: EdgeInsets.only(top: _minimumPadding * 25, left: _minimumPadding * 3, right: _minimumPadding * 2),
            child: Row(
              children: <Widget>[
                Container(
                  child: RaisedButton.icon(
                    onPressed: () {},
                    elevation: 2.0,
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(5.0),
                    ),
                    color: Color(0XFFff3377),
                    icon: Icon(Icons.video_library, color: Colors.white,),
                    label: Text('Upload', style: TextStyle(fontWeight: FontWeight.w900, color: Colors.white),),
                  ),
                ),

                Container(
                  width: _minimumPadding,
                ),

                Container(
                  child: RaisedButton.icon(
                    onPressed: (){},
                    elevation: 2.0,
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(5.0),
                      ),
                    color: Color(0XFF004d80),
                    icon: Icon(Icons.details, color: Colors.white,),
                    label: Text('About', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w900),),  
                  ),
                ),  

                Container(
                  width: _minimumPadding,
                ),
                
                Container(
                    // width: 50.0,
                    // height: 50.0,
                  //   child: RaisedButton(
                  //     onPressed: () {},
                  //     child: new Row(
                  //       mainAxisAlignment: MainAxisAlignment.center,
                  //       mainAxisSize: MainAxisSize.min,
                  //       children: <Widget>[
                  //       new Text('sfmfjb'),
                  //       new Icon(Icons.video_library),
                  //         ],
                  //        ),

                  
                  // ),

                  child: RaisedButton.icon(
                    onPressed: (){},
                    elevation: 2.0,
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(5.0),
                      ),
                    color: Color(0XFF004d80),
                    //const Color(0xFFFFB822),
                    icon: Icon(Icons.phone, color: Colors.white,),
                    label: Text("Contact", style: TextStyle(fontWeight: FontWeight.w900, color: Colors.white),),
                    
                    ),

                  ),
                  


              ],
            ),
          ),


          ],
        ),
      ),
    );
  }


  Widget getImageAsset(){
    AssetImage assetImage = AssetImage('images/vid_logo03.png');
    Image image = Image(image: assetImage, width:125.0, height: 125.0,);

    return Container(
      child: image,
      // margin: EdgeInsets.only(left: 50.0),
        margin: EdgeInsets.only(
                            left: _minimumPadding * 4,
                            right: _minimumPadding * 4,
                            top: _minimumPadding * 4
                          ),
       );
  }
   
 }
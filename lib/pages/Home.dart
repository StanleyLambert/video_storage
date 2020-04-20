import 'package:flutter/material.dart';
import 'package:sample_ui/pages/AboutUs.dart';
import 'package:sample_ui/pages/ContactUs.dart';
import 'SearchResult.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

// create a class to return scaffold, this will be the home screen
class _HomeState extends State<Home> {
  // variables

  final DocumentReference documentReference = Firestore.instance.document("video/sample");

  final _minimumPadding = 5.0;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = new GoogleSignIn();

  // method to sign in with google account...................................     login      ........................
  Future<FirebaseUser> _signIn() async {
    final GoogleSignInAccount googleSignInAccount =
        await _googleSignIn.signIn();

    final GoogleSignInAuthentication gSA =
        await googleSignInAccount.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
      idToken: gSA.idToken,
      accessToken: gSA.accessToken,
    );

    final FirebaseUser user =
        (await _auth.signInWithCredential(credential)).user;
    assert(user.email != null);
    assert(user.displayName != null);
    assert(!user.isAnonymous);
    assert(await user.getIdToken() != null);

    final FirebaseUser currentUser = await _auth.currentUser();
    assert(user.uid == currentUser.uid);

    print('user name : ${user.displayName}');

    return user;
  }

  // method to sign out from the google account..................................    signout     ......................
  void _signOut() {
    _googleSignIn.signOut();
    print('Sign out successfull');
  }

  // method to add data in the firebase...........................................    add        ........................
  void _add(){

    print('add function is working ');
    //_signIn().then((FirebaseUser user) => print(user)).catchError((e) => print(e));

    Map<String, String> data = <String, String>{
      "Name" : "Sundher",
      "desc" : "Student"
    };

    documentReference.setData(data).whenComplete(() {
        print('Document Added');
    }).catchError((e) => print('error - $e') );

  }

  @override
  Widget build(BuildContext context) {
    //TextStyle textStyle = Theme.of(context).textTheme.body1;

    return Scaffold(
      // resizeToAvoidBottomPadding: false,
      backgroundColor: Color(0XFF1aa3ff),
      appBar: AppBar(
        title: Text('Cloud Video Storage'),
      ),

      body: Container(
        margin: EdgeInsets.all(_minimumPadding * 2),
        child: ListView(
          children: <Widget>[
            getImageAsset(), // set an image in the top of the home screen
            Padding(
              padding: EdgeInsets.only(
                  top: _minimumPadding * 5,
                  bottom: _minimumPadding,
                  left: _minimumPadding * 2,
                  right: _minimumPadding * 2),
              child: Container(                   // wrapping the textfield with a container to add size
                width: 80.0,
                height: 40.0,                   
                child: TextField(                 // Text field to get search string
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
                    right: _minimumPadding * 5),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: RaisedButton(          // Raised button to search all the videos uploaded
                        child: Text('Search All'),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SearchResult()),
                          );
                        },
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
                        onPressed: () => _signIn().then((FirebaseUser user) => print(user)).catchError((e) => print(e)),
                        shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(15.0),
                        ),
                        color: Colors.green,
                        textColor: Colors.white,
                      ),
                    ),
                  ],
                )),
            Padding(
              padding: EdgeInsets.only(
                  top: _minimumPadding * 25,
                  left: _minimumPadding * 3,
                  right: _minimumPadding * 2),
              child: Row(
                children: <Widget>[
                  Container(
                    child: RaisedButton.icon(
                      onPressed: () => _add(),
                      // onPressed: () => _signIn()
                      //     .then((FirebaseUser user) => print(user))
                      //     .catchError((e) => print(e)),
                      elevation: 2.0,
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(5.0),
                      ),
                      color: Color(0XFFff3377),
                      icon: Icon(
                        Icons.video_library,
                        color: Colors.white,
                      ),
                      label: Text(
                        'Upload',
                        style: TextStyle(
                            fontWeight: FontWeight.w900, color: Colors.white),
                      ),
                    ),
                  ),
                  Container(
                    width: _minimumPadding,
                  ),
                  Container(
                    child: RaisedButton.icon(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => AboutUs()),
                        );
                      },
                      elevation: 2.0,
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(5.0),
                      ),
                      color: Color(0XFF004d80),
                      icon: Icon(
                        Icons.details,
                        color: Colors.white,
                      ),
                      label: Text(
                        'About',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w900),
                      ),
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
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ContactUs()),
                        );
                      },
                      elevation: 2.0,
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(5.0),
                      ),
                      color: Color(0XFF004d80),
                      //const Color(0xFFFFB822),
                      icon: Icon(
                        Icons.phone,
                        color: Colors.white,
                      ),
                      label: Text(
                        "Contact",
                        style: TextStyle(
                            fontWeight: FontWeight.w900, color: Colors.white),
                      ),
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

  Widget getImageAsset() {
    AssetImage assetImage = AssetImage('images/vid_logo03.png');
    Image image = Image(
      image: assetImage,
      width: 125.0,
      height: 125.0,
    );

    return Container(
      child: image,
      // margin: EdgeInsets.only(left: 50.0),
      margin: EdgeInsets.only(
          left: _minimumPadding * 4,
          right: _minimumPadding * 4,
          top: _minimumPadding * 4),
    );
  }
}

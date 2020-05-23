import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_photography/data/Sample.dart';
import 'package:flutter_photography/helper/Colorsys.dart';
import 'package:flutter_photography/models/Collocation.dart';
import 'package:flutter_photography/models/User.dart';

class SingleUser extends StatefulWidget {
  final User user;

  const SingleUser({Key key, this.user}) : super(key: key);
  
  @override
  _SingleUserState createState() => _SingleUserState();
}

class _SingleUserState extends State<SingleUser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colorsys.lightGrey,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: BackButton(
          onPressed: () {
            Navigator.pop(context);
          },
          color: Colorsys.grey,
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.more_horiz, size: 25, color: Colorsys.grey,),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15), bottomRight: Radius.circular(15)),
                color: Colors.white
              ),
              child: Column(
                children: <Widget>[
                  Hero(
                    transitionOnUserGestures: true,
                    tag: widget.user.username,
                    child: CircleAvatar(
                      backgroundImage: AssetImage(widget.user.profilePicture),
                      maxRadius: 40,
                    ),
                  ),
                  SizedBox(height: 20,),
                  Text(widget.user.name, style: TextStyle(
                    fontSize: 20,
                    color: Colorsys.black,
                    fontWeight: FontWeight.bold
                  ),),
                  SizedBox(height: 5,),
                  Text(widget.user.username, style: TextStyle(
                    fontSize: 15,
                    color: Colorsys.grey
                  ),),
                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      makeFollowWidgets(
                        count: widget.user.followers,
                        name: "Followers"
                      ),
                      Container(
                        width: 2,
                        height: 15,
                        margin: EdgeInsets.symmetric(horizontal: 20),
                        color: Colorsys.lightGrey,
                      ),
                      makeFollowWidgets(
                        count: widget.user.following,
                        name: "Following"
                      ),
                    ],
                  ),
                  SizedBox(height: 20,),
                  makeActionButtons()
                ],
              ),
            ),
            SizedBox(height: 30,),
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      border: Border(bottom: BorderSide(
                        color: Colorsys.grey300,
                      ))
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text("Collotion", style: TextStyle(
                              color: Colorsys.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 15
                            ),),
                            Container(
                              width: 50,
                              padding: EdgeInsets.only(bottom: 10),
                              decoration: BoxDecoration(
                                border: Border(bottom: BorderSide(
                                  color: Colorsys.orange,
                                  width: 3
                                ))
                              ),
                            )
                          ],
                        ),
                        SizedBox(width: 20,),
                        Text("Likes", style: TextStyle(
                          color: Colorsys.grey,
                          fontWeight: FontWeight.w500,
                          fontSize: 15
                        ),)
                      ],
                    ),
                  ),
                  makeColloction(widget.user.collocation)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  
  Widget makeColloction(List<Collocation> collocation) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 20),
            height: 320,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: collocation.length,
              itemBuilder: (context, index) {
                return AspectRatio(
                  aspectRatio: 1.2/1,
                  child: Column(
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(right: 20),
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(collocation[index].thumbnail),
                              fit: BoxFit.cover
                            ),
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.orange
                          ),
                          child: Stack(
                            alignment: AlignmentDirectional.bottomCenter,
                            children: <Widget>[
                              ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: BackdropFilter(
                                  filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                                  child: Container(
                                    height: 90,
                                    padding: EdgeInsets.symmetric(horizontal: 20),
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(24),
                                    ),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(collocation[index].name, style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 15
                                        ),),
                                        SizedBox(height: 5,),
                                        Text(collocation[index].tags.length.toString() + " photos", style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w300
                                        ),)
                                      ],
                                    )
                                  ),
                                ),
                              ),
                            ]
                          )
                        ),
                      ),
                      SizedBox(height: 10,),
                      Container(
                        height: 32,
                        margin: EdgeInsets.only(right: 20),
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: collocation[index].tags.length,
                          itemBuilder: (context, tagIndex) => Container(
                            margin: EdgeInsets.only(right: 10),
                            padding: EdgeInsets.symmetric(horizontal: 25, vertical: 5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colorsys.grey300
                            ),
                            child: Center(
                              child: Text(collocation[index].tags[tagIndex], style: TextStyle(
                              ),),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }

  Widget makeFollowWidgets({count, name}) {
    return Row(
      children: <Widget>[
        Text(count.toString(),
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: Colorsys.black
          ),
        ),
      SizedBox(width: 5,),
      Text(name, 
        style: TextStyle(
          fontSize: 15,
          color: Colorsys.darkGray
        ),
      ),
      ],
    );
  }

  Widget makeActionButtons() {
    return Transform.translate(
      offset: Offset(0, 20),
      child: Container(
        height: 65,
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.symmetric(horizontal: 50),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey[300],
              blurRadius: 20,
              offset: Offset(0, 10)
            )
          ]
        ),
        child: Row(
          children: <Widget>[
            Expanded(
              child: MaterialButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
                height: double.infinity,
                elevation: 0,
                onPressed: () {
                },
                color: Colorsys.orange,
                child: Text("Follow", style: TextStyle(
                  color: Colors.white,
                ),)
              ),
            ),
            Expanded(
              child: MaterialButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
                height: double.infinity,
                elevation: 0,
                onPressed: () {
                },
                color: Colors.transparent,
                child: Text("Message", style: TextStyle(
                  color: Colorsys.black, 
                  fontWeight: FontWeight.w400
                ),)
              ),
            )
          ],
        ),
      ),
    );
  }
}
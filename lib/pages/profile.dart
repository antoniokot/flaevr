import 'package:flaevr/pages/config.dart';
import 'package:flutter/material.dart';
import 'package:flaevr/components/button.dart';

class Profile extends StatefulWidget {
  Profile({Key key}) : super(key: key);

  @override
  ProfileState createState() => ProfileState();
}

class ProfileState extends State<Profile> {
  bool isVisible = true;
  bool isOpaque = true;
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          body: Stack(
            children: <Widget>[
              SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    SizedBox(
                      height: 60,
                    ),
                    SizedBox(
                      height: 200,
                      child: ListView.builder(
                        physics: BouncingScrollPhysics(),
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: 15,
                        itemBuilder: (BuildContext context, int index) => Card(
                          child: Center(child: Text('Dummy Card Text')),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Favoritos',
                            style: TextStyle(fontSize: 18),
                          ),
                          Row(
                            children: [
                              Text(
                                'Data de Modificação',
                                style: TextStyle(fontSize: 18),
                              ),
                              Icon(Icons.expand_more)
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height - 200,
                      child: ListView.builder(
                        physics: BouncingScrollPhysics(),
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: 15,
                        itemBuilder: (BuildContext context, int index) => Card(
                          child: Center(child: Text('Dummy Card Text')),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                    alignment: Alignment.center,
                    height: 50,
                    width: size.width,
                    color: Colors.blue,
                    child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: 30,
                                height: 30,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          'https://images.pexels.com/photos/4345992/pexels-photo-4345992.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940'),
                                      fit: BoxFit.fill),
                                ),
                              ),
                              Text('Mariana Melo'),
                              Icon(Icons.settings)
                            ]))),
              ),
            ],
          )),
    );
  }
}

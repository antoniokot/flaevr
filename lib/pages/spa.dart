import 'package:flaevr/pages/product.dart';
import 'package:flaevr/pages/profile.dart';
import 'package:flutter/material.dart';

class Origin extends StatefulWidget {
  Origin({Key key}) : super(key: key);

  @override
  OriginState createState() => OriginState();
}

class OriginState extends State<Origin> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    Profile(),
    Product(),
    Product(),
    Product(),
    Profile()
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: EdgeInsets.only(top: 20, bottom: 15),
        child: SizedBox(
          height: 60,
          width: 60,
          child: FloatingActionButton(
            backgroundColor: Colors.transparent,
            elevation: 0,
            onPressed: () {},
            child: Container(
              height: 70,
              width: 70,
              decoration: BoxDecoration(
                  shape: BoxShape.circle, color: Color(0xFFFF4646)),
              child: Icon(Icons.camera_alt_outlined, size: 32),
            ),
          ),
        ),
      ),
      body: Stack(children: [
        _children[_currentIndex],
        Positioned(
            left: 30.0,
            right: 30.0,
            bottom: 20.0,
            child: new Container(
                width: MediaQuery.of(context).size.width - 60,
                height: 50.0,
                decoration: new BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                        icon: Icon(
                          Icons.home,
                          color: Color(0xFF3d3d4e),
                        ),
                        onPressed: () {
                          onTabTapped(0);
                        }),
                    IconButton(
                        icon: Icon(
                          Icons.search_outlined,
                          color: Color(0xFF3d3d4e),
                        ),
                        onPressed: () {
                          onTabTapped(1);
                        }),
                    IconButton(
                        icon: Icon(
                          Icons.home,
                          color: Color(0xFF3d3d4e),
                        ),
                        onPressed: () {}),
                    IconButton(
                        icon: Icon(
                          Icons.favorite_border,
                          color: Color(0xFF3d3d4e),
                        ),
                        onPressed: () {
                          onTabTapped(3);
                        }),
                    IconButton(
                        icon: Icon(
                          Icons.person_outline,
                          color: Color(0xFF3d3d4e),
                        ),
                        onPressed: () {
                          onTabTapped(4);
                        }),
                  ],
                )))
      ]),
      /*bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(
            // sets the background color of the `BottomNavigationBar`
            canvasColor: Colors.white,
            // sets the active color of the `BottomNavigationBar` if `Brightness` is light
            primaryColor: Color(0xFF3d3d4e),
          ),
          child: BottomNavigationBar(
            selectedFontSize: 12,
            unselectedFontSize: 12,
            onTap: onTabTapped,
            currentIndex: _currentIndex,
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home_outlined),
                  label: 'Home',
                  activeIcon: Icon(
                    Icons.home,
                    color: Color(0xFF3d3d4e),
                  )),
              BottomNavigationBarItem(
                  icon: Icon(Icons.search_outlined),
                  label: 'Search',
                  activeIcon: Icon(
                    Icons.search,
                    color: Color(0xFF3d3d4e),
                  )),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.search,
                  color: Color(0xFF3d3d4e),
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.favorite_border),
                  label: 'Favoritos',
                  activeIcon: Icon(
                    Icons.favorite,
                    color: Color(0xFF3d3d4e),
                  )),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person_outline),
                  label: 'Perfil',
                  activeIcon: Icon(
                    Icons.person,
                    color: Color(0xFF3d3d4e),
                  ))
            ],
          ),
        )*/
    );
  }
}

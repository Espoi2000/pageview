import 'dart:math';

import 'package:beautifulon/cleint_http.dart';
import 'package:flutter/material.dart';

class HomePAge extends StatefulWidget {
  const HomePAge({super.key});

  @override
  State<HomePAge> createState() => _HomePAgeState();
}

class _HomePAgeState extends State<HomePAge> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // ClientAPI.showimageAnime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).padding.top + kToolbarHeight,
              left: 40,
            ),
            child: const Text(
              "Fin you \n Picture",
              textAlign: TextAlign.left,
              style: TextStyle(
                letterSpacing: 1.3,
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 25,
                height: 1.5,
              ),
            ),
          ),
          const Expanded(
            child: PageViewWidget(),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        unselectedFontSize: 0,
        selectedFontSize: 0,
        backgroundColor: Colors.white,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.navigation,
                color: Colors.black,
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                color: Colors.black,
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.bookmark,
                color: Colors.black,
              ),
              label: '')
        ],
      ),
    );
  }
}

class PageViewWidget extends StatefulWidget {
  const PageViewWidget({super.key});

  @override
  State<PageViewWidget> createState() => _PageViewWidgetState();
}

class _PageViewWidgetState extends State<PageViewWidget> {
  List<Map<String, dynamic>> menuList = [
    {
      'image': 'assets/images/profil.jpg',
      'description': " voitifzlkfnlkzfnelknf",
      'text': 'Prince'
    },
    {
      'image': 'assets/images/prince.jpg',
      'description': " voitifzlkfnlkzfnelknf",
      'text': 'prince Hope'
    },
    {
      'image': 'assets/images/princesse2.jpg',
      'description': " voitifzlkfnlkzfnelknf",
      'text': 'princesse hope '
    },
    {
      'image': 'assets/images/siantou1.jpg',
      'description': " voitifzlkfnlkzfnelknf",
      'text': 'Princesse hope'
    },
    {
      'image': 'assets/images/siantou2.jpg',
      'description': " voitifzlkfnlkzfnelknf",
      'text': 'Princesse hope'
    },
    {
      'image': 'assets/images/siantou3.jpg',
      'description': " voitifzlkfnlkzfnelknf",
      'text': 'Princesse hope'
    },
    {
      'image': 'assets/images/voiture3.jpeg',
      'description': " voitifzlkfnlkzfnelknf",
      'text': 'Princesse hope'
    },
    {
      'image': 'assets/images/profil.jpg',
      'description': " voitifzlkfnlkzfnelknf",
      'text': 'Princesse hope'
    },
    {
      'image': 'assets/images/princesse2.jpg',
      'description': " voitifzlkfnlkzfnelknf",
      'text': 'Princesse hope'
    },
    {
      'image': 'assets/images/profil.jpg',
      'description': " voitifzlkfnlkzfnelknf",
      'text': 'Princesse hope'
    },
  ];
  // List<VacationBean>  _list = VacationBean.generate()
  PageController? pageController;

  double viewportFraction = 0.8;

  double? pageOffset = 0;

  @override
  void initState() {
    super.initState();
    pageController =
        PageController(initialPage: 0, viewportFraction: viewportFraction)
          ..addListener(() {
            setState(() {
              pageOffset = pageController!.page;
            });
          });
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: pageController,
      itemCount: menuList.length,
      itemBuilder: (context, index) {
        double scale = max(viewportFraction,
            (1 - (pageOffset! - index).abs()) + viewportFraction);

        double angle = (pageOffset! - index).abs();

        if (angle > 0.5) {
          angle = 1 - angle;
        }
        return Container(
          padding: EdgeInsets.only(
            right: 10,
            left: 20,
            top: 100 - scale * 25,
            bottom: 50,
          ),
          child: Transform(
            transform: Matrix4.identity()
              ..setEntry(
                3,
                2,
                0.001,
              )
              ..rotateY(angle),
            alignment: Alignment.center,
            child: Stack(
              children: <Widget>[
                Image.asset(
                  menuList[index]['image'],
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.none,
                  height: MediaQuery.of(context).size.height,
                  alignment: Alignment((pageOffset! - index).abs() * 0.5, 0),
                ),
                Positioned(
                  bottom: 60,
                  left: 20,
                  child: AnimatedOpacity(
                    opacity: angle == 0 ? 1 : 0,
                    duration: const Duration(
                      milliseconds: 200,
                    ),
                    child: Text(
                      menuList[index]['text'],
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.2,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}

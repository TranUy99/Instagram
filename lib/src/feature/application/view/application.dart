import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../constant/utils/color.dart';
import '../widget/application_widget.dart';

class Application extends StatefulWidget {
  const Application({super.key});

  @override
  State<Application> createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  int _index = 4;
  @override
  Widget build(BuildContext context) {
    return Container(
        color: kBlueBlandColor,
        child: SafeArea(
            child: Scaffold(
          body: buildPage(_index),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: _index,
            onTap: (value) {
              setState(() {
                _index = value;
              });
            },
            elevation: 0,
            type: BottomNavigationBarType.fixed,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            selectedItemColor: kBlueColor,
            unselectedItemColor: kGreyColor,
            items: const [
              BottomNavigationBarItem(
                  label: "home",
                  icon: Icon(Icons.home),
                  activeIcon: Icon(
                    Icons.home,
                    color: kBlueColor,
                  )),
              BottomNavigationBarItem(
                  label: "search",
                  icon: Icon(Icons.search),
                  activeIcon: Icon(
                    Icons.search,
                    color: kBlueColor,
                  )),
              BottomNavigationBarItem(
                  label: "post",
                  icon: Icon(Icons.upload),
                  activeIcon: Icon(
                    Icons.upload,
                    color: kBlueColor,
                  )),
              BottomNavigationBarItem(
                  label: "chat",
                  icon: Icon(Icons.chat),
                  activeIcon: Icon(
                    Icons.chat,
                    color: kBlueColor,
                  )),
              BottomNavigationBarItem(
                  label: "Profile",
                  icon: Icon(Icons.person),
                  activeIcon: Icon(
                    Icons.person,
                    color: kBlueColor,
                  )),
            ],
          ),
        )),
      
    );
  }
}
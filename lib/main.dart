import 'package:flutter/material.dart';
import 'package:travel_sl/Screens/Hotels.dart';
import 'package:travel_sl/Screens/Places.dart';
import 'package:travel_sl/Screens/Transport.dart';

import 'DATA/Data.dart';

void main() => runApp(
      MyApp(),
    );

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Travel Sri Lanka',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Colors.grey[200],
        ),
        Container(
          height: 250,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(100),
            ),
            gradient: LinearGradient(
              colors: [
                Colors.green[900],
                Colors.green[700],
                Colors.green[500],
              ],
              begin: FractionalOffset.topCenter,
              end: FractionalOffset.bottomCenter,
            ),
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.drag_handle,
                      color: Colors.white,
                    ),
                    Icon(Icons.account_circle, color: Colors.white)
                  ],
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Center(
                  child: Text(
                    'Travel\nSri Lanka',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 35,
                      fontFamily: 'QuickKiss',
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Material(
                  borderRadius: BorderRadius.circular(100),
                  elevation: 8,
                  color: Colors.white,
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search',
                      hintStyle: TextStyle(
                        color: Colors.green[900],
                      ),
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 25, vertical: 14),
                      border: InputBorder.none,
                      suffixIcon: Material(
                        borderRadius: BorderRadius.circular(100),
                        elevation: 8,
                        color: Colors.grey[100],
                        child: Icon(Icons.search),
                      ),
                    ),
                  ),
                ),
              ),
              Center(
                child: Container(
                  margin: EdgeInsets.only(top: 10),
                  child: TabBar(
                    labelPadding: EdgeInsets.symmetric(horizontal: 10),
                    controller: _tabController,
                    indicatorSize: TabBarIndicatorSize.label,
                    isScrollable: true,
                    tabs: [
                      Tab(
                        child: Text(
                          'Places',
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      Tab(
                        child: Text(
                          'Hotels',
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      Tab(
                        child: Text(
                          'Transport',
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 7,
              ),
              Expanded(
                child: Container(
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      Places(),
                      Hotels(),
                      Transport(),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}

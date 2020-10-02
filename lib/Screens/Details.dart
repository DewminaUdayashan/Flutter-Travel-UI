import 'dart:ui';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:readmore/readmore.dart';
import 'package:travel_sl/DATA/Data.dart';

class PlaceDetails extends StatefulWidget {
  final String name, img, description;

  const PlaceDetails({Key key, this.name, this.img, this.description})
      : super(key: key);

  @override
  _PlaceDetailsState createState() => _PlaceDetailsState();
}

class _PlaceDetailsState extends State<PlaceDetails> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Stack(
      children: [
        Hero(
          tag: widget.img,
          child: Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(widget.img),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.black.withOpacity(1),
                    Colors.black.withOpacity(0.8),
                    Colors.black.withOpacity(0.5),
                    Colors.black.withOpacity(0.1),
                  ],
                  begin: FractionalOffset.bottomCenter,
                  end: FractionalOffset.topCenter,
                ),
              ),
            ),
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios),
              onPressed: () => Navigator.pop(context),
            ),
            actions: [
              Icon(
                Icons.favorite,
                color: Colors.pink,
              ),
              SizedBox(
                width: 16,
              ),
            ],
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  Center(
                    child: FadeInLeft(
                      child: Text(
                        widget.name,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 50,
                          fontFamily: 'QuickKiss',
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  FadeInUp(
                    child: ReadMoreText(
                      widget.description,
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                          color: Colors.white, fontSize: 15, height: 1.4),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  FadeInUp(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _options(
                          icon: Icons.map,
                          text: 'Southern\nProvince',
                        ),
                        SizedBox(
                          width: 50,
                        ),
                        _options(
                          icon: Icons.cloud,
                          text: "24°C",
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  FadeInUp(
                    child: Container(
                      child: StaggeredGridView.countBuilder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        crossAxisCount: 2,
                        itemCount: Data.imgList.length,
                        itemBuilder: (BuildContext context, int index) =>
                            Container(
                          height: 200,
                          width: 150,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                              image: AssetImage(
                                Data.imgList[index],
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                Data.names[index],
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'QuickKiss',
                                  fontSize: 25,
                                ),
                              ),
                            ],
                          ),
                        ),
                        staggeredTileBuilder: (int index) =>
                            new StaggeredTile.fit(1),
                        mainAxisSpacing: 4.0,
                        crossAxisSpacing: 4.0,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 200,
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          child: FadeInUpBig(
            child: Container(
              height: 70,
              width: width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                color: Colors.white,
              ),
              child: Material(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 16,
                    ),
                    Text(
                      'Add To Favourite',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      height: 50,
                      width: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Colors.blue,
                      ),
                      child: Center(
                        child: Text(
                          "BOOK NOW",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 16,
                    ),
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget _options({text, icon}) {
    return Column(
      children: [
        Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.blue,
          ),
          child: Icon(
            icon,
            color: Colors.white,
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    );
  }
}

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:travel_sl/DATA/Data.dart';
import 'package:travel_sl/Screens/Details.dart';

class Places extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(
                height: height * 0.35,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: Data.imgList.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return _placeCard(
                      height: height,
                      width: width,
                      index: index,
                      context: context,
                    );
                  },
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Text(
                'Most Popular',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Material(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                elevation: 10,
                child: Container(
                  width: width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              image: DecorationImage(
                                image: AssetImage(
                                  'assets/img/1.jpg',
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              image: DecorationImage(
                                image: AssetImage(
                                  'assets/img/2.jpg',
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              image: DecorationImage(
                                image: AssetImage(
                                  'assets/img/3.jpg',
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _placeCard({width, height, index, context}) {
    return FadeInRight(
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Hero(
          tag: Data.imgList[index],
          child: Material(
            elevation: 8,
            borderRadius: BorderRadius.circular(15),
            child: InkWell(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PlaceDetails(
                    name: Data.names[index],
                    description: Data.details[index],
                    img: Data.imgList[index],
                  ),
                ),
              ),
              child: Stack(
                children: [
                  Container(
                    height: height * 0.35,
                    width: width * 0.4,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(
                        image: AssetImage(
                          Data.imgList[index],
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    height: height * 0.35,
                    width: width * 0.4,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      gradient: LinearGradient(
                        colors: [
                          Colors.black.withOpacity(0.9),
                          Colors.black.withOpacity(0.2),
                          Colors.white.withOpacity(0.0),
                        ],
                        begin: FractionalOffset.bottomCenter,
                        end: FractionalOffset.topCenter,
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(16),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            Data.names[index],
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

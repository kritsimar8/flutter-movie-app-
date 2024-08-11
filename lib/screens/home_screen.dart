

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:movie_app/components/masked_image.dart';
import 'package:movie_app/components/search_field_widget.dart';
import 'package:movie_app/constants.dart';
import 'package:movie_app/models/movie.dart';

class HomeScreen extends StatefulWidget{
  const HomeScreen({Key? key}) : super(key:key);

  @override 
  State<HomeScreen> createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen> {
  @override 
  Widget build(BuildContext context){
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Constants.kBlackColor,
      extendBody: true,
      body: SizedBox(
        height: screenHeight,
        width: screenWidth,
        child: Stack(
          children:[
             Positioned(
              top: -100,
              left:-100,
              child: Container(
                height:200,
                width:200,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: const Color.fromARGB(92, 9, 251, 211),
                ),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 200,sigmaY: 200),
                  child: Container(
                    height: 200,
                    width: 200,
                    color: Colors.transparent,
                  )
                  )
              ) 
              ),
            Positioned(
              top: screenHeight * 0.5,
              right:-100,
              child: Container(
                height:160,
                width:160,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: const Color.fromARGB(141, 254, 83, 186),
                ),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 200,sigmaY: 200),
                  child: Container(
                    height: 160,
                    width: 160,
                    color: Colors.transparent,
                  )
                  )
              ) 
              ),
            Positioned(
              bottom: -100,
              left:-100,
              child: Container(
                height:160,
                width:160,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: const Color.fromARGB(146, 9, 251, 211),
                ),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 200,sigmaY: 200),
                  child: Container(
                    height: 160,
                    width: 160,
                    color: Colors.transparent,
                  )
                  )
              ) 
              ),
              SafeArea(
                bottom: false,
                child: ListView(
                  primary: true,
                  children: [
                     SizedBox(
                      height: 24,
                    ),
                     Text(
                      'What would you\nlike to watch?',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 28,
                        color: Color.fromARGB(192, 255, 255, 255),
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: 30,),
                    const SearchFieldWidget(padding: EdgeInsets.symmetric(horizontal: 20)
                    ),
                    const SizedBox(height: 39,),
                    Padding(
                      padding: const EdgeInsets.only(left:20.0),
                      child: Text(
                        'New Movies',
                        style: TextStyle(
                          color: Constants.kWhiteColor,
                          fontSize: 17
                        ),
                      ),
                    ),
                     SizedBox(height: 37,),
                     SizedBox(
                      height: 160,
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: newMovies.length,
                        itemBuilder: (context,index){
                          String mask;
                          if(index==0){
                            mask = Constants.kMaskFirstIndex;
                          }else if(index==newMovies.length - 1){
                            mask = Constants.kMaskLastIndex;
                          }else{
                            mask = Constants.kMaskCenter;
                          }
                          return GestureDetector(
                            child: Container(
                              margin: EdgeInsets.only(
                                left: index == 0 ? 20 : 0,
                              ),
                              height: 160,
                              width: 142,
                              child: MaskedImage(
                                asset: newMovies[index].moviePoster,
                                mask : mask,
                              ),
                            )
                          );
                        }
                        ),
                    ),
                    SizedBox(height: 38,),
                      Padding(
                      padding: const EdgeInsets.only(left:20.0),
                      child: Text(
                        'Upcoming Movies',
                        style: TextStyle(
                          color: Constants.kWhiteColor,
                          fontSize: 17
                        ),
                      ),
                    ),
                     SizedBox(height: 37,),
                     SizedBox(
                      height: 160,
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: upcomingMovies.length,
                        itemBuilder: (context,index){
                          String mask;
                          if(index==0){
                            mask = Constants.kMaskFirstIndex;
                          }else if(index==upcomingMovies.length - 1){
                            mask = Constants.kMaskLastIndex;
                          }else{
                            mask = Constants.kMaskCenter;
                          }
                          return GestureDetector(
                            child: Container(
                              margin: EdgeInsets.only(
                                left: index == 0 ? 20 : 0,
                              ),
                              height: 160,
                              width: 142,
                              child: MaskedImage(
                                asset: upcomingMovies[index].moviePoster,
                                mask : mask,
                              ),
                            )
                          );
                        }
                        ),
                    ),
                    const SizedBox(height: 16,)
                  ]
                )
                )
          ]
        ),
      ),
      floatingActionButton: Container(
        height: 64,
        width: 64,
        padding: const EdgeInsets.all(4),
        margin: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Constants.kPinkColor,
              Constants.kGreenColor
            ]
          )
        ),
        child: Container(
          height: 60,
          width: 60,
          padding: const EdgeInsets.all(0.1),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Constants.kPinkColor,
                Constants.kGreenColor
              ]
            )
          ),
          child: RawMaterialButton(onPressed: (){},
          shape: const CircleBorder(),
          fillColor: const Color(0xff404c57),
          child: SvgPicture.asset(Constants.kIconPlus),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: GlassmorphicContainer(
        width: screenWidth,
        height: 92,
        borderRadius: 0,
        linearGradient:const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors:[
            Color.fromARGB(3, 255, 255, 255),
            Color.fromARGB(5, 255, 255, 255)
          ]
        ),
        border: 0,
        blur: 30,
        borderGradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors:[
            Constants.kPinkColor,
            Constants.kGreenColor,
          ]
        ),
        child: BottomAppBar(
          color: Colors.transparent,
          notchMargin: 4,
          elevation: 0,
          child: Row(children: [
            Expanded(child: IconButton(
              onPressed: (){},
              icon: SvgPicture.asset(Constants.kIconHome),
            )),
            Expanded(child: IconButton(
              onPressed: (){},
              icon: SvgPicture.asset(Constants.kIconPlayOnTv),
            )),
            Expanded(child: Text(''), 
            ),
            Expanded(child: IconButton(
              onPressed: (){},
              icon: SvgPicture.asset(Constants.kIconCategories),
            )),
            Expanded(child: IconButton(
              onPressed: (){},
              icon: SvgPicture.asset(Constants.kIconDownload),
            )),
          ],),
        ),
      ),

    );
  }
}
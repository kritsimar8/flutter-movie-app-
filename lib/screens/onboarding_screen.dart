

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:movie_app/components/custom_outline.dart';
import 'package:movie_app/constants.dart';

class OnboardingScreen extends StatelessWidget{
  const OnboardingScreen({Key? key}) : super (key:key);

  @override 
  Widget build(BuildContext context){
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Constants.kBlackColor,
      body: SizedBox( 
        width: screenWidth,
        height: screenHeight,
        child:Stack(
          children:[
            Positioned(
              top: screenHeight * 0.1,
              left:-86,
              child: Container(
                height:160,
                width:160,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Constants.kPinkColor,
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
              top: screenHeight * 0.3,
              right:-100,
              child: Container(
                height:160,
                width:160,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Constants.kGreenColor,
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
              SafeArea(child:
              Center(
                child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: screenHeight *0.08,),
                    Container(
                      height: 200,
                      width: 200,
                      decoration: BoxDecoration(
                        border: const GradientBoxBorder(
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end:Alignment.bottomRight,
                            colors: [
                            Constants.kPinkColor,
                             Color.fromARGB(15, 254, 83, 186),
                              Color.fromARGB(28, 9, 251, 211),
                             Constants.kGreenColor,
                    
                          ],
                          stops: [0.2,0.4,0.6,1]
                          ),
                          width: 1
                           ),
                           borderRadius: BorderRadius.circular(100)
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Container(
                          width: 300,
                          height: 300,
                          child: const Image(image: AssetImage('assets/img-onboarding.png')))
                      )
                    ),
                    SizedBox(height: screenHeight * 0.09,),
                    Text('Watch movies in\n Virtual Reality',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Constants.kWhiteColor.withOpacity(0.7),
                      fontSize: screenHeight <= 667? 18 : 34,
                      fontWeight: FontWeight.w700,
                    ),
                    ),
                    SizedBox(height: screenHeight * 0.05,),
                    Text(
                      'Download and watch offline\n wherever you are',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Constants.kWhiteColor.withOpacity(0.7),
                        fontSize: screenHeight <= 667 ? 12 : 16,
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.03,),
                       Container(
                      height: 38,
                      width: 160,
                      decoration: BoxDecoration(
                        border: const GradientBoxBorder(
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end:Alignment.bottomRight,
                            colors: [
                             Color.fromARGB(255, 254, 83, 186),
                              Color.fromARGB(255, 9, 251, 211),      
                          ],
                         
                          ),
                          width: 1
                           ),
                           borderRadius: BorderRadius.circular(100)
                      ),
                      child: Container(
                        decoration:  BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          gradient:const LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Color.fromARGB(80, 254, 83, 186),
                              Color.fromARGB(59, 9, 251, 211),
                            ]
                          )
                
                        ),
                        child: const Center(
                          child: Text(
                            'Sign Up',
                            style: TextStyle(
                              fontSize: 14,
                              color: Constants.kWhiteColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        3,
                        (index){
                          return Container(
                            height: 7,
                            width: 7,
                            margin: const EdgeInsets.symmetric(horizontal: 4),
                            decoration:  BoxDecoration(
                              shape: BoxShape.circle,
                              color: index ==0 ? Constants.kGreenColor : Constants.kWhiteColor
                            ),
                          );
                        }),
                    ),
                    SizedBox(height: screenHeight * 0.03,)
                  ],
                ),
              ) 
              )
          ]
        )
      ),
    );
  }
}
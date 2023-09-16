import 'package:f_commerce/utils/colors.dart';
import 'package:flutter/material.dart';

import '../../constants/common_functions.dart';


class AuthScreen extends StatefulWidget {
   AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool isLogin = false;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    final style = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
       shadowColor: Colors.black,
        elevation: 0.2,
        backgroundColor: white,
        title:  Image(
          image:const AssetImage('assets/images/amazon_logo.png',),
        height:height*0.04 ,),centerTitle: true,),
      body: SafeArea(
        child: Container(
          height: height,
          width: width,
          padding: EdgeInsets.symmetric(horizontal:width*0.03 ,vertical: height*0.02),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // section one
              Text('Welcome',style: style.displaySmall!.copyWith(
                fontWeight: FontWeight.w600
              ),),
              CommonFunctions.blankSpace(height*0.02, 0.0),
              // section two 'login || sign up'
              Container(
                width: width,
                decoration: BoxDecoration(
                  border: Border.all(color: greyShade3),
                ),
                child: Column(
                  children: [
                    // create account
                    Container(
                      height: height*0.06,
                      padding: EdgeInsets.symmetric(horizontal: width *0.02),
                      decoration: BoxDecoration(
                        color: greyShade1,
                        border: Border(bottom: BorderSide(color: greyShade3),)
                      ),
                      child: Row(
                      children: [
                        InkWell(
                          onTap: (){
                            setState(() {
                              isLogin = true;
                            });
                          },
                          child: Container(
                            height: height * 0.03,
                            width: height * 0.03,
                           alignment: Alignment.center,
                            decoration: BoxDecoration(
                              border: Border.all(color: grey),
                              shape: BoxShape.circle,
                            ),
                            child: Icon(Icons.circle,
                              size: height * 0.020,
                              color:!isLogin? transparent:secondaryColor,
                            ),
                          ),
                        ),
                        CommonFunctions.blankSpace(0.0, width*0.02),
                        RichText(text: TextSpan(
                            children: [
                              TextSpan(text: 'Create account.',style: style.bodyMedium!.
                              copyWith(fontWeight: FontWeight.bold),),
                              TextSpan(text:' ',style: style.bodyMedium),
                              TextSpan(text:'Now to amazon?',style: style.bodyMedium),
                            ]
                        )),
                      ],
                    ),),
                    Container(
                      width: width,
                      padding: EdgeInsets.symmetric(horizontal: width*0.03,
                          vertical:height*0.01 ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              InkWell(
                                onTap: (){
                                  setState(() {
                                    isLogin = false;
                                  });
                                },
                                child: Container(
                                  height: height * 0.03,
                                  width: height * 0.03,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: grey),
                                    shape: BoxShape.circle,
                                  ),
                                  child: Icon(Icons.circle,
                                    size: height * 0.020,
                                    color:!isLogin? secondaryColor:transparent,
                                  ),
                                ),
                              ),
                              CommonFunctions.blankSpace(0.0, width*0.02),
                              RichText(text: TextSpan(
                                  children: [
                                    TextSpan(text: 'Sign in. ',style: style.bodyMedium!.
                                    copyWith(fontWeight: FontWeight.bold),),
                                    TextSpan(text:'Already customer?',style: style.bodyMedium),
                                  ]
                              )),
                            ],
                          ),
                          CommonFunctions.blankSpace(height*0.01, 0.0),

                          // mobile number
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

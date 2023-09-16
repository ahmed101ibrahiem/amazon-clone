import 'package:country_picker/country_picker.dart';
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
  String countryCode = '+20';
  TextEditingController mobilController = TextEditingController();
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
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // section one
                Text('Welcome',style: style.displaySmall!.copyWith(
                  fontWeight: FontWeight.w600
                ),),

                CommonFunctions.blankSpace(height*0.02, 0.0),
                // section two 'login || sign up'
                Builder(builder: (context) {
                  if(isLogin){
                    return createAccountWidget(width, height, style, context);
                  }
                  return signInWidget(width, height, style, context);
                },),

                // section three
                CommonFunctions.blankSpace(height*0.05, 0.0),
                BottomAuthScreen(height: height, style: style)
              ],
            ),
          ),
        ),
      ),
    );
  }
  Container createAccountWidget(double width, double height, TextTheme style, BuildContext context) {
    return Container(
      width: width,
      decoration: BoxDecoration(
        border: Border.all(color: greyShade3),
      ),
      child: Column(
        children: [
          // create account
          Container(
            width: width,
            padding: EdgeInsets.symmetric(horizontal: width*0.02,
                vertical:height*0.01 ),
            child: Column(
              children: [
                Row(
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
                          color:isLogin? secondaryColor:transparent,
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
                    ))
                  ],
                ),
                CommonFunctions.blankSpace(height*0.01, 0.0),
                SizedBox(
                  height: height*0.06,
                  width: width,
                  child: TextFormField(
                    controller: mobilController,
                    keyboardType: TextInputType.phone,
                    cursorColor: secondaryColor,

                    style: style.displaySmall,
                    decoration: InputDecoration(
                      hintText: 'First and last name',
                      hintStyle: style.bodySmall,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6.0),
                        borderSide: BorderSide(color: grey),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6.0),
                        borderSide: const BorderSide(color: secondaryColor),
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6.0),
                        borderSide: BorderSide(color: grey),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6.0),
                        borderSide: BorderSide(color: grey),
                      ),
                    ),
                  ),
                ),
                CommonFunctions.blankSpace(height*0.01, 0.0),
                // mobile number
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // country code
                    InkWell(
                      onTap: (){
                        showCountryPicker(context: context, onSelect: (value) {
                          setState(() {
                            countryCode = '+${value.phoneCode}';
                          });
                        },);
                      },
                      child: Container(
                        height:height* 0.06,
                        width: width*0.2,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: greyShade2,
                            borderRadius: BorderRadius.circular(6.0),
                            border: Border.all(color: grey)
                        ),
                        child: Text(countryCode,style: style.displaySmall!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),),
                      ),
                    ),
                    // phone number
                    SizedBox(
                      height: height*0.06,
                      width: width * 0.65,
                      child: TextFormField(
                        controller: mobilController,
                        keyboardType: TextInputType.phone,
                        cursorColor: secondaryColor,

                        style: style.displaySmall,
                        decoration: InputDecoration(
                          hintText: 'Mobile number',
                          hintStyle: style.bodySmall,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6.0),
                            borderSide: BorderSide(color: grey),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6.0),
                            borderSide: const BorderSide(color: secondaryColor),
                          ),
                          disabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6.0),
                            borderSide: BorderSide(color: grey),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6.0),
                            borderSide: BorderSide(color: grey),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                CommonFunctions.blankSpace(height*0.02, 0.0),
                Text('''By encoding your mobile phone number, you concent to receive automated security notifications via text message from Amazon.
Message and data rates may apply.''',style: style.bodySmall,),
                CommonFunctions.blankSpace(height*0.02, 0.0),
                // continue button
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: amber,
                    // padding: const EdgeInsets.all(8.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6.0),
                    ),
                    minimumSize: Size(width*0.88,height * 0.058),
                  ),
                  onPressed: (){}, child: Text(
                  'Continue',style: style.displaySmall,
                ),),
                CommonFunctions.blankSpace(height*0.02, 0.0),
                RichText(text:  TextSpan(
                    children:[
                      TextSpan(text:'By Continuing you agree to Amazon\'s ',style: style.labelMedium),
                      TextSpan(text:'Condition of use ',style: style.labelMedium!.copyWith(color: blue)),
                      TextSpan(text:'and ',style: style.labelMedium),
                      TextSpan(text:'Private Notice',style: style.labelMedium!.copyWith(color: blue)),
                    ]
                ),),
              ],
            ),
          ),
          Container(
            height: height*0.06,
            padding: EdgeInsets.symmetric(horizontal: width *0.02),
            decoration: BoxDecoration(
                color: greyShade1,
                border: Border(top: BorderSide(color: greyShade3),)
            ),
            child: Row(
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
                      color:isLogin? transparent:secondaryColor,
                    ),
                  ),
                ),
                CommonFunctions.blankSpace(0.0, width*0.02),
                RichText(text: TextSpan(
                    children: [
                      TextSpan(text: 'Sign in. ',style: style.bodyMedium!.
                      copyWith(fontWeight: FontWeight.bold),),
                      TextSpan(text:'Already a customer?',style: style.bodyMedium),
                    ]
                )),
              ],
            ),),



        ],
      ),
    );
  }


  Container signInWidget(double width, double height, TextTheme style, BuildContext context) {
    return Container(
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // country code
                              InkWell(
                                onTap: (){
                                  showCountryPicker(context: context, onSelect: (value) {
                                    setState(() {
                                      countryCode = '+${value.phoneCode}';
                                    });
                                  },);
                                },
                                child: Container(
                                  height:height* 0.06,
                                  width: width*0.2,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      color: greyShade2,
                                      borderRadius: BorderRadius.circular(6.0),
                                      border: Border.all(color: grey)
                                  ),
                                  child: Text(countryCode,style: style.displaySmall!.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),),
                                ),
                              ),
                              // phone number
                              SizedBox(
                                height: height*0.06,
                                width: width * 0.65,
                                child: TextFormField(
                                  controller: mobilController,
                                  keyboardType: TextInputType.phone,
                                  cursorColor: secondaryColor,

                                  style: style.displaySmall,
                                  decoration: InputDecoration(
                                    hintText: 'Mobile number',
                                    hintStyle: style.bodySmall,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(6.0),
                                      borderSide: BorderSide(color: grey),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(6.0),
                                      borderSide: const BorderSide(color: secondaryColor),
                                    ),
                                    disabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(6.0),
                                      borderSide: BorderSide(color: grey),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(6.0),
                                      borderSide: BorderSide(color: grey),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                          CommonFunctions.blankSpace(height*0.02, 0.0),
                          // continue button
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: amber,
                              // padding: const EdgeInsets.all(8.0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6.0),
                              ),
                              minimumSize: Size(width*0.88,height * 0.058),
                            ),
                            onPressed: (){}, child: Text(
                            'Continue',style: style.displaySmall,
                          ),),
                          CommonFunctions.blankSpace(height*0.02, 0.0),
                          // text
                          RichText(text:  TextSpan(
                              children:[
                                TextSpan(text:'By Continuing you agree to Amazon\'s ',style: style.labelMedium),
                                TextSpan(text:'Condition of use ',style: style.labelMedium!.copyWith(color: blue)),
                                TextSpan(text:'and ',style: style.labelMedium),
                                TextSpan(text:'Private Notice',style: style.labelMedium!.copyWith(color: blue)),
                              ]
                          ),),
                        ],
                      ),
                    ),
                  ],
                ),
              );
  }
}




class BottomAuthScreen extends StatelessWidget {
  const BottomAuthScreen({
    super.key,
    required this.height,
    required this.style,
  });

  final double height;
  final TextTheme style;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // divider
        Container(
          height: 2,
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [white,greyShade3,white])
          ),
        ),
        CommonFunctions.blankSpace(height*0.02, 0.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
          Text('Condition of Use',style: style.bodySmall!.copyWith(color: blue),),
          Text('Privacy Notice',style: style.bodySmall!.copyWith(color: blue),),
          Text('Help',style: style.bodySmall!.copyWith(color: blue),),
        ],),
        CommonFunctions.blankSpace(height*0.01, 0.0),
        Text('© 1996-2023, Amazon.com, Inc.or its affiliates',style: style.labelSmall!.copyWith(
          color: grey
        ),)
      ],
    );
  }
}

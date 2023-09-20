import 'package:f_commerce/constants/common_functions.dart';
import 'package:f_commerce/view/auth_screen/widgets/bottom_auth_widger.dart';
import 'package:f_commerce/view/auth_screen/widgets/button_auth_widget.dart';
import 'package:flutter/material.dart';

import '../../utils/colors.dart';

class OtpScreen extends StatelessWidget {
   OtpScreen({Key? key,required this.phoneNumber}) : super(key: key);
   final String phoneNumber;
  TextEditingController otpController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    final style = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
       // shadowColor: Colors.black,
        elevation: 0.2,
        backgroundColor: white,
        title:  Image(
          image:const AssetImage('assets/images/amazon_logo.png',),
          height:height*0.04 ,),centerTitle: true,),
      body: SafeArea(
        child: Container(
          height: height,
          width: width,
          padding: EdgeInsets.symmetric(horizontal: height*0.03
              ,vertical: width*0.02),
          child: SingleChildScrollView(
            child: Column(
              children: [
                // section 1
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Authentication required',style: style.displaySmall!.copyWith(
                        fontWeight: FontWeight.w600
                    ),),
                    CommonFunctions.blankSpace(height*0.02, 0.0),
                    RichText(text: TextSpan(children: [
                      TextSpan(text: '+201128047605 ',style: style.bodyMedium!.copyWith(
                          fontWeight: FontWeight.w500
                      ),),
                       TextSpan(text: 'change',style: style.bodyMedium!.copyWith(
                          fontWeight: FontWeight.w400))
                    ])),
                    CommonFunctions.blankSpace(height*0.02, 0.0),
                    Text('''We have sent a One Time Password (OTP) to the mobile number above. Please enter it to complete verification''',style: style.bodySmall,),

                    CommonFunctions.blankSpace(height*0.02, 0.0), // continue button
                    SizedBox(
                      height: height*0.06,
                      width: width,
                      child: TextFormField(
                        controller: otpController,
                        keyboardType: TextInputType.phone,
                        cursorColor: secondaryColor,
                        style: style.displaySmall,
                        decoration: InputDecoration(
                          hintText: 'Enter OTP',
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
                    CommonFunctions.blankSpace(height*0.02, 0.0), // continue button
                    ButtonAuthWidget(width: width, height: height, style: style),
                  ],
                ),
                // section 2
                CommonFunctions.blankSpace(height*0.02, 0.0),
                TextButton(onPressed: (){},child:Text ('Resend OTP',style: style.bodySmall!.copyWith(color: blue)),),
                CommonFunctions.blankSpace(height*0.02, 0.0),
                BottomAuthScreen(height: height, style: style)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

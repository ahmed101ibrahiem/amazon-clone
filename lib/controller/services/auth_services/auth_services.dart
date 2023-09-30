
import 'dart:developer';
import 'package:f_commerce/view/auth_screen/otp_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class AuthServices{
  static receiveOTP({required BuildContext context,required String phoneNumber}){
    FirebaseAuth auth = FirebaseAuth.instance;
    try{
      auth.verifyPhoneNumber(
          verificationCompleted: (PhoneAuthCredential credential) {
            log(credential.toString());
          },
          verificationFailed: (FirebaseAuthException exception) {
            log(exception.toString());
          },
          codeSent: (String verificationId,  int? resendingToken) {
            Navigator.push(context, PageTransition(
                child: OtpScreen(phoneNumber: phoneNumber), type: PageTransitionType.rightToLeft));
          },
          codeAutoRetrievalTimeout: (String verificationId) {

          },);
    }
    catch(e){
      log(e.toString());
    }
  }
}
import 'package:f_commerce/utils/theme.dart';
import 'package:f_commerce/view/auth_screen/auth_screen.dart';
import 'package:f_commerce/view/auth_screen/otp_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Amazon Clone',
      theme: theme,
      debugShowCheckedModeBanner: false,
      home:    OtpScreen(phoneNumber: '+201129045605'),
    );
  }
}

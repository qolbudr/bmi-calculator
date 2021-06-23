import 'dart:async';
import 'package:flutter/material.dart';
import 'home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		return MaterialApp(
			title: "Kalkulator BMI",
			debugShowCheckedModeBanner: false,
			theme: ThemeData(
				primaryColor: Colors.blue,
				fontFamily: 'Poppins'
			),
			home: SplashScreen()
		);
	}
}

class SplashScreen extends StatefulWidget {
	@override
	_SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
	var _duration = Duration(seconds: 2);

	void initState() {
		super.initState();
		Timer(_duration, () {
			Navigator.pushReplacement(
				context,
				MaterialPageRoute(
					builder: (BuildContext context) {
						return Home();
					}
				)
			);
		});
	}

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			body: Column(
				children: [
					Expanded(
						child: Center(
							child: Image.asset('assets/images/icon.png', width: 80)
						),
					)
				]
			)
		);
	}
}
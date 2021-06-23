import 'package:flutter/material.dart';
import 'package:bmi/model/person_model.dart';

class Result extends StatefulWidget {
	final Person person;
	Result(this.person);

	@override
	_ResultState createState() => _ResultState();
}

class _ResultState extends State<Result> {
	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(
				elevation: 0,
				backgroundColor: Colors.transparent,
				iconTheme: IconThemeData(
					color: Colors.black
				)
			),
			body: Container(
				width: MediaQuery.of(context).size.width,
				height: MediaQuery.of(context).size.height,
				child: Center(
				  child: SingleChildScrollView(
				  	child: Center(
				  	  child: Column(
				      	crossAxisAlignment: CrossAxisAlignment.center,
				      	mainAxisAlignment: MainAxisAlignment.center,
				      	children: [
				      		Image.asset('assets/images/doctor.webp', width: 250),
				      		Text("BMI Anda", style: TextStyle(fontSize: 18)),
				      		Text(widget.person.bmi.toStringAsFixed(2), style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
				      		SizedBox(height: 20),
				      		Text(widget.person.status, textAlign: TextAlign.center),
				      		SizedBox(height: 30),
				      	]
				      ),
				  	),
				  ),
				),
			)
		);
	}
}
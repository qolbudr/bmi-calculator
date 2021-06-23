import 'package:flutter/material.dart';
import 'package:bmi/model/gender_model.dart';
import 'package:bmi/model/person_model.dart';
import 'package:bmi/result.dart';

class Home extends StatefulWidget {
	@override
	_HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
	Person _person = Person();
	double _umur = 20;
	double _berat = 48;
	double _tinggi = 160;
	int genderType;

	@override
	Widget build(BuildContext context) {
		Size size = MediaQuery.of(context).size;
		return Scaffold(
			body: Stack(
			  children: [
			    SafeArea(
			    	child: SingleChildScrollView(
			    		child: Container(
			    		  padding: size.width < 1024 ? EdgeInsets.all(15) : EdgeInsets.symmetric(vertical: 15, horizontal: size.width * 0.2),
			    		  child: Column(
			    		  	crossAxisAlignment: CrossAxisAlignment.start,
			    		    	children: [
			    	    		Row(
			    	    			children: [
			    	    				Text("BMI", style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold)),
			    	    				SizedBox(width: 5),
			    	    				Text("Kalkulator", style: TextStyle(fontSize: 20))
			    	    			],
			    	    		),
			    		  		SizedBox(height: 25),
			    		  		Text("Jenis Kelamin"),
			    		  		SizedBox(height: 10),
			    		  	   Row(
			    		  	    	children: [
			    		  	    		Expanded(
			    		  	    			child: GenderRadio(model: gender[0], onTap: () {
			    		  	    				setState(() {
			    		  	    					gender.forEach((element) =>  element.isSelected = false);
			    		  	    					gender[0].isSelected = true;
			    		  	    					genderType = 0;
			    		  	    				});
			    		  	    			}),
			    		  	    		),
			    		  	    		Expanded(
			    		  	    			child: GenderRadio(model: gender[1], onTap: () {
			    		  	    				setState(() {
			    		  	    					gender.forEach((element) =>  element.isSelected = false);
			    		  	    					gender[1].isSelected = true;
			    		  	    					genderType = 1;
			    		      				});
			    		      			}),
			    		      		),
			    		      	]
			    	      	),
			    	      	SizedBox(height: 20),
			    	      	SectionControl(
			    	      		title: "Umur",
			    	      		value: _umur,
			    	      		increase: () => setState(() => _umur++),
			    	      		decrease: () => setState(() => _umur--),
			    	      	),
			    	      	SizedBox(height: 5),
			    	      	SectionControl(
			    	      		title: "Berat Badan (Kg)",
			    	      		value: _berat,
			    	      		increase: () => setState(() => _berat++),
			    	      		decrease: () => setState(() => _berat--),
			    	      	),
			    	      	SizedBox(height: 5),
			    	      	SectionControl(
			    	      		title: "Tinggi Badan (Cm)",
			    	      		value: _tinggi,
			    	      		increase: () => setState(() => _tinggi++),
			    	      		decrease: () => setState(() => _tinggi--),
			    	      	),
			    	      	size.height < 600 ? SizedBox(height: 100) : SizedBox()
			    	    	]),
			    		),
			    	),
			    ),
			    Align(
			    	alignment: Alignment.bottomCenter,
			    	child: Container(
			    		padding: size.width < 1024 ? EdgeInsets.all(15) : EdgeInsets.symmetric(vertical: 15, horizontal: size.width * 0.2),
			    		width: double.infinity,
			    		height: 80,
			    		child: ElevatedButton(
			    			onPressed: () {
			    				try {
			    					if(genderType != null) {
			    						_person.height = _tinggi;
				    					_person.weight = _berat;
				    					_person.age = _umur;
				    					_person.gender = genderType;
				    					_person.bmi;
				    					Navigator.push(context, MaterialPageRoute(
				    						builder: (context) {
				    							return Result(_person);
				    						}
				    					));
				    				} else {
				    					ScaffoldMessenger.of(context).showSnackBar(
				    						SnackBar(
										      content: Text("Silahkan pilih jenis kelamin"),
										      action: SnackBarAction(
										        label: 'Okay',
										        onPressed: () {
										        },
										      ),
										   )
				    					);
				    				}
			    				} catch (e) {
			    					ScaffoldMessenger.of(context).showSnackBar(
			    						SnackBar(
									      content: Text(e.toString()),
									      action: SnackBarAction(
									        label: 'Okay',
									        onPressed: () {
									        },
									      ),
									   )
			    					);
			    				}
			    			},
			    			child: Text("Hitung"),
			    			style: ButtonStyle(
			    				elevation: MaterialStateProperty.all<double>(0),
			    			)
			    		),
			    	),
			    ),
			  ],
			),
		);
	}
}

class GenderRadio extends StatelessWidget {
	final Gender model;
	final void Function() onTap;
	GenderRadio({this.model, this.onTap});
	@override
	Widget build(BuildContext context) {
		return Card(
			elevation: 0,
			color: model.isSelected ? Colors.blue : Colors.white,
			child: InkWell(
				onTap: onTap,
				child: Padding(
					padding: EdgeInsets.all(20),
					child: Column(
						children: [
							Image.asset(model.type ==  1 ? 'assets/images/man.png' : 'assets/images/women.png',
								width: 50
							),
							SizedBox(height: 20),
							Text(
								model.type == 1 ? "Pria" : "Wanita", 
								style: TextStyle(
									fontSize: 14,
									color: model.isSelected ? Colors.white : Colors.black,
								)
							),
						],
					)
				),
			),
		);
	}
}

class SectionControl extends StatelessWidget {
	final String title;
	final double value;
	final void Function() increase;
	final void Function() decrease;
	SectionControl({this.title, this.value, this.increase, this.decrease});

	@override
	Widget build(BuildContext context) {
		return Card(
   		elevation: 0,
			child: Padding(
				padding: EdgeInsets.all(15),
				child: Row(
					mainAxisAlignment: MainAxisAlignment.center,
					children: [
						Expanded(
							child: Text(title, style: TextStyle(fontSize: 15)),
						),
						Row(
							children: [
								InkWell(
									onTap: decrease,
									child: Icon(Icons.remove, color: Colors.blue)
								),
								SizedBox(width: 10),
								Text(value.toInt().toString(), style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
								SizedBox(width: 10),
								InkWell(
									onTap: increase,
									child: Icon(Icons.add, color: Colors.blue)
								),
							],
						)
					]
				),
			),
		);
	}
}

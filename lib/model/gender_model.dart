class Gender {
	bool isSelected;
	final int type;

	Gender({this.type, this.isSelected});
}

List<Gender> gender = [
	Gender(type: 1, isSelected: false),
	Gender(type: 0, isSelected: false),
];
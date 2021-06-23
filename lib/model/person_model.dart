class Person {
	double _height;
	double _weight;
	double _bmi;
	double age;
	int gender;

	set height(double value) => value < 0 ? _height =  value * -1 : _height =  value;
	set weight(double value) => value < 0 ? _weight =  value * -1 : _weight =  value;

	double get bmi {
		_bmi = _weight / ((_height / 100) * (_height / 100));
		return _bmi;
	}

	String get status {
		List<String> status = [
			"Badan anda terlalu kurus, cobalah makan makanan bergizi ya :)",
			"Badan anda normal, tetap jaga kesehatan biar nggak sakit ya :)",
			"Badan anda gemuk, coba untuk mengurangi makanan berlemak :)",
			"Anda mengalami obesitas, coba untuk melakukan diet dengan rutin :)"
		];

		if(age > 20 && gender == 0) {
			if(_bmi < 17) {
				return status[0];
			} else if (_bmi >= 17 && _bmi <= 23) {
				return status[1];
			} else if (_bmi >= 24 && _bmi <= 27) {
				return status[2];
			} else {
				return status[3];
			}
		} else if (age > 20 && gender == 1) {
			if(_bmi < 18) {
				return status[0];
			} else if (_bmi >= 18 && _bmi <= 25) {
				return status[1];
			} else if (_bmi >= 25 && _bmi <= 27) {
				return status[2];
			} else {
				return status[3];
			}
		} else {
			if(age < 12 && gender == 1) {
				if(_bmi < 13.5) {
					return status[0];
				} else if (_bmi >= 13.5 && _bmi <= 17.9) {
					return status[1];
				} else if (_bmi >= 18.0 && _bmi <= 19.5) {
					return status[2];
				} else {
					return status[3];
				}
			} else if(age < 12 && gender == 0) {
				if(_bmi < 14.5) {
					return status[0];
				} else if (_bmi >= 14.5 && _bmi <= 17.5) {
					return status[1];
				} else if (_bmi >= 17.6 && _bmi <= 19.5) {
					return status[2];
				} else {
					return status[3];
				}
			} else if(age >= 12 && gender == 0) {
				if(_bmi < 17.4) {
					return status[0];
				} else if (_bmi >= 17.5 && _bmi <= 21.5) {
					return status[1];
				} else if (_bmi >= 21.6 && _bmi <= 26.0) {
					return status[2];
				} else {
					return status[3];
				}
			} else {
				if(_bmi < 16.5) {
					return status[0];
				} else if (_bmi >= 16.5 && _bmi <= 20.5) {
					return status[1];
				} else if (_bmi >= 20.6 && _bmi <= 26.0) {
					return status[2];
				} else {
					return status[3];
				}
			}
		}
	}
}
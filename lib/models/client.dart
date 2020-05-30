import 'package:family/models/signup_state.dart';

class ClientData {
  final String _name;
  final String _ageBracket;
  final String _gender;
  final String _typeOfInsurance;
  final String _emailAddress;
  final String _phoneNumber;
  final String _categoryOfInsurance;
  final String _preffredInsurer;

  ClientData(
      this._name,
      this._ageBracket,
      this._gender,
      this._typeOfInsurance,
      this._emailAddress,
      this._phoneNumber,
      this._categoryOfInsurance,
      this._preffredInsurer);

  String get categoryOfInsurance => _categoryOfInsurance;

  get phoneNumber => _phoneNumber;

  get emailAddress => _emailAddress;

  get typeOfInsurance => _typeOfInsurance;

  get gender => _gender;

  get ageBracket => _ageBracket;

  get name => _name;

  @override
  String toString() {
    return "'Name : $_name \n Age Bracket : $_ageBracket \n Phone number : $_phoneNumber \n Gender $_gender \n Type of Insurance : $_typeOfInsurance"
        "\n Category of Insurance : $_categoryOfInsurance \n Prefered Insurer : $_preffredInsurer' ";
  }

  String get preffredInsurer => _preffredInsurer;
}

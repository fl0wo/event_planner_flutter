class CreditCardModel {
  final String _cardNo, _expiryDate, _cvv, _logo, _name;
  CreditCardModel(
      this._name, this._cardNo, this._logo, this._expiryDate, this._cvv);

  String get cardNo {
    int start_gap = 3;
    int end_gap = 12;

    var fakeCardNo = _cardNo.substring(0, start_gap);
    for (int i = start_gap; i < _cardNo.length - end_gap; i++) {
      fakeCardNo += "*";
    }
    fakeCardNo += _cardNo.substring(_cardNo.length - end_gap, _cardNo.length);

    return fakeCardNo;
  }

  String get logo => _logo;

  String get cvv => _cvv;

  String get name => _name;

  String get expiryDate => _expiryDate;
}

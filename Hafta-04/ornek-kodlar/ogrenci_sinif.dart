class Ogrenci {
  String ad;
  int yas;
  int not1;
  int not2;
  Ogrenci(this.ad, this.yas, this.not1, this.not2);
  double ortalama() {
    return (not1 + not2) / 2;
  }
  void ozet() {
    print("Öğrenci: $ad | Yaş: $yas | Ortalama: \\${ortalama()}");
  }
}
void main() {
  var o = Ogrenci("Deniz", 17, 85, 90);
  o.ozet();
}
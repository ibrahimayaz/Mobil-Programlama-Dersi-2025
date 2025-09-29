class Kitap {
  String ad;
  String yazar;
  int sayfa;
  Kitap(this.ad, this.yazar, this.sayfa);
  void ozet() {
    print("$ad - $yazar (Sayfa: $sayfa)");
  }
}
void main() {
  var k = Kitap("Simyacı", "Paulo Coelho", 190);
  k.ozet();
}
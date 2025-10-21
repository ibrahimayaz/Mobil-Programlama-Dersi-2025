void main() {
  var notlar = [10, 20, 30, 40];
  var toplam = 0;
  var n = 0;
  while (n < notlar.length) {
    toplam += notlar[n]; //toplam=toplam+n;
    n++;
  }
  var o = toplam / notlar.length;
  print("Ortalama: $o");
}

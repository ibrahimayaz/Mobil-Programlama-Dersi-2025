void main() {
  var sayilar = [10, 15, 20, 25];
  var toplam = 0;
  for (var s in sayilar) {
    toplam += s;
  }
  var ort = toplam / sayilar.length;
  print("Sayılar: $sayilar");
  print("Toplam: $toplam | Ortalama: $ort");
}
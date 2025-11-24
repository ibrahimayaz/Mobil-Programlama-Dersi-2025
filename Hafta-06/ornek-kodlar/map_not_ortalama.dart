void main() {
  final notlar = {"Mat": 80, "Türkçe": 90, "Fizik": 70};
  var toplam = 0;
  for (final v in notlar.values) {
    toplam += v;
  }
  print("Ortalama: ${toplam / notlar.length}");
}

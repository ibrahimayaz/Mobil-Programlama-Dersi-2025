void main() {
  var dersNot = {"Mat": 80, "Türkçe": 90, "Fizik": 70};
  var toplam = 0;
  for (var v in dersNot.values) toplam += v;
  print("Ortalama: ${toplam / dersNot.length}");
}

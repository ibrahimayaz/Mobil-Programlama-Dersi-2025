void main() {
  mapOrnekleri();
}

void mapOrnekleri() {
  var notlar = <String, int>{'Ali': 80, 'Ayşe': 90, 'Mehmet': 70};
  var toplam = 0;
  for (var ok in notlar.keys) {
    toplam += notlar[ok]!;
  }
  print('Ortalama: ${toplam / notlar.length}');
}

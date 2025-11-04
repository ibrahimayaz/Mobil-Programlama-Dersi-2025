void main() {
  final notlar = {"Ali": 50, "Ayşe": 85, "Deniz": 92, "İbrahim": 100};

  //Dinamik filtreme ve map oluşturma
  final yuksek = {
    for (final e in notlar.entries)
      if (e.value >= 80) {e.key: e.value}
  };

  print(yuksek);
}

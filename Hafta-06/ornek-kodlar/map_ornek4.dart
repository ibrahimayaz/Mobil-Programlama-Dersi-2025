void main() {
  ornek4();
}

void ornek4() {
  var notlar = {"Ali": 50, "Ayşe": 85, "Deniz": 92, "Mert": 40};
  var yuksek = <String, int>{};
  for (var n in notlar.keys) {
    int not = notlar[n]!;
    if (not >= 80) {
      yuksek[n] = not;
    }
  }
  print(yuksek); // {Ayşe: 85, Deniz: 92}
}

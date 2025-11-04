void main() {
  var notlar = {
    "Ali": 50,
    "Ayşe": 85,
    "Deniz": 92,
    "Mert": 40,
    "Ayşe1": 90,
  };
  var yuksek = <String, int>{};
  notlar.forEach((ad, not) {
    if (not >= 80) yuksek[ad] = not;
  });
  print(yuksek); // {Ayşe: 85, Deniz: 92}
}

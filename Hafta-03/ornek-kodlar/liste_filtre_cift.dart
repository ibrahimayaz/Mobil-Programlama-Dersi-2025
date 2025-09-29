void main() {
  var sayilar = [3, 4, 7, 10, 12, 15, 18];
  var ciftler = <int>[];
  for (var s in sayilar) {
    if (s % 2 == 0) ciftler.add(s);
  }
  print("Çift sayılar: $ciftler");
}
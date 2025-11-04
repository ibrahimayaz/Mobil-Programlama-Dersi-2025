void main() {
  print(toplamCift(1, 50));
}

List ciftSayilar(int min, int max) {
  List ciftSayilar = [];
  for (var i = min; i <= max; i++) {
    if (i % 2 == 0) {
      ciftSayilar.add(i);
    }
  }
  return ciftSayilar;
}

int toplamCift(int min, int max) {
  int toplam = 0;
  for (int i in ciftSayilar(min, max)) {
    toplam += i;
  }
  return toplam;
}

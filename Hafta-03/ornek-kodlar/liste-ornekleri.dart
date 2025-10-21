void main() {
  var sayilar = [10, 20, 2, 5, 89, 5];

  sayilar[1] = 30;

  sayilar.add(99);

  sayilar.insert(1, 99);

  sayilar.removeAt(sayilar.length - 2);
  sayilar.clear();
  print("Sayılar:$sayilar");
}

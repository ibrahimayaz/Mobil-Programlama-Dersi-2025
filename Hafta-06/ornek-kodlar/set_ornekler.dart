void main() {
  var sayilar = <int>{1, 2, 2, 3};
  print(sayilar); // {1, 2, 3}
  sayilar.add(4);
  sayilar.remove(2);
  print(sayilar.contains(3)); // true
  print(sayilar);
}

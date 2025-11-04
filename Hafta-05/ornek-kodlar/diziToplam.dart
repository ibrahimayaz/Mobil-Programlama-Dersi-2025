void main() {
  var sayilar = [10, 53, 5, 9, 8, 7];
  var toplam = 0;
  for (var s in sayilar) {
    toplam += s;
  }
  print(toplam);
}

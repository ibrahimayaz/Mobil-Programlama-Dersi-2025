void main() {
  var sayilar = [12, 5, 27, 3, 18];
  var enBuyuk = sayilar[0];
  var enKucuk = sayilar[0];
  for (var s in sayilar) {
    if (s > enBuyuk) enBuyuk = s;
    if (s < enKucuk) enKucuk = s;
  }
  print("En büyük: $enBuyuk");
  print("En küçük: $enKucuk");
}

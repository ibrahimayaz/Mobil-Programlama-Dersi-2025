void main() {
  var sonuc = polindrom("efe");
  print(sonuc);
}

bool polindrom(String deger) {
  List harfListesi = deger.split("");
  String yeniDeger = "";
  for (var i = harfListesi.length - 1; i >= 0; i--) {
    yeniDeger += harfListesi[i];
  }
  print("$deger -> $yeniDeger");
  if (deger == yeniDeger) {
    return true;
  } else {
    return false;
  }
}

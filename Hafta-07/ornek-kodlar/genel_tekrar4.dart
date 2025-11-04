void main() {
  cumle();
}

//Bir liste tanımlayın. Bu liste 5 elamanlı birer cümle olmalıdır.
//Tanımladığınız listenin içerisindeki en uzun cümleyi bulan dart kodunun fonksiyonunu yazarak çalıştırınız.

String cumle() {
  var cumleListesi = [
    "ayşe lorem muhammedmuhammedmuhammedmuhammed",
    "nazar lorem haaaaarun aya",
    "faruk lorem haaaaarunhaaaaarunhaaaaarunhaaaaarunhaaaaarunhaaaaarun"
  ];
  String enUzunKelime = cumleListesi[0];

  for (var c in cumleListesi)
    if (c.length > enUzunKelime.length) enUzunKelime = c;

  print("$enUzunKelime -> karakter sayısı: ${enUzunKelime.length}");
  return enUzunKelime;
}

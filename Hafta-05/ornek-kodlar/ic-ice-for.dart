void main() {
  icIceForOrnegi();
}

void icIceForOrnegi() {
  /**
   * Aşağıdaki listeyi referans alarak for kullanınız. Listedeki her bir 
   * değerin 4 ile bölünüp 3 ile bölünmeyen sayıları yeni bir listeye 
   * ekleyen dart kodunu yazınız.
   *  **/
  var sayilar = [16, 36, 12, 8, 24, 18, 20];
  var yeniListe = [];
  for (var i = 0; i < sayilar.length; i++) {
    if (sayilar[i] % 4 == 0 && sayilar[i] % 3 != 0) {
      yeniListe.add(sayilar[i]);
    }
  }
  print(yeniListe);
}

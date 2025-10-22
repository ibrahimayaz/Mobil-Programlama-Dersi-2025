/* Birden dokuza kadar olan sayılardan her bir satırda 3 sayı yeralacak 
biçimde ekrana yazdırınız. */

void main() {}

void birdenDokuzaYazdir() {
  var sayi = 1;
  for (var i = 0; i < 3; i++) {
    for (var j = 0; j < 3; j++) {
      print("$sayi ");
      sayi++;
    }
    print("\n");
  }
}

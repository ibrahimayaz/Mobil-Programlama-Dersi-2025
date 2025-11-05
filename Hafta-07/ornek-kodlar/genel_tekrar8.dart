/*
Klavyeden girilen sayıya kadar olan 
çift sayıları toplayan ve sonucu dönderen fonksiyonun dart kodunu yazınız
*/
void main() {
  print(ciftSayilar(25));
}

int ciftSayilar(int s) {
  int toplam = 0;
  for (var i = 0; i <= s; i = i + 2) {
    toplam += i; //toplam=toplam+i;
  }

  return toplam;
}
